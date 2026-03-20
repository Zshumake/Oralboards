import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/exam_session_provider.dart';
import '../../theme/app_theme.dart';

class ExaminerTile extends ConsumerStatefulWidget {
  const ExaminerTile({super.key});

  @override
  ConsumerState<ExaminerTile> createState() => _ExaminerTileState();
}

class _ExaminerTileState extends ConsumerState<ExaminerTile>
    with TickerProviderStateMixin {
  late AnimationController _breathController;
  late AnimationController _blinkController;
  Timer? _blinkTimer;
  final _random = Random();

  @override
  void initState() {
    super.initState();
    // Breathing: subtle scale oscillation
    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);

    // Blink
    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _scheduleBlink();
  }

  void _scheduleBlink() {
    final delay = 3000 + _random.nextInt(3000); // 3-6 seconds
    _blinkTimer = Timer(Duration(milliseconds: delay), () {
      if (mounted) {
        _blinkController.forward().then((_) {
          if (mounted) {
            _blinkController.reverse();
            _scheduleBlink();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _breathController.dispose();
    _blinkController.dispose();
    _blinkTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final examState = ref.watch(examSessionProvider);
    final isSpeaking = examState.isTtsSpeaking || examState.isExaminerActive;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1B2A),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isSpeaking
              ? const Color(0xFF00C853).withValues(alpha: 0.8)
              : Colors.transparent,
          width: 2,
        ),
        boxShadow: isSpeaking
            ? [
                BoxShadow(
                  color: const Color(0xFF00C853).withValues(alpha: 0.15),
                  blurRadius: 12,
                ),
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          // Avatar with breathing animation
          AnimatedBuilder(
            animation: _breathController,
            builder: (context, child) {
              final scale = 1.0 + (_breathController.value * 0.015);
              return Transform.scale(
                scale: scale,
                child: child,
              );
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ),
                // Blink overlay
                AnimatedBuilder(
                  animation: _blinkController,
                  builder: (context, _) {
                    return Positioned(
                      top: 20,
                      child: Container(
                        width: 36,
                        height: 8 * _blinkController.value,
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D1B2A),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Name
          Text(
            'Dr. Examiner',
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 2),
          // Status
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isSpeaking) ...[
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFF00C853),
                  ),
                ),
                const SizedBox(width: 4),
              ],
              Text(
                isSpeaking ? 'Speaking' : 'Listening',
                style: GoogleFonts.dmSans(
                  fontSize: 10,
                  color: Colors.white.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
