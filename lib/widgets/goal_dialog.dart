import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/goals.dart';
import '../providers/goals_provider.dart';
import '../theme/app_theme.dart';

class GoalDialog extends ConsumerStatefulWidget {
  const GoalDialog({super.key});

  @override
  ConsumerState<GoalDialog> createState() => _GoalDialogState();
}

class _GoalDialogState extends ConsumerState<GoalDialog> {
  int _selectedTemplate = 0;
  int _casesPerWeek = 3;

  final _templates = [
    (GoalType.casesPerWeek, 'Practice cases per week'),
    (GoalType.totalCasesCompleted, 'Complete 10 total cases'),
    (GoalType.domainScoreTarget, 'Average score above 75%'),
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Text(
        'Set Practice Goal',
        style: GoogleFonts.playfairDisplay(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: AppColors.navy,
        ),
      ),
      content: SizedBox(
        width: 380,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 1, color: AppColors.divider),
            const SizedBox(height: 16),

            ...List.generate(_templates.length, (i) {
              final isSelected = _selectedTemplate == i;
              return GestureDetector(
                onTap: () => setState(() => _selectedTemplate = i),
                child: Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.navy.withValues(alpha: 0.05)
                        : AppColors.surface,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: isSelected ? AppColors.navy : AppColors.border,
                      width: isSelected ? 2 : 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 18,
                        height: 18,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? AppColors.navy
                              : Colors.transparent,
                          border: Border.all(
                            color:
                                isSelected ? AppColors.navy : AppColors.border,
                          ),
                        ),
                        child: isSelected
                            ? const Icon(Icons.check,
                                size: 12, color: Colors.white)
                            : null,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        _templates[i].$2,
                        style: GoogleFonts.dmSans(
                          fontSize: 14,
                          fontWeight:
                              isSelected ? FontWeight.w600 : FontWeight.w400,
                          color: isSelected ? AppColors.navy : AppColors.text,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),

            // Cases per week selector
            if (_selectedTemplate == 0) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  const SizedBox(width: 30),
                  Text(
                    'Cases:',
                    style: GoogleFonts.dmSans(
                        fontSize: 13, color: AppColors.textMuted),
                  ),
                  const SizedBox(width: 12),
                  ...[2, 3, 5, 7].map((n) {
                    final isSelected = _casesPerWeek == n;
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: GestureDetector(
                        onTap: () => setState(() => _casesPerWeek = n),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.navy
                                : AppColors.surfaceAlt,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            '$n',
                            style: GoogleFonts.dmSans(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.textMuted,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ],
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel',
              style: GoogleFonts.dmSans(color: AppColors.textMuted)),
        ),
        ElevatedButton(
          onPressed: () {
            final template = _templates[_selectedTemplate];
            late PracticeGoal goal;

            switch (template.$1) {
              case GoalType.casesPerWeek:
                goal = PracticeGoal(
                  type: GoalType.casesPerWeek,
                  description: 'Practice $_casesPerWeek cases this week',
                  targetValue: _casesPerWeek.toDouble(),
                  createdAt: DateTime.now(),
                );
                break;
              case GoalType.totalCasesCompleted:
                goal = PracticeGoal(
                  type: GoalType.totalCasesCompleted,
                  description: 'Complete 10 total cases',
                  targetValue: 10,
                  createdAt: DateTime.now(),
                );
                break;
              case GoalType.domainScoreTarget:
                goal = PracticeGoal(
                  type: GoalType.domainScoreTarget,
                  description: 'Average score above 75%',
                  targetValue: 75,
                  createdAt: DateTime.now(),
                );
                break;
            }

            ref.read(goalsProvider.notifier).createGoal(goal);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.navy,
            foregroundColor: Colors.white,
          ),
          child: Text('Set Goal', style: GoogleFonts.dmSans()),
        ),
      ],
    );
  }
}

void showGoalDialog(BuildContext context) {
  showDialog(context: context, builder: (_) => const GoalDialog());
}
