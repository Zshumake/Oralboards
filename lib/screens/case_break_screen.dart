import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/exam_models.dart';
import '../models/multi_case_session.dart';
import '../providers/multi_case_provider.dart';
import '../theme/app_theme.dart';
import 'exam_screen.dart';

class CaseBreakScreen extends ConsumerWidget {
  final ExamSessionState completedCaseState;

  const CaseBreakScreen({super.key, required this.completedCaseState});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(multiCaseProvider);
    if (session == null) {
      return const Scaffold(body: Center(child: Text('No session')));
    }

    final scores = completedCaseState.sectionScores.values.toList();
    final totalHit =
        scores.fold<int>(0, (sum, s) => sum + s.conceptsHit.length);
    final totalMissed =
        scores.fold<int>(0, (sum, s) => sum + s.conceptsMissed.length);
    final total = totalHit + totalMissed;
    final casePercent = total > 0 ? (totalHit / total * 100).round() : 0;
    final caseRedFlags =
        scores.fold<int>(0, (sum, s) => sum + s.redFlags.length);

    // Cumulative stats across all completed cases
    int cumulativeHit = 0;
    int cumulativeMissed = 0;
    int cumulativeRedFlags = 0;
    for (final state in session.completedCaseStates.values) {
      for (final s in state.sectionScores.values) {
        cumulativeHit += s.conceptsHit.length;
        cumulativeMissed += s.conceptsMissed.length;
        cumulativeRedFlags += s.redFlags.length;
      }
    }
    final cumulativeTotal = cumulativeHit + cumulativeMissed;
    final cumulativePercent = cumulativeTotal > 0
        ? (cumulativeHit / cumulativeTotal * 100).round()
        : 0;

    final casesCompleted = session.casesCompleted;
    final totalCases = session.totalCases;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Progress dots
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(totalCases, (i) {
                      final isCompleted = i < casesCompleted;
                      final isCurrent = i == casesCompleted;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: isCurrent ? 12 : 8,
                        height: isCurrent ? 12 : 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCompleted
                              ? AppColors.navy
                              : (isCurrent
                                  ? AppColors.burgundy
                                  : AppColors.surfaceAlt),
                          border: isCurrent
                              ? Border.all(color: AppColors.burgundy, width: 2)
                              : null,
                        ),
                      );
                    }),
                  ),
                  const SizedBox(height: 32),

                  Container(height: 2, width: 60, color: AppColors.navy),
                  const SizedBox(height: 20),
                  Text(
                    'Case $casesCompleted of $totalCases Complete',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.navy,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    completedCaseState.caseTitle,
                    style: GoogleFonts.sourceSerif4(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: AppColors.textMuted,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 32),

                  // Case score
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _ScoreChip(
                        label: 'This Case',
                        value: '$casePercent%',
                        color: casePercent >= 70
                            ? AppColors.success
                            : (casePercent >= 50
                                ? AppColors.warning
                                : AppColors.danger),
                      ),
                      const SizedBox(width: 16),
                      _ScoreChip(
                        label: 'Running Total',
                        value: '$cumulativePercent%',
                        color: cumulativePercent >= 70
                            ? AppColors.success
                            : (cumulativePercent >= 50
                                ? AppColors.warning
                                : AppColors.danger),
                      ),
                      if (caseRedFlags > 0) ...[
                        const SizedBox(width: 16),
                        _ScoreChip(
                          label: 'Red Flags',
                          value: '$cumulativeRedFlags',
                          color: AppColors.danger,
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 48),

                  // Continue button
                  ElevatedButton.icon(
                    onPressed: () {
                      ref.read(multiCaseProvider.notifier).advanceToNextCase();
                      final nextSession = ref.read(multiCaseProvider);
                      if (nextSession == null) return;

                      Navigator.of(context).pushReplacement(
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => ExamScreen(
                            caseData: nextSession.currentCase,
                          ),
                          transitionsBuilder: (_, animation, __, child) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          transitionDuration: const Duration(milliseconds: 300),
                        ),
                      );
                    },
                    icon: const Icon(Icons.arrow_forward, size: 16),
                    label: Text(
                      'Continue to Next Case',
                      style: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.burgundy,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () {
                      ref.read(multiCaseProvider.notifier).endSession();
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Text(
                      'End Session Early',
                      style: GoogleFonts.dmSans(
                        color: AppColors.textMuted,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ScoreChip extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _ScoreChip({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: GoogleFonts.playfairDisplay(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 11,
              color: AppColors.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
