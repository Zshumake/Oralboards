import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/benchmark_data.dart';
import '../models/weak_area.dart';
import '../theme/app_theme.dart';

class BenchmarkSection extends StatelessWidget {
  final WeakAreaAnalysis analysis;

  const BenchmarkSection({super.key, required this.analysis});

  @override
  Widget build(BuildContext context) {
    if (analysis.totalExams < 2) return const SizedBox.shrink();

    final percentile =
        BenchmarkData.percentile(analysis.averageScore).round();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Estimated Peer Comparison',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.navy,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Estimates based on published pass rate data. Individual results may vary.',
          style: GoogleFonts.sourceSerif4(
            fontSize: 12,
            fontStyle: FontStyle.italic,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 16),

        // Percentile gauge
        Container(
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
            children: [
              SizedBox(
                height: 100,
                width: 200,
                child: CustomPaint(
                  painter: _PercentileGaugePainter(percentile / 100.0),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${percentile}th Percentile',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: percentile >= 75
                      ? AppColors.success
                      : (percentile >= 50
                          ? AppColors.warning
                          : AppColors.danger),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Based on your ${analysis.averageScore.round()}% average score',
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 16),

              // Domain comparisons
              ...analysis.domainSummaries.entries.map((e) {
                final d = e.value;
                if (d.totalConcepts == 0) return const SizedBox.shrink();
                final userPct = (d.hitRate * 100).round();
                final meanPct =
                    (BenchmarkData.domainMeans[d.domain] ?? 68).round();
                final diff = userPct - meanPct;

                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 130,
                        child: Text(
                          d.domainName,
                          style: GoogleFonts.dmSans(
                            fontSize: 12,
                            color: AppColors.text,
                          ),
                        ),
                      ),
                      Text(
                        '$userPct%',
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.navy,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'vs ${meanPct}% avg',
                        style: GoogleFonts.dmSans(
                          fontSize: 11,
                          color: AppColors.textMuted,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 1),
                        decoration: BoxDecoration(
                          color: diff >= 0
                              ? AppColors.success.withValues(alpha: 0.1)
                              : AppColors.danger.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          diff >= 0 ? '+$diff' : '$diff',
                          style: GoogleFonts.dmSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: diff >= 0
                                ? AppColors.success
                                : AppColors.danger,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

class _PercentileGaugePainter extends CustomPainter {
  final double fraction; // 0.0 to 1.0

  _PercentileGaugePainter(this.fraction);

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height * 0.85;
    final radius = size.width * 0.4;

    // Background arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: radius),
      pi,
      pi,
      false,
      Paint()
        ..color = const Color(0xFFE5DFD5)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..strokeCap = StrokeCap.round,
    );

    // Filled arc
    final color = fraction >= 0.75
        ? AppColors.success
        : (fraction >= 0.50 ? AppColors.warning : AppColors.danger);

    canvas.drawArc(
      Rect.fromCircle(center: Offset(cx, cy), radius: radius),
      pi,
      pi * fraction,
      false,
      Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = 10
        ..strokeCap = StrokeCap.round,
    );

    // Needle dot
    final angle = pi + pi * fraction;
    final dotX = cx + radius * cos(angle);
    final dotY = cy + radius * sin(angle);
    canvas.drawCircle(
      Offset(dotX, dotY),
      5,
      Paint()..color = color,
    );
  }

  @override
  bool shouldRepaint(covariant _PercentileGaugePainter old) =>
      old.fraction != fraction;
}
