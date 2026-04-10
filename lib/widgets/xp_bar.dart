import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../providers/xp_provider.dart';
import '../theme/app_theme.dart';

class XpBar extends ConsumerStatefulWidget {
  const XpBar({super.key});

  @override
  ConsumerState<XpBar> createState() => _XpBarState();
}

class _XpBarState extends ConsumerState<XpBar> with TickerProviderStateMixin {
  late AnimationController _popupController;
  late AnimationController _glowController;
  late Animation<double> _popupOpacity;
  late Animation<Offset> _popupSlide;
  late Animation<double> _glowOpacity;

  XpAward? _displayedAward;

  @override
  void initState() {
    super.initState();

    _popupController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _popupOpacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 1), weight: 20),
      TweenSequenceItem(tween: Tween(begin: 1, end: 1), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1, end: 0), weight: 30),
    ]).animate(_popupController);
    _popupSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: const Offset(0, -1.0),
    ).animate(CurvedAnimation(parent: _popupController, curve: Curves.easeOut));

    _glowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _glowOpacity = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 0, end: 0.6), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 0.6, end: 0), weight: 70),
    ]).animate(_glowController);
  }

  @override
  void dispose() {
    _popupController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  void _showAward(XpAward award) {
    setState(() => _displayedAward = award);
    _popupController.forward(from: 0);
    if (award.leveledUp) {
      _glowController.forward(from: 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final xpAsync = ref.watch(xpProvider);

    // Trigger animation when a new award comes in
    ref.listen<XpAward?>(lastXpAwardProvider, (prev, next) {
      if (next != null && next != prev) {
        _showAward(next);
      }
    });

    return xpAsync.when(
      loading: () => const SizedBox(height: 32),
      error: (_, _) => const SizedBox.shrink(),
      data: (xpState) {
        final progress = xpState.xpToNextLevel > 0
            ? (xpState.xpForCurrentLevel / xpState.xpToNextLevel)
                .clamp(0.0, 1.0)
            : 1.0;

        return SizedBox(
          height: 32,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              // Glow effect for level-up
              if (_displayedAward?.leveledUp == true)
                Positioned.fill(
                  child: AnimatedBuilder(
                    animation: _glowController,
                    builder: (context, _) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFD4A843)
                                  .withValues(alpha: _glowOpacity.value),
                              blurRadius: 16,
                              spreadRadius: 4,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),

              // Main bar row
              Row(
                children: [
                  // Level badge
                  Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.navy,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.navy.withValues(alpha: 0.3),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      '${xpState.level}',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),

                  // Progress bar
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Label row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Level ${xpState.level}',
                              style: GoogleFonts.dmSans(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.navy,
                              ),
                            ),
                            Text(
                              '${xpState.xpForCurrentLevel} / ${xpState.xpToNextLevel} XP',
                              style: GoogleFonts.jetBrainsMono(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFFD4A843),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        // Bar
                        ClipRRect(
                          borderRadius: BorderRadius.circular(3),
                          child: TweenAnimationBuilder<double>(
                            tween: Tween(begin: 0, end: progress),
                            duration: const Duration(milliseconds: 600),
                            curve: Curves.easeOutCubic,
                            builder: (context, value, _) {
                              return LinearProgressIndicator(
                                value: value,
                                backgroundColor: AppColors.surfaceAlt,
                                color: AppColors.navy,
                                minHeight: 5,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              // Floating "+XP" popup
              if (_displayedAward != null)
                Positioned(
                  right: 0,
                  top: -8,
                  child: SlideTransition(
                    position: _popupSlide,
                    child: FadeTransition(
                      opacity: _popupOpacity,
                      child: Text(
                        '+${_displayedAward!.amount} XP',
                        style: GoogleFonts.jetBrainsMono(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFD4A843),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
