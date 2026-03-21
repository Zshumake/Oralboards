import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/recommendations_provider.dart';
import '../theme/app_theme.dart';

class RecommendationCard extends StatelessWidget {
  final CaseRecommendation recommendation;
  final VoidCallback onTap;

  const RecommendationCard({
    super.key,
    required this.recommendation,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 240,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
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
            Text(
              recommendation.caseModel.title,
              style: GoogleFonts.playfairDisplay(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.navy,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            Text(
              recommendation.reason,
              style: GoogleFonts.dmSans(
                fontSize: 12,
                color: AppColors.textMuted,
                fontStyle: FontStyle.italic,
              ),
            ),
            const Spacer(),
            if (recommendation.matchedWeakConcepts.isNotEmpty) ...[
              Wrap(
                spacing: 4,
                runSpacing: 4,
                children: recommendation.matchedWeakConcepts
                    .map((c) => Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: AppColors.burgundy.withValues(alpha: 0.08),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Text(
                            c,
                            style: GoogleFonts.dmSans(
                              fontSize: 9,
                              color: AppColors.burgundy,
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
              ),
              const SizedBox(height: 8),
            ],
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Practice',
                  style: GoogleFonts.dmSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.burgundy,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward,
                    size: 14, color: AppColors.burgundy),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
