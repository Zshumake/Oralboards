import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/goals_provider.dart';
import '../theme/app_theme.dart';
import 'goal_dialog.dart';

class StreakCard extends ConsumerWidget {
  const StreakCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goalsAsync = ref.watch(goalsProvider);

    return goalsAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (goalsState) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              // Streak
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.local_fire_department,
                    size: 20,
                    color: goalsState.streak.currentStreak > 0
                        ? AppColors.burgundy
                        : AppColors.textMuted,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${goalsState.streak.currentStreak}',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: goalsState.streak.currentStreak > 0
                          ? AppColors.burgundy
                          : AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    'day streak',
                    style: GoogleFonts.dmSans(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 20),
              Container(width: 1, height: 24, color: AppColors.divider),
              const SizedBox(width: 20),

              // Active goals
              if (goalsState.goals.isEmpty)
                Expanded(
                  child: GestureDetector(
                    onTap: () => showGoalDialog(context),
                    child: Row(
                      children: [
                        Icon(Icons.add_circle_outline,
                            size: 16, color: AppColors.navy),
                        const SizedBox(width: 6),
                        Text(
                          'Set a practice goal',
                          style: GoogleFonts.dmSans(
                            fontSize: 13,
                            color: AppColors.navy,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              else
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              goalsState.goals.first.description,
                              style: GoogleFonts.dmSans(
                                fontSize: 12,
                                color: AppColors.text,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: LinearProgressIndicator(
                                value: goalsState.goalProgress[
                                        goalsState.goals.first.id] ??
                                    0,
                                backgroundColor: AppColors.surfaceAlt,
                                color: AppColors.success,
                                minHeight: 5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        onTap: () => showGoalDialog(context),
                        child: Icon(Icons.settings,
                            size: 16, color: AppColors.textMuted),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
