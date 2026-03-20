import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/exam_session_provider.dart';
import '../../providers/timer_provider.dart';
import '../../theme/app_theme.dart';

class ExamHeader extends ConsumerWidget {
  final VoidCallback onBack;
  final VoidCallback onEndExam;

  const ExamHeader({
    super.key,
    required this.onBack,
    required this.onEndExam,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final timer = ref.watch(timerProvider);
    final examState = ref.watch(examSessionProvider);
    final sectionCount = examState.examSections.length;
    final currentIdx = examState.currentSectionIndex + 1;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          bottom: BorderSide(color: AppColors.border),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Back button
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => _confirmBack(context, onBack),
                borderRadius: BorderRadius.circular(6),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.border),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.arrow_back, size: 16, color: AppColors.navy),
                      const SizedBox(width: 6),
                      Text(
                        'Exit',
                        style: GoogleFonts.dmSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.navy,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(width: 16),

            // Case title
            Expanded(
              child: Text(
                examState.caseTitle,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),

            // Section progress
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surfaceAlt,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                '$currentIdx / $sectionCount',
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textMuted,
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Timer
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.surfaceAlt,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.access_time, size: 14, color: AppColors.navy.withValues(alpha: 0.5)),
                  const SizedBox(width: 6),
                  Text(
                    timer.formatted,
                    style: GoogleFonts.jetBrainsMono(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.navy,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // End Exam button
            Material(
              color: AppColors.burgundy,
              borderRadius: BorderRadius.circular(6),
              child: InkWell(
                onTap: onEndExam,
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                  child: Text(
                    'End Exam',
                    style: GoogleFonts.dmSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _confirmBack(BuildContext context, VoidCallback onConfirm) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Leave Exam?',
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.w700,
            color: AppColors.navy,
          ),
        ),
        content: Text(
          'Your exam progress will be lost.',
          style: GoogleFonts.sourceSerif4(color: AppColors.text),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel',
                style: GoogleFonts.dmSans(color: AppColors.textMuted)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              onConfirm();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.burgundy,
              foregroundColor: Colors.white,
            ),
            child: Text('Leave', style: GoogleFonts.dmSans()),
          ),
        ],
      ),
    );
  }
}
