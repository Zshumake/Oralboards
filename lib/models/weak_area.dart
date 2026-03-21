class ConceptFrequency {
  final String concept;
  final String? domain;
  final int missCount;
  final int hitCount;

  const ConceptFrequency({
    required this.concept,
    this.domain,
    this.missCount = 0,
    this.hitCount = 0,
  });

  int get totalAppearances => missCount + hitCount;
  double get missRate =>
      totalAppearances > 0 ? missCount / totalAppearances : 0;
}

class DomainSummary {
  final String domain;
  final String domainName;
  final int totalConcepts;
  final int hitCount;

  const DomainSummary({
    required this.domain,
    required this.domainName,
    this.totalConcepts = 0,
    this.hitCount = 0,
  });

  double get hitRate => totalConcepts > 0 ? hitCount / totalConcepts : 0;
}

class TrendPoint {
  final DateTime date;
  final double score;

  const TrendPoint({required this.date, required this.score});
}

class WeakAreaAnalysis {
  final List<ConceptFrequency> topMissedConcepts;
  final Map<String, DomainSummary> domainSummaries;
  final List<TrendPoint> scoreTrend;
  final int totalExams;
  final double averageScore;

  const WeakAreaAnalysis({
    this.topMissedConcepts = const [],
    this.domainSummaries = const {},
    this.scoreTrend = const [],
    this.totalExams = 0,
    this.averageScore = 0,
  });
}
