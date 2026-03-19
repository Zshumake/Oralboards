import 'dart:convert';

class DeliveryMetrics {
  final int wpm;
  final List<String> fillerWords;
  final int concisenessScore;
  final String tone;

  const DeliveryMetrics({
    required this.wpm,
    required this.fillerWords,
    required this.concisenessScore,
    required this.tone,
  });

  factory DeliveryMetrics.fromJson(Map<String, dynamic> json) {
    return DeliveryMetrics(
      wpm: (json['wpm'] as num).toInt(),
      fillerWords: List<String>.from(json['fillerWords'] ?? []),
      concisenessScore: (json['concisenessScore'] as num).toInt(),
      tone: json['tone'] as String,
    );
  }
}

class ContentMetrics {
  final int score;
  final List<String> missedConcepts;
  final List<String> redFlags;

  const ContentMetrics({
    required this.score,
    required this.missedConcepts,
    required this.redFlags,
  });

  factory ContentMetrics.fromJson(Map<String, dynamic> json) {
    return ContentMetrics(
      score: (json['score'] as num).toInt(),
      missedConcepts: List<String>.from(json['missedConcepts'] ?? []),
      redFlags: List<String>.from(json['redFlags'] ?? []),
    );
  }
}

class FeedbackAnalysis {
  final DeliveryMetrics delivery;
  final ContentMetrics content;
  final String goldenResponse;

  const FeedbackAnalysis({
    required this.delivery,
    required this.content,
    required this.goldenResponse,
  });

  factory FeedbackAnalysis.fromJson(Map<String, dynamic> json) {
    return FeedbackAnalysis(
      delivery: DeliveryMetrics.fromJson(json['delivery']),
      content: ContentMetrics.fromJson(json['content']),
      goldenResponse: json['goldenResponse'] as String,
    );
  }

  static FeedbackAnalysis? tryParse(String jsonString) {
    try {
      final cleaned = jsonString
          .replaceAll(RegExp(r'^```json\s*'), '')
          .replaceAll(RegExp(r'\s*```$'), '');
      final json = jsonDecode(cleaned) as Map<String, dynamic>;
      return FeedbackAnalysis.fromJson(json);
    } catch (_) {
      return null;
    }
  }
}
