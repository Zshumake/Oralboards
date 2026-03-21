import 'dart:convert';

class TranscriptMessage {
  final String role;
  final String text;
  final String timestamp;

  const TranscriptMessage({
    required this.role,
    required this.text,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() => {
        'role': role,
        'text': text,
        'timestamp': timestamp,
      };

  factory TranscriptMessage.fromMap(Map<String, dynamic> map) {
    return TranscriptMessage(
      role: map['role'] as String? ?? '',
      text: map['text'] as String? ?? '',
      timestamp: map['timestamp'] as String? ?? '',
    );
  }
}

class ExamTranscript {
  final int? id;
  final int examResultId;
  final String sectionId;
  final List<TranscriptMessage> messages;

  const ExamTranscript({
    this.id,
    required this.examResultId,
    required this.sectionId,
    required this.messages,
  });

  Map<String, dynamic> toMap() => {
        'examResultId': examResultId,
        'sectionId': sectionId,
        'conversationJson':
            json.encode(messages.map((m) => m.toMap()).toList()),
      };

  factory ExamTranscript.fromMap(Map<String, dynamic> map) {
    final msgJson = map['conversationJson'] as String? ?? '[]';
    final msgs = (json.decode(msgJson) as List<dynamic>)
        .map((e) => TranscriptMessage.fromMap(e as Map<String, dynamic>))
        .toList();

    return ExamTranscript(
      id: map['id'] as int?,
      examResultId: map['examResultId'] as int? ?? 0,
      sectionId: map['sectionId'] as String? ?? '',
      messages: msgs,
    );
  }
}
