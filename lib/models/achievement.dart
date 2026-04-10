import 'package:flutter/material.dart';

class Achievement {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final bool isUnlocked;
  final DateTime? unlockedDate;

  const Achievement({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    this.isUnlocked = false,
    this.unlockedDate,
  });

  Achievement copyWith({
    bool? isUnlocked,
    DateTime? unlockedDate,
  }) {
    return Achievement(
      id: id,
      title: title,
      description: description,
      icon: icon,
      isUnlocked: isUnlocked ?? this.isUnlocked,
      unlockedDate: unlockedDate ?? this.unlockedDate,
    );
  }
}

/// All achievement definitions
const List<_AchievementDef> achievementDefinitions = [
  _AchievementDef('first_steps', 'First Steps', 'Complete your first case', Icons.rocket_launch),
  _AchievementDef('getting_serious', 'Getting Serious', 'Complete 10 cases', Icons.trending_up),
  _AchievementDef('halfway_there', 'Halfway There', 'Complete 50 cases', Icons.flag),
  _AchievementDef('century_club', 'Century Club', 'Complete all 100 cases', Icons.emoji_events),
  _AchievementDef('perfect_round', 'Perfect Round', 'Score 100% on a case', Icons.star),
  _AchievementDef('streak_starter', 'Streak Starter', '3-day study streak', Icons.local_fire_department),
  _AchievementDef('week_warrior', 'Week Warrior', '7-day study streak', Icons.shield),
  _AchievementDef('month_master', 'Month Master', '30-day study streak', Icons.military_tech),
  _AchievementDef('domain_scholar', 'Domain Scholar', 'Score 70%+ in all 5 ABPMR domains', Icons.school),
  _AchievementDef('sci_specialist', 'SCI Specialist', 'Complete all SCI cases', Icons.accessible),
  _AchievementDef('stroke_expert', 'Stroke Expert', 'Complete all Stroke cases', Icons.psychology),
  _AchievementDef('no_red_flags', 'No Red Flags', '5 consecutive cases with zero red flags', Icons.verified),
  _AchievementDef('speed_demon', 'Speed Demon', 'Complete a case in under 10 minutes', Icons.bolt),
  _AchievementDef('night_owl', 'Night Owl', 'Study after 10 PM', Icons.nightlight),
  _AchievementDef('early_bird', 'Early Bird', 'Study before 7 AM', Icons.wb_sunny),
];

class _AchievementDef {
  final String id;
  final String title;
  final String description;
  final IconData icon;

  const _AchievementDef(this.id, this.title, this.description, this.icon);
}

List<Achievement> buildDefaultAchievements() {
  return achievementDefinitions
      .map((d) => Achievement(
            id: d.id,
            title: d.title,
            description: d.description,
            icon: d.icon,
          ))
      .toList();
}
