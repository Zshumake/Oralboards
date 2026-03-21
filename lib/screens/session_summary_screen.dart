import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/exam_models.dart';
import '../models/multi_case_session.dart';
import '../providers/multi_case_provider.dart';
import '../theme/app_theme.dart';

class SessionSummaryScreen extends ConsumerWidget {
  const SessionSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final session = ref.watch(multiCaseProvider);
    if (session == null) {
      return const Scaffold(body: Center(child: Text('No session')));
    }

    // Aggregate stats
    int totalHit = 0;
    int totalMissed = 0;
    int totalRedFlags = 0;
    int totalTime = 0;

    for (final state in session.completedCaseStates.values) {
      for (final s in state.sectionScores.values) {
        totalHit += s.conceptsHit.length;
        totalMissed += s.conceptsMissed.length;
        totalRedFlags += s.redFlags.length;
      }
      for (final t in state.sectionTimings.values) {
        totalTime += t.elapsedSeconds;
      }
    }

    final total = totalHit + totalMissed;
    final overallPercent = total > 0 ? (totalHit / total * 100).round() : 0;
    final timeMin = totalTime ~/ 60;
    final timeSec = totalTime % 60;
    final timeStr =
        '${timeMin.toString().padLeft(2, '0')}:${timeSec.toString().padLeft(2, '0')}';

    return Scaffold(
      body: SafeArea(
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
                        'Session Complete',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: AppColors.navy,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${session.casesCompleted} of ${session.totalCases} cases examined',
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

                // Summary row
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
                      label: 'Total Time',
                      value: timeStr,
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

                // Per-case breakdown
                Text(
                  'Case Breakdown',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.navy,
                  ),
                ),
                const SizedBox(height: 16),

                ...session.cases.map((caseModel) {
                  final state =
                      session.completedCaseStates[caseModel.id];
                  if (state == null) {
                    return _CaseResultCard(
                      title: caseModel.title,
                      percent: null,
                      redFlags: 0,
                      isSkipped: true,
                      sectionScores: const [],
                    );
                  }
                  final scores = state.sectionScores.values.toList();
                  final hit = scores.fold<int>(
                      0, (sum, s) => sum + s.conceptsHit.length);
                  final missed = scores.fold<int>(
                      0, (sum, s) => sum + s.conceptsMissed.length);
                  final t = hit + missed;
                  final pct = t > 0 ? (hit / t * 100).round() : 0;
                  final rf = scores.fold<int>(
                      0, (sum, s) => sum + s.redFlags.length);

                  return _CaseResultCard(
                    title: caseModel.title,
                    percent: pct,
                    redFlags: rf,
                    isSkipped: false,
                    sectionScores: scores,
                  );
                }),

                const SizedBox(height: 32),
                Container(height: 1, color: AppColors.divider),
                const SizedBox(height: 24),

                // Actions
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      ref.read(multiCaseProvider.notifier).clearSession();
                      Navigator.of(context)
                          .popUntil((route) => route.isFirst);
                    },
                    icon: const Icon(Icons.home_outlined, size: 16),
                    label: Text(
                      'Return Home',
                      style:
                          GoogleFonts.dmSans(fontWeight: FontWeight.w600),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navy,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 14),
                    ),
                  ),
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

class _CaseResultCard extends StatefulWidget {
  final String title;
  final int? percent;
  final int redFlags;
  final bool isSkipped;
  final List<SectionScore> sectionScores;

  const _CaseResultCard({
    required this.title,
    required this.percent,
    required this.redFlags,
    required this.isSkipped,
    required this.sectionScores,
  });

  @override
  State<_CaseResultCard> createState() => _CaseResultCardState();
}

class _CaseResultCardState extends State<_CaseResultCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final color = widget.isSkipped
        ? AppColors.textMuted
        : (widget.percent! >= 70
            ? AppColors.success
            : (widget.percent! >= 50
                ? AppColors.warning
                : AppColors.danger));

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
          InkWell(
            onTap: widget.isSkipped
                ? null
                : () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        widget.isSkipped ? '--' : '${widget.percent}%',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: color,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: widget.isSkipped
                                ? AppColors.textMuted
                                : AppColors.navy,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (widget.isSkipped)
                          Text(
                            'Not attempted',
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                              color: AppColors.textMuted,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (widget.redFlags > 0) ...[
                    const Icon(Icons.warning_amber,
                        size: 14, color: AppColors.danger),
                    const SizedBox(width: 4),
                    Text(
                      '${widget.redFlags}',
                      style: GoogleFonts.dmSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.danger,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  if (!widget.isSkipped)
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(Icons.expand_more,
                          size: 20, color: AppColors.textMuted),
                    ),
                ],
              ),
            ),
          ),
          if (_isExpanded && !widget.isSkipped)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                children: [
                  Container(height: 1, color: AppColors.divider),
                  const SizedBox(height: 12),
                  ...widget.sectionScores.map((s) {
                    final t =
                        s.conceptsHit.length + s.conceptsMissed.length;
                    final pct = t > 0 ? s.conceptsHit.length / t : 1.0;
                    final pctColor = pct >= 0.7
                        ? AppColors.success
                        : (pct >= 0.4 ? AppColors.warning : AppColors.danger);

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              s.sectionTitle,
                              style: GoogleFonts.dmSans(
                                fontSize: 12,
                                color: AppColors.text,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(3),
                              child: LinearProgressIndicator(
                                value: pct,
                                backgroundColor: AppColors.surfaceAlt,
                                color: pctColor,
                                minHeight: 4,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            width: 36,
                            child: Text(
                              '${(pct * 100).round()}%',
                              textAlign: TextAlign.right,
                              style: GoogleFonts.dmSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: pctColor,
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
        ],
      ),
    );
  }
}
