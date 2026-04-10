import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/feedback_model.dart';
import '../theme/app_theme.dart';

class FeedbackCard extends StatelessWidget {
  final dynamic feedback; // FeedbackAnalysis or String

  const FeedbackCard({super.key, required this.feedback});

  @override
  Widget build(BuildContext context) {
    if (feedback is String) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          feedback as String,
          style: GoogleFonts.sourceSerif4(color: AppColors.text),
        ),
      );
    }

    final fb = feedback as FeedbackAnalysis;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Metrics row
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Delivery
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
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
                        Icon(Icons.show_chart, size: 14,
                            color: AppColors.navy.withValues(alpha: 0.5)),
                        const SizedBox(width: 6),
                        Text('Delivery',
                            style: GoogleFonts.dmSans(
                              color: AppColors.navy,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              letterSpacing: 0.5,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    _MetricRow('Pacing', '${fb.delivery.wpm} WPM'),
                    _MetricRow('Tone', fb.delivery.tone),
                    _MetricRow('Conciseness', '${fb.delivery.concisenessScore}/10'),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Content score
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
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
                        Icon(Icons.bar_chart, size: 14,
                            color: AppColors.navy.withValues(alpha: 0.5)),
                        const SizedBox(width: 6),
                        Text('Content Accuracy',
                            style: GoogleFonts.dmSans(
                              color: AppColors.navy,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                              letterSpacing: 0.5,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '${fb.content.score}/10',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: fb.content.score >= 4
                            ? AppColors.success
                            : AppColors.danger,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Red flags
        if (fb.content.redFlags.isNotEmpty) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.danger.withValues(alpha: 0.05),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: AppColors.danger.withValues(alpha: 0.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.warning_amber, size: 16,
                        color: AppColors.danger),
                    const SizedBox(width: 8),
                    Text('Critical Safety Issues',
                        style: GoogleFonts.dmSans(
                          color: AppColors.danger,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        )),
                  ],
                ),
                const SizedBox(height: 10),
                ...fb.content.redFlags.map((flag) => Padding(
                      padding: const EdgeInsets.only(left: 4, bottom: 6),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 7),
                            width: 4,
                            height: 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.danger,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(flag,
                                style: GoogleFonts.sourceSerif4(
                                  color: AppColors.danger,
                                  fontSize: 14,
                                )),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],

        // Missed concepts
        Text('Missed Concepts',
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w600,
              fontSize: 13,
              letterSpacing: 0.5,
              color: AppColors.navy,
            )),
        const SizedBox(height: 8),
        if (fb.content.missedConcepts.isEmpty)
          Row(
            children: [
              Icon(Icons.check_circle, size: 16,
                  color: AppColors.success),
              const SizedBox(width: 8),
              Text('Great job! You covered the key points.',
                  style: GoogleFonts.sourceSerif4(
                    color: AppColors.success,
                    fontStyle: FontStyle.italic,
                  )),
            ],
          )
        else
          ...fb.content.missedConcepts.map((item) => Padding(
                padding: const EdgeInsets.only(left: 4, bottom: 6),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 7),
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.textMuted.withValues(alpha: 0.5),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(item,
                          style: GoogleFonts.sourceSerif4(
                            color: AppColors.textMuted,
                            fontSize: 14,
                          )),
                    ),
                  ],
                ),
              )),
        const SizedBox(height: 16),

        // Filler words
        if (fb.delivery.fillerWords.isNotEmpty) ...[
          Row(
            children: [
              Icon(Icons.mic, size: 14,
                  color: AppColors.navy.withValues(alpha: 0.5)),
              const SizedBox(width: 8),
              Text('Detected Filler Words',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    letterSpacing: 0.5,
                    color: AppColors.navy,
                  )),
            ],
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 6,
            children: fb.delivery.fillerWords
                .map((word) => Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceAlt,
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: AppColors.border),
                      ),
                      child: Text(
                        '\u201c$word\u201d',
                        style: GoogleFonts.sourceSerif4(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ))
                .toList(),
          ),
          const SizedBox(height: 16),
        ],

        // Golden response
        Container(height: 1, color: AppColors.divider),
        const SizedBox(height: 16),
        Row(
          children: [
            Icon(Icons.auto_awesome, size: 16,
                color: AppColors.burgundy.withValues(alpha: 0.7)),
            const SizedBox(width: 8),
            Text('Golden Response',
                style: GoogleFonts.playfairDisplay(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  color: AppColors.burgundy,
                )),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border(
              left: BorderSide(color: AppColors.burgundy, width: 3),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            fb.goldenResponse,
            style: GoogleFonts.sourceSerif4(
              color: AppColors.text,
              fontStyle: FontStyle.italic,
              fontSize: 14,
              height: 1.7,
            ),
          ),
        ),
      ],
    );
  }
}

class _MetricRow extends StatelessWidget {
  final String label;
  final String value;

  const _MetricRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: GoogleFonts.dmSans(
                color: AppColors.textMuted,
                fontSize: 13,
              )),
          Text(value,
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w600,
                fontSize: 13,
                color: AppColors.text,
              )),
        ],
      ),
    );
  }
}
