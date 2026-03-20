import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/exam_session_provider.dart';

class StudentTile extends ConsumerWidget {
  const StudentTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examState = ref.watch(examSessionProvider);
    final isActive = examState.isListening;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2332),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isActive
              ? const Color(0xFF00C853).withValues(alpha: 0.8)
              : Colors.transparent,
          width: 2,
        ),
        boxShadow: isActive
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
          // Initials circle
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: 0.1),
              border: Border.all(
                color: Colors.white.withValues(alpha: 0.15),
              ),
            ),
            child: Center(
              child: Icon(
                Icons.person_outline,
                size: 32,
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'You',
            style: GoogleFonts.dmSans(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.9),
            ),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isActive) ...[
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
                isActive ? 'Recording' : 'Ready',
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
