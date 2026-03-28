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

  static const _domainNames = {
    'A': 'Data Acquisition',
    'B': 'Problem Solving',
    'C': 'Patient Management',
    'D': 'Systems-Based Practice',
    'E': 'Interpersonal & Communication Skills',
  };

  static const _abpmrQuestions = {
    'A': 'Did the candidate identify the appropriate data required to correctly diagnose and manage the patient?',
    'B': 'Did the candidate collect data to select among reasonable alternative diagnoses while ensuring patient stabilization?',
    'C': 'Did the candidate treat or direct appropriate treatment(s) at the appropriate times?',
    'D': 'Did the treatment plan include proper referral and appropriate risk/benefit analysis?',
    'E': 'Is the candidate able to provide appropriate explanations and respond ethically and sensitively?',
  };

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

    // Group scores by ABPMR domain
    final domainGroups = <String, List<SectionScore>>{};
    for (final score in scores) {
      final domain = score.domain ?? _inferDomain(score.sectionTitle) ?? '?';
      domainGroups.putIfAbsent(domain, () => []).add(score);
    }
    // Sort domains A-E
    final sortedDomains = domainGroups.keys.toList()
      ..sort((a, b) => a.compareTo(b));

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

                // Domain-grouped breakdown
                Text(
                  'ABPMR Domain Performance',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: AppColors.navy,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Scored independently per official ABPMR Part II criteria',
                  style: GoogleFonts.sourceSerif4(
                    fontSize: 13,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 20),

                ...sortedDomains.map((domain) {
                  final domainScores = domainGroups[domain]!;
                  return _DomainGroup(
                    domain: domain,
                    domainName: _domainNames[domain] ?? domain,
                    abpmrQuestion: _abpmrQuestions[domain] ?? '',
                    scores: domainScores,
                    timings: examState.sectionTimings,
                  );
                }),

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

  static String? _inferDomain(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('domain b') || lower.contains('problem solving')) return 'B';
    if (lower.contains('domain c') || lower.contains('patient management')) return 'C';
    if (lower.contains('domain d') || lower.contains('systems')) return 'D';
    if (lower.contains('domain e') || lower.contains('interpersonal')) return 'E';
    if (lower.contains('history') || lower.contains('physical')) return 'A';
    return null;
  }
}

class _DomainGroup extends StatelessWidget {
  final String domain;
  final String domainName;
  final String abpmrQuestion;
  final List<SectionScore> scores;
  final Map<String, SectionTiming> timings;

  const _DomainGroup({
    required this.domain,
    required this.domainName,
    required this.abpmrQuestion,
    required this.scores,
    required this.timings,
  });

  @override
  Widget build(BuildContext context) {
    final domainHit = scores.fold<int>(0, (s, sc) => s + sc.conceptsHit.length);
    final domainMissed = scores.fold<int>(0, (s, sc) => s + sc.conceptsMissed.length);
    final domainTotal = domainHit + domainMissed;
    final domainPercent = domainTotal > 0 ? domainHit / domainTotal : 0.0;
    final percentInt = (domainPercent * 100).round();

    final statusColor = domainPercent >= 0.7
        ? AppColors.success
        : (domainPercent >= 0.4 ? AppColors.warning : AppColors.danger);
    final statusIcon = domainPercent >= 0.7
        ? Icons.check_circle_outline
        : (domainPercent >= 0.4 ? Icons.warning_amber_rounded : Icons.cancel_outlined);

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Domain header
          Container(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
            decoration: BoxDecoration(
              color: AppColors.navy.withValues(alpha: 0.03),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: AppColors.navy,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Domain $domain',
                        style: GoogleFonts.dmSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        domainName,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.navy,
                        ),
                      ),
                    ),
                    Icon(statusIcon, size: 22, color: statusColor),
                    const SizedBox(width: 6),
                    Text(
                      '$percentInt%',
                      style: GoogleFonts.jetBrainsMono(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: statusColor,
                      ),
                    ),
                  ],
                ),
                if (abpmrQuestion.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    abpmrQuestion,
                    style: GoogleFonts.sourceSerif4(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
                const SizedBox(height: 10),
                // Domain-level progress bar
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: domainPercent,
                    backgroundColor: AppColors.surfaceAlt,
                    color: statusColor,
                    minHeight: 5,
                  ),
                ),
              ],
            ),
          ),

          // Section cards within this domain
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
            child: Column(
              children: scores.map((score) => _SectionScoreCard(
                score: score,
                timing: timings[score.sectionId],
              )).toList(),
            ),
          ),
        ],
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
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(6),
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
                  style: GoogleFonts.dmSans(
                    fontSize: 13,
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
                        fontSize: 11,
                        color: AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Container(width: 1, height: 10, color: AppColors.divider),
                    const SizedBox(width: 6),
                  ],
                  Text(
                    '${score.turnsTaken} turns',
                    style: GoogleFonts.dmSans(
                      fontSize: 11,
                      color: AppColors.textMuted,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Progress bar
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: percent,
                    backgroundColor: AppColors.surfaceAlt,
                    color: percent >= 0.7
                        ? AppColors.success
                        : (percent >= 0.4
                            ? AppColors.warning
                            : AppColors.danger),
                    minHeight: 4,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${score.conceptsHit.length}/$total',
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.text,
                ),
              ),
            ],
          ),

          // Missed concepts
          if (score.conceptsMissed.isNotEmpty) ...[
            const SizedBox(height: 8),
            Text(
              'Missed:',
              style: GoogleFonts.dmSans(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: AppColors.burgundy,
              ),
            ),
            const SizedBox(height: 2),
            ...score.conceptsMissed.map((c) => Padding(
                  padding: const EdgeInsets.only(left: 6, bottom: 2),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: 3,
                        height: 3,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.burgundy.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text(
                          c,
                          style: GoogleFonts.sourceSerif4(
                            fontSize: 12,
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
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.danger.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                    color: AppColors.danger.withValues(alpha: 0.2)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.warning_amber,
                          size: 12, color: AppColors.danger),
                      const SizedBox(width: 4),
                      Text(
                        'Safety Concerns',
                        style: GoogleFonts.dmSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.danger,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  ...score.redFlags.map((f) => Padding(
                        padding: const EdgeInsets.only(bottom: 2),
                        child: Text(
                          '• $f',
                          style: GoogleFonts.sourceSerif4(
                            fontSize: 12,
                            color: AppColors.danger,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],

          // Teaching moment
          if (score.teachingPoint.isNotEmpty) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.navy.withValues(alpha: 0.04),
                borderRadius: BorderRadius.circular(4),
                border: Border(
                  left: BorderSide(
                    color: AppColors.navy.withValues(alpha: 0.3),
                    width: 3,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_outline,
                          size: 12, color: AppColors.navy),
                      const SizedBox(width: 4),
                      Text(
                        'Teaching Point',
                        style: GoogleFonts.dmSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.navy,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    score.teachingPoint,
                    style: GoogleFonts.sourceSerif4(
                      fontSize: 12,
                      color: AppColors.text,
                    ),
                  ),
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
