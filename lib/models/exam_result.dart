import 'dart:convert';

class SectionScoreRecord {
  final String sectionId;
  final String sectionTitle;
  final int conceptsHit;
  final int conceptsMissed;
  final int redFlags;
  final int turnsTaken;
  final int timeSpentSeconds;
  final List<String> conceptsHitList;
  final List<String> conceptsMissedList;
  final List<String> redFlagsList;
  final String? domain; // B, C, D, or E

  const SectionScoreRecord({
    required this.sectionId,
    required this.sectionTitle,
    this.conceptsHit = 0,
    this.conceptsMissed = 0,
    this.redFlags = 0,
    this.turnsTaken = 0,
    this.timeSpentSeconds = 0,
    this.conceptsHitList = const [],
    this.conceptsMissedList = const [],
    this.redFlagsList = const [],
    this.domain,
  });

  double get percentCovered {
    final total = conceptsHit + conceptsMissed;
    if (total == 0) return 1.0;
    return conceptsHit / total;
  }

  Map<String, dynamic> toMap() => {
        'sectionId': sectionId,
        'sectionTitle': sectionTitle,
        'conceptsHit': conceptsHit,
        'conceptsMissed': conceptsMissed,
        'redFlags': redFlags,
        'turnsTaken': turnsTaken,
        'timeSpentSeconds': timeSpentSeconds,
        'conceptsHitList': conceptsHitList,
        'conceptsMissedList': conceptsMissedList,
        'redFlagsList': redFlagsList,
        'domain': domain,
      };

  factory SectionScoreRecord.fromMap(Map<String, dynamic> map) {
    return SectionScoreRecord(
      sectionId: map['sectionId'] as String? ?? '',
      sectionTitle: map['sectionTitle'] as String? ?? '',
      conceptsHit: map['conceptsHit'] as int? ?? 0,
      conceptsMissed: map['conceptsMissed'] as int? ?? 0,
      redFlags: map['redFlags'] as int? ?? 0,
      turnsTaken: map['turnsTaken'] as int? ?? 0,
      timeSpentSeconds: map['timeSpentSeconds'] as int? ?? 0,
      conceptsHitList: _parseStringList(map['conceptsHitList']),
      conceptsMissedList: _parseStringList(map['conceptsMissedList']),
      redFlagsList: _parseStringList(map['redFlagsList']),
      domain: map['domain'] as String?,
    );
  }

  static List<String> _parseStringList(dynamic value) {
    if (value == null) return [];
    if (value is List) return value.map((e) => e.toString()).toList();
    return [];
  }
}

class ExamResult {
  final int? id;
  final String caseId;
  final String caseTitle;
  final DateTime date;
  final double overallScore;
  final int timeElapsedSeconds;
  final List<SectionScoreRecord> sectionScores;
  final int redFlagCount;
  final int totalConceptsHit;
  final int totalConceptsMissed;

  const ExamResult({
    this.id,
    required this.caseId,
    required this.caseTitle,
    required this.date,
    required this.overallScore,
    required this.timeElapsedSeconds,
    required this.sectionScores,
    required this.redFlagCount,
    required this.totalConceptsHit,
    required this.totalConceptsMissed,
  });

  Map<String, dynamic> toMap() => {
        'caseId': caseId,
        'caseTitle': caseTitle,
        'date': date.toIso8601String(),
        'overallScore': overallScore,
        'timeElapsedSeconds': timeElapsedSeconds,
        'sectionScoresJson':
            json.encode(sectionScores.map((s) => s.toMap()).toList()),
        'redFlagCount': redFlagCount,
        'totalConceptsHit': totalConceptsHit,
        'totalConceptsMissed': totalConceptsMissed,
      };

  factory ExamResult.fromMap(Map<String, dynamic> map) {
    final scoresJson = map['sectionScoresJson'] as String? ?? '[]';
    final scoresList = (json.decode(scoresJson) as List<dynamic>)
        .map((e) => SectionScoreRecord.fromMap(e as Map<String, dynamic>))
        .toList();

    return ExamResult(
      id: map['id'] as int?,
      caseId: map['caseId'] as String? ?? '',
      caseTitle: map['caseTitle'] as String? ?? '',
      date: DateTime.tryParse(map['date'] as String? ?? '') ?? DateTime.now(),
      overallScore: (map['overallScore'] as num?)?.toDouble() ?? 0.0,
      timeElapsedSeconds: map['timeElapsedSeconds'] as int? ?? 0,
      sectionScores: scoresList,
      redFlagCount: map['redFlagCount'] as int? ?? 0,
      totalConceptsHit: map['totalConceptsHit'] as int? ?? 0,
      totalConceptsMissed: map['totalConceptsMissed'] as int? ?? 0,
    );
  }
}
