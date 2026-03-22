import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../providers/exam_session_provider.dart';
import 'animated_avatar.dart';
import 'avatar_state.dart';

class ExaminerTile extends ConsumerWidget {
  const ExaminerTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final examState = ref.watch(examSessionProvider);
    final avatarSt = deriveAvatarState(examState);
    final isSpeaking =
        examState.isTtsSpeaking || examState.isExaminerActive;

    String statusText;
    switch (avatarSt) {
      case AvatarState.speaking:
        statusText = 'Speaking';
      case AvatarState.thinking:
        statusText = 'Thinking...';
      case AvatarState.listening:
        statusText = 'Listening';
      case AvatarState.idle:
        statusText = 'Ready';
    }

    return Semantics(
      label: 'Examiner Dr. Examiner, currently $statusText',
      child: AnimatedContainer(
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
            // Animated avatar
            Expanded(
              flex: 6,
              child: AspectRatio(
                aspectRatio: 1.0,
                child: AnimatedAvatar(avatarState: avatarSt),
              ),
            ),
            const SizedBox(height: 8),
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
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF00C853),
                    ),
                  ),
                  const SizedBox(width: 4),
                ],
                Text(
                  statusText,
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
      ),
    );
  }
}
