import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/analytics_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/benchmark_section.dart';
import '../widgets/charts/domain_bar_chart.dart';
import '../widgets/charts/score_trend_chart.dart';
import '../widgets/export_report_button.dart';
import '../widgets/topic_coverage_map.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsAsync = ref.watch(analyticsProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: analyticsAsync.when(
              loading: () => Center(
                child: CircularProgressIndicator(color: AppColors.navy),
              ),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (analysis) {
                if (analysis.totalExams == 0) {
                  return _buildEmptyState(context);
                }
                return _buildDashboard(context, analysis);
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, size: 20),
              onPressed: () => Navigator.pop(context),
              color: AppColors.navy,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                'Performance Analysis',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(height: 1, color: AppColors.divider),
        const SizedBox(height: 24),

        // Coverage map is useful even before any exams
        const TopicCoverageMap(),
        const SizedBox(height: 32),

        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Icon(Icons.insights,
                  size: 40, color: AppColors.textMuted.withValues(alpha: 0.4)),
              const SizedBox(height: 12),
              Text(
                'No Exam Data Yet',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                'Complete exam simulations to unlock domain analytics, score trends, and board readiness predictions.',
                textAlign: TextAlign.center,
                style: GoogleFonts.sourceSerif4(
                  fontSize: 13,
                  fontStyle: FontStyle.italic,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDashboard(BuildContext context, analysis) {
    final avgPct = analysis.averageScore.round();
    final avgColor = avgPct >= 70
        ? AppColors.success
        : (avgPct >= 50 ? AppColors.warning : AppColors.danger);

    return ListView(
      padding: const EdgeInsets.all(32),
      children: [
        // Header
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, size: 20),
              onPressed: () => Navigator.pop(context),
              color: AppColors.navy,
            ),
            const SizedBox(width: 8),
            Expanded(
            child: Text(
              'Performance Analysis',
              style: GoogleFonts.playfairDisplay(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: AppColors.navy,
              ),
            ),
          ),
            ExportReportButton(analysis: analysis),
          ],
        ),
        const SizedBox(height: 8),
        Container(height: 1, color: AppColors.divider),
        const SizedBox(height: 28),

        // Summary cards
        Row(
          children: [
            _SummaryCard(
              label: 'Exams Taken',
              value: '${analysis.totalExams}',
              color: AppColors.navy,
            ),
            const SizedBox(width: 16),
            _SummaryCard(
              label: 'Average Score',
              value: '$avgPct%',
              color: avgColor,
            ),
            const SizedBox(width: 16),
            _SummaryCard(
              label: 'Concepts Tracked',
              value:
                  '${analysis.topMissedConcepts.fold<int>(0, (s, c) => s + c.totalAppearances)}',
              color: AppColors.navy,
            ),
          ],
        ),
        const SizedBox(height: 32),

        // Topic Coverage Map
        const TopicCoverageMap(),
        const SizedBox(height: 32),

        // Board Readiness Predictor
        _BoardReadinessCard(analysis: analysis),
        const SizedBox(height: 32),

        // Domain Performance
        Text(
          'Domain Performance',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.navy,
          ),
        ),
        const SizedBox(height: 16),
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
          child: DomainBarChart(domains: analysis.domainSummaries),
        ),
        const SizedBox(height: 32),

        // Score Trend
        Text(
          'Score Trend',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.navy,
          ),
        ),
        const SizedBox(height: 16),
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
          child: ScoreTrendChart(trend: analysis.scoreTrend),
        ),
        const SizedBox(height: 32),

        // Peer comparison
        BenchmarkSection(analysis: analysis),

        // Most Missed Concepts
        Text(
          'Most Missed Concepts',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: AppColors.navy,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'Concepts you consistently miss across exam attempts',
          style: GoogleFonts.sourceSerif4(
            fontSize: 13,
            fontStyle: FontStyle.italic,
            color: AppColors.textMuted,
          ),
        ),
        const SizedBox(height: 16),

        if (analysis.topMissedConcepts.isEmpty)
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              'No missed concepts recorded yet.',
              style: GoogleFonts.sourceSerif4(
                color: AppColors.textMuted,
                fontStyle: FontStyle.italic,
              ),
            ),
          )
        else
          ...analysis.topMissedConcepts.asMap().entries.map((entry) {
            final i = entry.key;
            final c = entry.value;
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.02),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 28,
                    child: Text(
                      '${i + 1}.',
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.burgundy,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      c.concept,
                      style: GoogleFonts.sourceSerif4(
                        fontSize: 14,
                        color: AppColors.text,
                      ),
                    ),
                  ),
                  if (c.domain != null) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppColors.navy.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Text(
                        c.domain!,
                        style: GoogleFonts.dmSans(
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: AppColors.navy,
                        ),
                      ),
                    ),
                  ],
                  const SizedBox(width: 8),
                  Text(
                    'missed ${c.missCount}x',
                    style: GoogleFonts.dmSans(
                      fontSize: 12,
                      color: AppColors.danger,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }),

        const SizedBox(height: 32),
      ],
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
                fontSize: 28,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BoardReadinessCard extends StatelessWidget {
  final dynamic analysis;

  const _BoardReadinessCard({required this.analysis});

  @override
  Widget build(BuildContext context) {
    final domains = analysis.domainSummaries as Map<String, dynamic>;
    final totalExams = analysis.totalExams as int;
    final avgScore = analysis.averageScore as double;

    // Determine readiness per domain
    final domainReadiness = <String, double>{};
    const domainLabels = {
      'A': 'Data Acquisition',
      'B': 'Problem Solving',
      'C': 'Patient Management',
      'D': 'Systems-Based Practice',
      'E': 'Interpersonal Skills',
    };

    for (final d in ['A', 'B', 'C', 'D', 'E']) {
      final summary = domains[d];
      domainReadiness[d] = summary != null ? (summary.hitRate * 100) : 0.0;
    }

    // Overall readiness signal
    final allAbove70 = domainReadiness.values.every((v) => v >= 70);
    final allAbove50 = domainReadiness.values.every((v) => v >= 50);
    final weakestDomain = domainReadiness.entries
        .reduce((a, b) => a.value < b.value ? a : b);

    String readinessLabel;
    Color readinessColor;
    IconData readinessIcon;
    String readinessDetail;

    if (totalExams < 5) {
      readinessLabel = 'Insufficient Data';
      readinessColor = AppColors.textMuted;
      readinessIcon = Icons.hourglass_empty;
      readinessDetail =
          'Complete at least 5 practice exams to generate a readiness estimate. You have completed $totalExams so far.';
    } else if (allAbove70 && avgScore >= 70) {
      readinessLabel = 'Likely Ready';
      readinessColor = AppColors.success;
      readinessIcon = Icons.check_circle;
      readinessDetail =
          'Your performance across all 5 ABPMR domains exceeds 70%, which is consistent with the published Part II pass rate threshold. Continue practicing to maintain readiness.';
    } else if (allAbove50) {
      readinessLabel = 'Almost Ready';
      readinessColor = AppColors.warning;
      readinessIcon = Icons.trending_up;
      readinessDetail =
          'Most domains are above 50%, but ${domainLabels[weakestDomain.key]} (${weakestDomain.value.round()}%) needs improvement. Focus your study on this area.';
    } else {
      readinessLabel = 'Needs More Preparation';
      readinessColor = AppColors.danger;
      readinessIcon = Icons.schedule;
      readinessDetail =
          '${domainLabels[weakestDomain.key]} is at ${weakestDomain.value.round()}%. The ABPMR Part II pass rate is approximately 75-80%. Target consistent scores above 70% in all domains.';
    }

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: readinessColor.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: readinessColor.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(readinessIcon, color: readinessColor, size: 24),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  'Board Readiness',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.navy,
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: readinessColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  readinessLabel,
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: readinessColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            readinessDetail,
            style: GoogleFonts.sourceSerif4(
              fontSize: 13,
              color: AppColors.text,
            ),
          ),
          const SizedBox(height: 16),

          // Per-domain readiness bars
          ...['A', 'B', 'C', 'D', 'E'].map((d) {
            final pct = domainReadiness[d] ?? 0;
            final barColor = pct >= 70
                ? AppColors.success
                : (pct >= 50 ? AppColors.warning : AppColors.danger);
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  SizedBox(
                    width: 140,
                    child: Text(
                      '${domainLabels[d]}',
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: LinearProgressIndicator(
                        value: pct / 100,
                        backgroundColor: AppColors.surfaceAlt,
                        color: barColor,
                        minHeight: 6,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 36,
                    child: Text(
                      '${pct.round()}%',
                      textAlign: TextAlign.right,
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: barColor,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),

          const SizedBox(height: 8),
          Container(height: 1, color: AppColors.divider),
          const SizedBox(height: 8),
          Text(
            'Based on ${totalExams} practice exams. This reflects your practice performance, not a validated prediction of board outcomes.',
            style: GoogleFonts.dmSans(
              fontSize: 11,
              fontStyle: FontStyle.italic,
              color: AppColors.textLight,
            ),
          ),
        ],
      ),
    );
  }
}
