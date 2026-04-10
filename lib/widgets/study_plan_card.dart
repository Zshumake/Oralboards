import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/case_model.dart';
import '../providers/study_plan_provider.dart';
import '../theme/app_theme.dart';

class StudyPlanCard extends ConsumerWidget {
  final void Function(CaseModel caseData) onOpenCase;

  const StudyPlanCard({super.key, required this.onOpenCase});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final plan = ref.watch(studyPlanProvider);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Countdown section with urgency tint
          _CountdownSection(plan: plan),
          // Divider
          Container(height: 1, color: AppColors.divider),
          // Today's Focus section
          _TodaysFocusSection(plan: plan, onOpenCase: onOpenCase),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Countdown section
// ---------------------------------------------------------------------------
class _CountdownSection extends StatelessWidget {
  final DailyStudyPlan plan;

  const _CountdownSection({required this.plan});

  Color _urgencyColor() {
    switch (plan.urgencyLevel) {
      case UrgencyLevel.relaxed:
        return AppColors.navy;
      case UrgencyLevel.moderate:
        return AppColors.warning;
      case UrgencyLevel.urgent:
        return AppColors.danger;
      case UrgencyLevel.critical:
        return AppColors.danger;
    }
  }

  Color _urgencyBgTint() {
    switch (plan.urgencyLevel) {
      case UrgencyLevel.relaxed:
        return AppColors.navy.withValues(alpha: 0.03);
      case UrgencyLevel.moderate:
        return AppColors.warning.withValues(alpha: 0.05);
      case UrgencyLevel.urgent:
        return AppColors.danger.withValues(alpha: 0.05);
      case UrgencyLevel.critical:
        return AppColors.danger.withValues(alpha: 0.08);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _urgencyColor();
    final bgTint = _urgencyBgTint();
    final hasDays = plan.daysUntilExam != null;
    final progress = plan.topicsTotal > 0
        ? plan.topicsCovered / plan.topicsTotal
        : 0.0;

    return Container(
      decoration: BoxDecoration(
        color: bgTint,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Countdown number + label
          Expanded(
            child: hasDays
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${plan.daysUntilExam}',
                            style: GoogleFonts.jetBrainsMono(
                              fontSize: 40,
                              fontWeight: FontWeight.w700,
                              color: color,
                              height: 1.0,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'days until boards',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: color,
                            ),
                          ),
                        ],
                      ),
                      if (plan.urgencyLevel == UrgencyLevel.critical) ...[
                        const SizedBox(height: 4),
                        Text(
                          'Final stretch — focus on weak areas',
                          style: GoogleFonts.sourceSerif4(
                            fontSize: 13,
                            fontStyle: FontStyle.italic,
                            color: AppColors.danger,
                          ),
                        ),
                      ],
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Set your exam date',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: AppColors.navy,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Open Settings to add your board exam date',
                        style: GoogleFonts.sourceSerif4(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
          ),

          const SizedBox(width: 16),

          // Topics progress ring
          _TopicsRing(
            covered: plan.topicsCovered,
            total: plan.topicsTotal,
            progress: progress,
            color: color,
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Circular progress ring for topics covered
// ---------------------------------------------------------------------------
class _TopicsRing extends StatelessWidget {
  final int covered;
  final int total;
  final double progress;
  final Color color;

  const _TopicsRing({
    required this.covered,
    required this.total,
    required this.progress,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      height: 64,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(64, 64),
            painter: _RingPainter(
              progress: progress,
              color: color,
              trackColor: AppColors.divider,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$covered',
                style: GoogleFonts.jetBrainsMono(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: color,
                  height: 1.0,
                ),
              ),
              Text(
                'of $total',
                style: GoogleFonts.dmSans(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textMuted,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  final double progress;
  final Color color;
  final Color trackColor;

  _RingPainter({
    required this.progress,
    required this.color,
    required this.trackColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;
    const strokeWidth = 5.0;

    // Track
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, trackPaint);

    // Progress arc
    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    final sweepAngle = 2 * math.pi * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}

// ---------------------------------------------------------------------------
// Today's Focus section
// ---------------------------------------------------------------------------
class _TodaysFocusSection extends StatelessWidget {
  final DailyStudyPlan plan;
  final void Function(CaseModel caseData) onOpenCase;

  const _TodaysFocusSection({
    required this.plan,
    required this.onOpenCase,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                size: 16,
                color: AppColors.warning,
              ),
              const SizedBox(width: 6),
              Text(
                "TODAY'S FOCUS",
                style: GoogleFonts.dmSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  color: AppColors.warning,
                  letterSpacing: 1.5,
                ),
              ),
              if (plan.focusDomain != null) ...[
                const SizedBox(width: 12),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.navy.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    plan.focusDomain!,
                    style: GoogleFonts.dmSans(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.navy,
                    ),
                  ),
                ),
              ],
            ],
          ),

          const SizedBox(height: 12),

          // Case recommendations
          if (plan.recommendedCases.isEmpty)
            _EmptyFocusState()
          else
            ...plan.recommendedCases.map(
              (pc) => _PlannedCaseRow(
                plannedCase: pc,
                onTap: () => onOpenCase(pc.caseModel),
              ),
            ),

          // Start button
          if (plan.recommendedCases.isNotEmpty) ...[
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () =>
                    onOpenCase(plan.recommendedCases.first.caseModel),
                icon: const Icon(Icons.play_arrow_rounded, size: 18),
                label: Text(
                  "Start Today's Session",
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.burgundy,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Single planned case row
// ---------------------------------------------------------------------------
class _PlannedCaseRow extends StatelessWidget {
  final PlannedCase plannedCase;
  final VoidCallback onTap;

  const _PlannedCaseRow({required this.plannedCase, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.surfaceAlt.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: AppColors.border.withValues(alpha: 0.6),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bullet
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: AppColors.burgundy,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      plannedCase.caseModel.title,
                      style: GoogleFonts.dmSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.navy,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      plannedCase.reason,
                      style: GoogleFonts.sourceSerif4(
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        color: AppColors.textMuted,
                        height: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Empty state when no recommendations
// ---------------------------------------------------------------------------
class _EmptyFocusState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        'Complete a few cases to unlock personalized study recommendations.',
        style: GoogleFonts.sourceSerif4(
          fontSize: 13,
          fontStyle: FontStyle.italic,
          color: AppColors.textMuted,
        ),
      ),
    );
  }
}
