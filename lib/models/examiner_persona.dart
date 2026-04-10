import 'package:flutter/material.dart';

class ExaminerPersona {
  final String id;
  final String name;
  final double pitch;
  final double rate;
  final String promptModifier;
  final Color iconColor;
  final String description;

  const ExaminerPersona({
    required this.id,
    required this.name,
    required this.pitch,
    required this.rate,
    required this.promptModifier,
    required this.iconColor,
    required this.description,
  });

  String get initials {
    final parts = name.split(' ');
    if (parts.length < 2) return name[0];
    return '${parts[0][0]}${parts[1][0]}';
  }

  static const List<ExaminerPersona> all = [
    chen,
    patel,
    morrison,
    okafor,
    reeves,
  ];

  static const chen = ExaminerPersona(
    id: 'chen',
    name: 'Dr. Chen',
    pitch: 0.85,
    rate: 0.45,
    promptModifier: '',
    iconColor: Color(0xFF1B3A5C),
    description: 'Neutral, methodical',
  );

  static const patel = ExaminerPersona(
    id: 'patel',
    name: 'Dr. Patel',
    pitch: 0.95,
    rate: 0.52,
    promptModifier:
        'You speak at a slightly brisker pace. Your probes are warm but efficient. You occasionally acknowledge the candidate\'s line of reasoning before redirecting.',
    iconColor: Color(0xFF2D6A4F),
    description: 'Warm but brisk',
  );

  static const morrison = ExaminerPersona(
    id: 'morrison',
    name: 'Dr. Morrison',
    pitch: 0.75,
    rate: 0.40,
    promptModifier:
        'You are notably terse. Your probes are short \u2014 often just 3-5 words. You rarely use complete sentences when a phrase will do. You never acknowledge the candidate\'s answer before moving on.',
    iconColor: Color(0xFF8B2635),
    description: 'Stern, terse',
  );

  static const okafor = ExaminerPersona(
    id: 'okafor',
    name: 'Dr. Okafor',
    pitch: 0.90,
    rate: 0.48,
    promptModifier:
        'You are methodical and thorough. You tend to ask one more follow-up question than strictly necessary to ensure the candidate has truly understood the concept rather than just naming it.',
    iconColor: Color(0xFFB8860B),
    description: 'Encouraging, thorough',
  );

  static const reeves = ExaminerPersona(
    id: 'reeves',
    name: 'Dr. Reeves',
    pitch: 1.0,
    rate: 0.55,
    promptModifier:
        'You move through material quickly. If the candidate has addressed the key points, advance promptly rather than probing further. You have high expectations and your follow-ups assume the candidate should know the answer.',
    iconColor: Color(0xFF6A1B9A),
    description: 'Fast-paced, high expectations',
  );

  static ExaminerPersona fromId(String id) {
    return all.firstWhere((p) => p.id == id, orElse: () => chen);
  }
}
