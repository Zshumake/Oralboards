import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/case_model.dart';
import '../providers/history_provider.dart';
import '../theme/app_theme.dart';

class CaseCard extends ConsumerStatefulWidget {
  final CaseModel data;
  final VoidCallback onTap;

  const CaseCard({super.key, required this.data, required this.onTap});

  @override
  ConsumerState<CaseCard> createState() => _CaseCardState();
}

class _CaseCardState extends ConsumerState<CaseCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final latestResult = ref.watch(latestCaseResultProvider(widget.data.id));

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onTap();
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..scale(_isPressed ? 0.97 : 1.0),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: _isPressed ? 0.03 : 0.06),
              blurRadius: _isPressed ? 4 : 12,
              offset: Offset(0, _isPressed ? 1 : 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: icon + score badge + arrow
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppColors.navy.withValues(alpha: 0.08),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.medical_services_outlined,
                      size: 18,
                      color: AppColors.navy,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Last score badge
                      latestResult.when(
                        data: (result) {
                          if (result == null) return const SizedBox.shrink();
                          final pct = (result.overallScore * 100).round();
                          final color = pct >= 70
                              ? AppColors.success
                              : (pct >= 50
                                  ? AppColors.warning
                                  : AppColors.danger);
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: color.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              '$pct%',
                              style: GoogleFonts.dmSans(
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                color: color,
                              ),
                            ),
                          );
                        },
                        loading: () => const SizedBox.shrink(),
                        error: (_, __) => const SizedBox.shrink(),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.arrow_forward,
                        size: 16,
                        color: AppColors.burgundy.withValues(alpha: 0.6),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Title
              Text(
                widget.data.title,
                style: GoogleFonts.playfairDisplay(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 8),
              // Description
              Expanded(
                child: Text(
                  widget.data.sections.isNotEmpty
                      ? widget.data.sections.first.content
                      : 'Practice case for PM&R oral board examination.',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.sourceSerif4(
                    fontSize: 13,
                    height: 1.5,
                    color: AppColors.textMuted,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Badges
              Row(
                children: [
                  if (widget.data.isCustom) ...[
                    _Badge('Custom', AppColors.burgundy),
                    const SizedBox(width: 8),
                  ] else ...[
                    _Badge('High Yield', AppColors.navy),
                    const SizedBox(width: 8),
                  ],
                  _Badge('Practice', AppColors.burgundy),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;

  const _Badge(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: color.withValues(alpha: 0.3), width: 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label.toUpperCase(),
        style: GoogleFonts.dmSans(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: color,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
