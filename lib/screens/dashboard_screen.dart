import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/analytics_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/benchmark_section.dart';
import '../widgets/charts/domain_bar_chart.dart';
import '../widgets/charts/score_trend_chart.dart';
import '../widgets/export_report_button.dart';

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
              loading: () => const Center(
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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.insights,
              size: 48, color: AppColors.textMuted.withValues(alpha: 0.4)),
          const SizedBox(height: 16),
          Text(
            'No Data Yet',
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Complete some exam simulations to see your analytics.',
            style: GoogleFonts.sourceSerif4(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Go Back', style: GoogleFonts.dmSans()),
          ),
        ],
      ),
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
