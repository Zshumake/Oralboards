import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

/// Ice-blue accent color for streak freeze elements.
const _iceBlue = Color(0xFF5BA4CF);
const _iceBlueBg = Color(0xFFE8F4FD);

/// Compact indicator showing available streak freezes as shield icons.
///
/// When [freezeUsedToday] is true, displays an animated "Freeze active" banner
/// instead of the shield count.
class StreakFreezeIndicator extends StatefulWidget {
  final int freezesAvailable;
  final bool freezeUsedToday;

  const StreakFreezeIndicator({
    super.key,
    required this.freezesAvailable,
    required this.freezeUsedToday,
  });

  @override
  State<StreakFreezeIndicator> createState() => _StreakFreezeIndicatorState();
}

class _StreakFreezeIndicatorState extends State<StreakFreezeIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
    if (widget.freezeUsedToday) {
      _pulseController.repeat(reverse: true);
    }
  }

  @override
  void didUpdateWidget(covariant StreakFreezeIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.freezeUsedToday && !_pulseController.isAnimating) {
      _pulseController.repeat(reverse: true);
    } else if (!widget.freezeUsedToday && _pulseController.isAnimating) {
      _pulseController.stop();
      _pulseController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.freezeUsedToday) {
      return _buildActiveBanner();
    }
    return _buildFreezeCount();
  }

  Widget _buildActiveBanner() {
    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return Opacity(
          opacity: _pulseAnimation.value,
          child: child,
        );
      },
      child: Tooltip(
        message:
            'A streak freeze was used to protect your streak today.\nYou get 1 new freeze per week (max 2).',
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color: _iceBlueBg,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: _iceBlue.withValues(alpha: 0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.ac_unit, size: 13, color: _iceBlue),
              const SizedBox(width: 4),
              Text(
                'Freeze active',
                style: GoogleFonts.dmSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: _iceBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFreezeCount() {
    return Tooltip(
      message:
          'Streak freezes protect your streak when you miss a day.\nYou get 1 per week (max 2). Available: ${widget.freezesAvailable}',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < 2; i++)
            Padding(
              padding: EdgeInsets.only(left: i > 0 ? 2.0 : 0),
              child: Icon(
                Icons.shield,
                size: 14,
                color: i < widget.freezesAvailable
                    ? _iceBlue
                    : AppColors.textLight.withValues(alpha: 0.4),
              ),
            ),
        ],
      ),
    );
  }
}
