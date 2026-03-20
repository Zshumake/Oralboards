import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/exam_models.dart';
import '../models/feedback_model.dart';

/// Calls the Gemini 1.5 Flash API to generate feedback on a candidate's answer.
/// Returns a [FeedbackAnalysis] on success, or an error [String] on failure.
Future<dynamic> generateFeedback(
  String transcript,
  String relevantContext,
  String apiKey,
) async {
  if (apiKey.isEmpty) {
    return 'Please set your API Key in Settings to get AI feedback.';
  }
  if (transcript.trim().isEmpty) {
    return 'Please record or type an answer first.';
  }

  final wordCount = transcript.trim().split(RegExp(r'\s+')).length;

  final prompt = '''
You are an expert PM&R Oral Boards examiner and communication coach.
Analyze the candidate's answer (Transcript) against the Model Answer (Context).

Context (Model Answer):
$relevantContext

Transcript (Candidate's Answer):
$transcript
(Approx word count: $wordCount)

Return a valid JSON object with the following structure (do NOT return markdown formatting like \`\`\`json):
{
  "delivery": {
    "wpm": number (Estimate words per minute based on transcript length, assuming average speaking speed if unknown, or just analyze text flow),
    "fillerWords": ["um", "uh", "like", "so"],
    "concisenessScore": number (0-10),
    "tone": string (e.g., "Confident", "Hesitant", "Rushed")
  },
  "content": {
    "score": number (0-10),
    "missedConcepts": ["Concept 1", "Concept 2"],
    "redFlags": ["Any dangerous omissions or safety violations"]
  },
  "goldenResponse": "A rewritten, perfect version of the candidate's answer using their logic but professional medical terminology and structure."
}
''';

  try {
    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=$apiKey',
    );

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'contents': [
          {
            'parts': [
              {'text': prompt}
            ]
          }
        ]
      }),
    );

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    if (data.containsKey('error')) {
      final errorMsg = (data['error'] as Map<String, dynamic>)['message'];
      throw Exception(errorMsg);
    }

    final textResponse =
        data['candidates'][0]['content']['parts'][0]['text'] as String;

    final parsed = FeedbackAnalysis.tryParse(textResponse);
    if (parsed != null) {
      return parsed;
    }
    return 'Error: Could not parse AI response.';
  } catch (e) {
    return 'Error generating feedback: $e';
  }
}

/// Sends a multi-turn exam conversation to Gemini and returns structured output.
/// Returns an [ExaminerTurnResult] on success, or an error [String] on failure.
Future<dynamic> sendExamTurn({
  required String apiKey,
  required String systemInstruction,
  required List<Map<String, dynamic>> contents,
}) async {
  if (apiKey.isEmpty) {
    return 'Please set your API Key in Settings to use Exam Mode.';
  }

  try {
    final uri = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=$apiKey',
    );

    final response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'systemInstruction': {
          'parts': [
            {'text': systemInstruction}
          ]
        },
        'contents': contents,
        'generationConfig': {
          'responseMimeType': 'application/json',
        },
      }),
    );

    final data = jsonDecode(response.body) as Map<String, dynamic>;

    if (data.containsKey('error')) {
      final errorMsg = (data['error'] as Map<String, dynamic>)['message'];
      throw Exception(errorMsg);
    }

    final textResponse =
        data['candidates'][0]['content']['parts'][0]['text'] as String;

    final parsed = ExaminerTurnResult.tryParse(textResponse);
    if (parsed != null) {
      return parsed;
    }
    return 'Error: Could not parse examiner response.';
  } catch (e) {
    return 'Error in exam conversation: $e';
  }
}
