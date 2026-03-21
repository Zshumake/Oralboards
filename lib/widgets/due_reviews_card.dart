import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/cases/all_cases.dart';
import '../providers/cases_provider.dart';
import '../providers/review_provider.dart';
import '../screens/exam_screen.dart';
import '../theme/app_theme.dart';

class DueReviewsCard extends ConsumerWidget {
  const DueReviewsCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reviewState = ref.watch(reviewProvider).valueOrNull;
    if (reviewState == null || reviewState.dueReviews.isEmpty) {
      return const SizedBox.shrink();
    }

    final dueCount = reviewState.dueReviews.length;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.burgundy.withValues(alpha: 0.2)),
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
              Icon(Icons.replay, size: 16, color: AppColors.burgundy),
              const SizedBox(width: 8),
              Text(
                '$dueCount ${dueCount == 1 ? 'case' : 'cases'} due for review',
                style: GoogleFonts.dmSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.burgundy,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 36,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: reviewState.dueReviews.length,
              itemBuilder: (context, index) {
                final review = reviewState.dueReviews[index];
                final caseModel = allCases
                    .where((c) => c.id == review.caseId)
                    .firstOrNull;
                if (caseModel == null) return const SizedBox.shrink();

                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: InkWell(
                    onTap: () {
                      ref.read(isExamModeProvider.notifier).state = true;
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              ExamScreen(caseData: caseModel),
                        ),
                      );
                    },
                    borderRadius: BorderRadius.circular(4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: AppColors.burgundy.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            caseModel.title,
                            style: GoogleFonts.dmSans(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.burgundy,
                            ),
                          ),
                          if (review.daysOverdue > 0) ...[
                            const SizedBox(width: 6),
                            Text(
                              '${review.daysOverdue}d overdue',
                              style: GoogleFonts.dmSans(
                                fontSize: 10,
                                color: AppColors.danger,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
