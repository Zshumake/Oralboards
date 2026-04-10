import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/exam_models.dart';
import '../../theme/app_theme.dart';

class TimingFeedbackCard extends StatelessWidget {
  final ExamSessionState examState;

  const TimingFeedbackCard({super.key, required this.examState});

  @override
  Widget build(BuildContext context) {
    final timings = examState.sectionTimings;
    if (timings.isEmpty) return const SizedBox.shrink();

    final totalSeconds =
        timings.values.fold<int>(0, (sum, t) => sum + t.elapsedSeconds);
    if (totalSeconds == 0) return const SizedBox.shrink();

    final sectionCount = timings.length;
    final idealPerSection = totalSeconds / sectionCount;

    // Find the most over/under time sections
    final overTime = <String>[];
    final underTime = <String>[];

    for (final entry in timings.entries) {
      final section = examState.examSections
          .where((s) => s.id == entry.key)
          .firstOrNull;
      if (section == null) continue;
      final elapsed = entry.value.elapsedSeconds;
      if (elapsed > idealPerSection * 1.5) {
        overTime.add(
            '${section.title} (${_formatTime(elapsed)} vs ${_formatTime(idealPerSection.round())} ideal)');
      } else if (elapsed < idealPerSection * 0.5 && elapsed > 0) {
        underTime.add(
            '${section.title} (${_formatTime(elapsed)} vs ${_formatTime(idealPerSection.round())} ideal)');
      }
    }

    if (overTime.isEmpty && underTime.isEmpty) return const SizedBox.shrink();

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
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
          Row(
            children: [
              Icon(Icons.timer_outlined,
                  size: 16, color: AppColors.warning),
              const SizedBox(width: 8),
              Text(
                'Time Allocation Feedback',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Bar chart
          ...timings.entries.map((entry) {
            final section = examState.examSections
                .where((s) => s.id == entry.key)
                .firstOrNull;
            if (section == null) return const SizedBox.shrink();

            final elapsed = entry.value.elapsedSeconds;
            final fraction =
                totalSeconds > 0 ? elapsed / totalSeconds : 0.0;
            final isOver = elapsed > idealPerSection * 1.5;
            final isUnder =
                elapsed < idealPerSection * 0.5 && elapsed > 0;
            final barColor = isOver
                ? AppColors.burgundy
                : (isUnder ? AppColors.warning : AppColors.navy);

            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      section.title,
                      style: GoogleFonts.dmSans(
                        fontSize: 11,
                        color: AppColors.textMuted,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        value: min(fraction * timings.length, 1.0),
                        backgroundColor: AppColors.surfaceAlt,
                        color: barColor,
                        minHeight: 8,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 40,
                    child: Text(
                      _formatTime(elapsed),
                      textAlign: TextAlign.right,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 11,
                        color: barColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          // Feedback text
          if (overTime.isNotEmpty || underTime.isNotEmpty) ...[
            const SizedBox(height: 12),
            Container(height: 1, color: AppColors.divider),
            const SizedBox(height: 12),
          ],
          if (overTime.isNotEmpty)
            ...overTime.map((msg) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_upward,
                          size: 12, color: AppColors.burgundy),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          msg,
                          style: GoogleFonts.sourceSerif4(
                            fontSize: 12,
                            color: AppColors.burgundy,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
          if (underTime.isNotEmpty)
            ...underTime.map((msg) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.arrow_downward,
                          size: 12, color: AppColors.warning),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          msg,
                          style: GoogleFonts.sourceSerif4(
                            fontSize: 12,
                            color: AppColors.warning,
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
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
