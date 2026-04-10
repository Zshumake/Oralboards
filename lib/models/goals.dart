enum GoalType { casesPerWeek, domainScoreTarget, totalCasesCompleted }

class PracticeGoal {
  final int? id;
  final GoalType type;
  final String description;
  final double targetValue;
  final String? targetDomain;
  final DateTime createdAt;
  final DateTime? deadlineAt;
  final bool isCompleted;

  const PracticeGoal({
    this.id,
    required this.type,
    required this.description,
    required this.targetValue,
    this.targetDomain,
    required this.createdAt,
    this.deadlineAt,
    this.isCompleted = false,
  });

  Map<String, dynamic> toMap() => {
        'type': type.name,
        'description': description,
        'targetValue': targetValue,
        'targetDomain': targetDomain,
        'createdAt': createdAt.toIso8601String(),
        'deadlineAt': deadlineAt?.toIso8601String(),
        'isCompleted': isCompleted ? 1 : 0,
      };

  factory PracticeGoal.fromMap(Map<String, dynamic> map) {
    return PracticeGoal(
      id: map['id'] as int?,
      type: GoalType.values.firstWhere(
        (e) => e.name == (map['type'] as String? ?? ''),
        orElse: () => GoalType.casesPerWeek,
      ),
      description: map['description'] as String? ?? '',
      targetValue: (map['targetValue'] as num?)?.toDouble() ?? 0,
      targetDomain: map['targetDomain'] as String?,
      createdAt: DateTime.tryParse(map['createdAt'] as String? ?? '') ??
          DateTime.now(),
      deadlineAt: map['deadlineAt'] != null
          ? DateTime.tryParse(map['deadlineAt'] as String)
          : null,
      isCompleted: (map['isCompleted'] as int? ?? 0) == 1,
    );
  }
}

class StreakData {
  final int currentStreak;
  final int longestStreak;
  final DateTime? lastPracticeDate;
  final int freezesAvailable;
  final bool freezeUsedToday;
  final DateTime? lastFreezeRefillDate;

  const StreakData({
    this.currentStreak = 0,
    this.longestStreak = 0,
    this.lastPracticeDate,
    this.freezesAvailable = 1,
    this.freezeUsedToday = false,
    this.lastFreezeRefillDate,
  });
}
