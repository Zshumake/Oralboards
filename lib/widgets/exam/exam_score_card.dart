import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/exam_models.dart';
import '../../theme/app_theme.dart';
import 'timing_feedback_card.dart';

class ExamScoreCard extends StatelessWidget {
  final ExamSessionState examState;
  final String elapsedTime;
  final VoidCallback onReturnHome;
  final VoidCallback onTryAgain;

  const ExamScoreCard({
    super.key,
    required this.examState,
    required this.elapsedTime,
    required this.onReturnHome,
    required this.onTryAgain,
  });

  @override
  Widget build(BuildContext context) {
    final scores = examState.sectionScores.values.toList();
    final totalHit =
        scores.fold<int>(0, (sum, s) => sum + s.conceptsHit.length);
    final totalMissed =
        scores.fold<int>(0, (sum, s) => sum + s.conceptsMissed.length);
    final totalRedFlags =
        scores.fold<int>(0, (sum, s) => sum + s.redFlags.length);
    final total = totalHit + totalMissed;
    final overallPercent = total > 0 ? (totalHit / total * 100).round() : 0;

    return Container(
      color: AppColors.bg,
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: ListView(
              padding: const EdgeInsets.all(32),
              children: [
                // Header
                Center(
                  child: Column(
                    children: [
                      Container(height: 2, width: 60, color: AppColors.navy),
                      const SizedBox(height: 20),
                      Text(
                        'Examination Complete',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: AppColors.navy,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        examState.caseTitle,
                        style: GoogleFonts.sourceSerif4(
                          fontSize: 16,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(height: 1, color: AppColors.divider),
                    ],
                  ),
                ),
                const SizedBox(height: 28),

                // Summary cards
                Row(
                  children: [
                    _SummaryCard(
                      label: 'Overall Score',
                      value: '$overallPercent%',
                      color: overallPercent >= 70
                          ? AppColors.success
                          : (overallPercent >= 50
                              ? AppColors.warning
                              : AppColors.danger),
                    ),
                    const SizedBox(width: 16),
                    _SummaryCard(
                      label: 'Time',
                      value: elapsedTime,
                      color: AppColors.navy,
                    ),
                    const SizedBox(width: 16),
                    _SummaryCard(
                      label: 'Red Flags',
                      value: '$totalRedFlags',
                      color: totalRedFlags > 0
                          ? AppColors.danger
                          : AppColors.success,
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Timing feedback
                TimingFeedbackCard(examState: examState),

                // Per-section breakdown
                Text(
                  'Section Breakdown',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.navy,
                  ),
                ),
                const SizedBox(height: 16),

                ...scores.map((score) => _SectionScoreCard(
                      score: score,
                      timing: examState.sectionTimings[score.sectionId],
                    )),

                const SizedBox(height: 32),
                Container(height: 1, color: AppColors.divider),
                const SizedBox(height: 24),

                // Action buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton.icon(
                      onPressed: onReturnHome,
                      icon: const Icon(Icons.home_outlined, size: 16),
                      label: Text('Return Home',
                          style: GoogleFonts.dmSans(fontWeight: FontWeight.w600)),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.navy,
                        side: const BorderSide(color: AppColors.navy),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton.icon(
                      onPressed: onTryAgain,
                      icon: const Icon(Icons.refresh, size: 16),
                      label: Text('Try Again',
                          style: GoogleFonts.dmSans(fontWeight: FontWeight.w600)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.burgundy,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _SummaryCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
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
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: GoogleFonts.dmSans(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textMuted,
                letterSpacing: 0.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionScoreCard extends StatelessWidget {
  final SectionScore score;
  final SectionTiming? timing;

  const _SectionScoreCard({required this.score, this.timing});

  @override
  Widget build(BuildContext context) {
    final total = score.conceptsHit.length + score.conceptsMissed.length;
    final percent = score.percentCovered;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title + turns
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  score.sectionTitle,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.navy,
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (timing != null) ...[
                    Text(
                      _formatTime(timing!.elapsedSeconds),
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 1,
                      height: 12,
                      color: AppColors.divider,
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    '${score.turnsTaken} turns',
                    style: GoogleFonts.dmSans(
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Progress bar
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: percent,
                    backgroundColor: AppColors.surfaceAlt,
                    color: percent >= 0.7
                        ? AppColors.success
                        : (percent >= 0.4
                            ? AppColors.warning
                            : AppColors.danger),
                    minHeight: 6,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '${score.conceptsHit.length}/$total',
                style: GoogleFonts.dmSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
              ),
            ],
          ),

          // Missed concepts
          if (score.conceptsMissed.isNotEmpty) ...[
            const SizedBox(height: 12),
            Text(
              'Missed:',
              style: GoogleFonts.dmSans(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.burgundy,
              ),
            ),
            const SizedBox(height: 4),
            ...score.conceptsMissed.map((c) => Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 3),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 6),
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.burgundy.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          c,
                          style: GoogleFonts.sourceSerif4(
                            fontSize: 13,
                            color: AppColors.textMuted,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          ],

          // Red flags
          if (score.redFlags.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.danger.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                    color: AppColors.danger.withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.warning_amber,
                          size: 14, color: AppColors.danger),
                      const SizedBox(width: 6),
                      Text(
                        'Safety Concerns',
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.danger,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  ...score.redFlags.map((f) => Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          '• $f',
                          style: GoogleFonts.sourceSerif4(
                            fontSize: 13,
                            color: AppColors.danger,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  String _formatTime(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '$m:${s.toString().padLeft(2, '0')}';
  }
}
