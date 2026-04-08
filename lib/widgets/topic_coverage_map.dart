import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/coverage_provider.dart';
import '../theme/app_theme.dart';

class TopicCoverageMap extends ConsumerWidget {
  const TopicCoverageMap({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final summary = ref.watch(coverageProvider);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              const Icon(Icons.map_outlined, size: 22, color: AppColors.navy),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Topic Coverage',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.navy,
                  ),
                ),
              ),
              Text(
                '${summary.totalAttempted}/${summary.totalCases}',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            'Cases practiced across ABPMR categories — mastered = scored ≥70% on most recent attempt',
            style: GoogleFonts.sourceSerif4(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 16),

          // Overall progress bars (attempted + mastered)
          _ProgressBar(
            label: 'Attempted',
            value: summary.attemptedFraction,
            color: AppColors.navy,
            countText:
                '${summary.totalAttempted} / ${summary.totalCases}',
          ),
          const SizedBox(height: 8),
          _ProgressBar(
            label: 'Mastered',
            value: summary.masteredFraction,
            color: AppColors.success,
            countText:
                '${summary.totalMastered} / ${summary.totalCases}',
          ),

          const SizedBox(height: 18),
          Container(height: 1, color: AppColors.divider),
          const SizedBox(height: 14),

          Text(
            'By Category',
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: AppColors.textMuted,
              letterSpacing: 0.6,
            ),
          ),
          const SizedBox(height: 12),

          ...summary.categories.map((c) => _CategoryRow(category: c)),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  final String label;
  final double value;
  final Color color;
  final String countText;

  const _ProgressBar({
    required this.label,
    required this.value,
    required this.color,
    required this.countText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.text,
            ),
          ),
        ),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: value,
              backgroundColor: AppColors.surfaceAlt,
              color: color,
              minHeight: 8,
            ),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 60,
          child: Text(
            countText,
            textAlign: TextAlign.right,
            style: GoogleFonts.jetBrainsMono(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class _CategoryRow extends StatelessWidget {
  final CategoryCoverage category;

  const _CategoryRow({required this.category});

  @override
  Widget build(BuildContext context) {
    final pct = category.attemptedFraction;
    final masteredPct = category.masteredFraction;
    final isComplete = category.attempted == category.total && category.total > 0;
    final isStarted = category.attempted > 0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isComplete
                    ? Icons.check_circle
                    : (isStarted ? Icons.timelapse : Icons.circle_outlined),
                size: 14,
                color: isComplete
                    ? AppColors.success
                    : (isStarted ? AppColors.warning : AppColors.textMuted),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  category.label,
                  style: GoogleFonts.dmSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text,
                  ),
                ),
              ),
              Text(
                '${category.attempted}/${category.total}',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isComplete ? AppColors.success : AppColors.text,
                ),
              ),
              if (category.mastered > 0) ...[
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
                  decoration: BoxDecoration(
                    color: AppColors.success.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: Text(
                    '${category.mastered}★',
                    style: GoogleFonts.dmSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w700,
                      color: AppColors.success,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 4),
          // Stacked progress: mastered overlay on attempted
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: pct,
                  backgroundColor: AppColors.surfaceAlt,
                  color: AppColors.navy.withValues(alpha: 0.3),
                  minHeight: 5,
                ),
              ),
              if (masteredPct > 0)
                ClipRRect(
                  borderRadius: BorderRadius.circular(2),
                  child: LinearProgressIndicator(
                    value: masteredPct,
                    backgroundColor: Colors.transparent,
                    color: AppColors.success,
                    minHeight: 5,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
