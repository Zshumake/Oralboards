import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/study_section.dart';
import '../providers/ai_provider.dart' as ai;
import '../providers/settings_provider.dart';
import '../providers/study_session_provider.dart';
import '../theme/app_theme.dart';
import 'content_renderer.dart';
import 'feedback_card.dart';
import 'settings_dialog.dart';
import 'voice_recorder.dart';

class SectionAccordion extends ConsumerWidget {
  final StudySection section;

  const SectionAccordion({super.key, required this.section});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionState = ref.watch(studySessionProvider);
    final isExpanded = sessionState.expandedSections.contains(section.id);
    final isRevealed = sessionState.revealedAnswers.contains(section.id);
    final isAiEnabled = ref.watch(isAiEnabledProvider).valueOrNull ?? true;
    final hasApiKey =
        (ref.watch(apiKeyProvider).valueOrNull ?? '').isNotEmpty;
    final feedbacks = ref.watch(ai.feedbacksProvider);
    final generating = ref.watch(ai.generatingFeedbackForProvider);
    final feedback = feedbacks[section.id];
    final isGenerating = generating.contains(section.id);
    final transcript = sessionState.transcripts[section.id] ?? '';

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isExpanded ? 0.06 : 0.03),
            blurRadius: isExpanded ? 12 : 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // Header
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => ref
                  .read(studySessionProvider.notifier)
                  .toggleSection(section.id),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 16),
                child: Row(
                  children: [
                    AnimatedRotation(
                      turns: isExpanded ? 0.25 : 0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeOutCubic,
                      child: Icon(
                        Icons.chevron_right,
                        size: 20,
                        color: isExpanded
                            ? AppColors.navy
                            : AppColors.textMuted,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        section.title,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isExpanded
                              ? AppColors.navy
                              : AppColors.text,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Content
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOutCubic,
            alignment: Alignment.topCenter,
            child: isExpanded
                ? Container(
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 1,
                          color: AppColors.border,
                        ),
                        const SizedBox(height: 20),

                        // Prompt (for challenge questions)
                        if (section.prompt != null) ...[
                          ContentRenderer(content: section.prompt!),
                          const SizedBox(height: 20),
                        ],

                        if (section.hasRecorder) ...[
                          // Voice recorder area
                          if (isAiEnabled) ...[
                            Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: AppColors.surfaceAlt,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.edit_note,
                                        size: 18,
                                        color: AppColors.navy
                                            .withValues(alpha: 0.6),
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        section.prompt != null
                                            ? 'Your Response'
                                            : 'Formulate Your Answer',
                                        style: GoogleFonts.dmSans(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 13,
                                          letterSpacing: 0.5,
                                          color: AppColors.navy,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Record or type your response before revealing the model answer.',
                                    style: GoogleFonts.sourceSerif4(
                                      fontSize: 13,
                                      fontStyle: FontStyle.italic,
                                      color: AppColors.textMuted,
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  VoiceRecorder(
                                    onTranscriptChange: (text) => ref
                                        .read(studySessionProvider.notifier)
                                        .updateTranscript(
                                            section.id, text),
                                    isEnabled: hasApiKey,
                                    onMissingKeyClick: () =>
                                        showSettingsDialog(context),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                          ],

                          // Model answer section
                          Row(
                            children: [
                              Container(
                                height: 2,
                                width: 20,
                                color: AppColors.burgundy,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Model Answer',
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                  letterSpacing: 0.5,
                                  color: AppColors.burgundy,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Blurred / revealed answer
                          GestureDetector(
                            onTap: isRevealed
                                ? null
                                : () => ref
                                    .read(studySessionProvider.notifier)
                                    .toggleReveal(section.id),
                            child: AnimatedCrossFade(
                              duration: const Duration(milliseconds: 400),
                              crossFadeState: isRevealed
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild: ClipRect(
                                child: Stack(
                                  children: [
                                    ImageFiltered(
                                      imageFilter: ImageFilter.blur(
                                          sigmaX: 8, sigmaY: 8),
                                      child: ContentRenderer(
                                          content: section.answer),
                                    ),
                                    Positioned.fill(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColors.surfaceAlt
                                              .withValues(alpha: 0.3),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Center(
                                          child: Container(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 20,
                                                vertical: 10),
                                            decoration: BoxDecoration(
                                              color: AppColors.surface,
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withValues(
                                                          alpha: 0.08),
                                                  blurRadius: 12,
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisSize:
                                                  MainAxisSize.min,
                                              children: [
                                                const Icon(
                                                  Icons.visibility_outlined,
                                                  size: 18,
                                                  color: AppColors.navy,
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  'Reveal Answer',
                                                  style: GoogleFonts.dmSans(
                                                    fontWeight:
                                                        FontWeight.w600,
                                                    fontSize: 13,
                                                    color: AppColors.navy,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              secondChild: ContentRenderer(
                                  content: section.answer),
                            ),
                          ),

                          // AI feedback controls
                          if (isRevealed && isAiEnabled) ...[
                            const SizedBox(height: 20),
                            ElevatedButton.icon(
                              onPressed: isGenerating
                                  ? null
                                  : () => ai.getFeedback(
                                        ref,
                                        section.id,
                                        transcript,
                                        section.answer,
                                      ),
                              icon: Icon(
                                Icons.auto_awesome,
                                size: 16,
                                color: isGenerating
                                    ? AppColors.textMuted
                                    : Colors.white,
                              ),
                              label: Text(
                                isGenerating
                                    ? 'Analyzing...'
                                    : 'Get AI Feedback',
                                style: GoogleFonts.dmSans(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.navy,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(6),
                                ),
                              ),
                            ),
                            if (feedback != null) ...[
                              const SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color: AppColors.surfaceAlt,
                                  borderRadius:
                                      BorderRadius.circular(8),
                                  border: Border.all(
                                    color: AppColors.navy
                                        .withValues(alpha: 0.15),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.auto_awesome,
                                          size: 16,
                                          color: AppColors.navy
                                              .withValues(alpha: 0.6),
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          'AI Feedback Analysis',
                                          style: GoogleFonts.dmSans(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 13,
                                            letterSpacing: 0.5,
                                            color: AppColors.navy,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 16),
                                    FeedbackCard(feedback: feedback),
                                  ],
                                ),
                              ),
                            ],
                          ],

                          // Hide / Continue buttons
                          if (isRevealed) ...[
                            const SizedBox(height: 24),
                            Container(
                              height: 1,
                              color: AppColors.border,
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    ref
                                        .read(studySessionProvider
                                            .notifier)
                                        .hideAnswer(section.id);
                                    ai.clearFeedback(ref, section.id);
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: AppColors.textMuted,
                                  ),
                                  child: Text(
                                    'Hide Answer',
                                    style: GoogleFonts.dmSans(
                                        fontSize: 13),
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () => ref
                                      .read(
                                          studySessionProvider.notifier)
                                      .nextSection(section.id),
                                  icon: const Icon(Icons.arrow_forward,
                                      size: 14),
                                  label: Text(
                                    'Continue',
                                    style: GoogleFonts.dmSans(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 13,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.burgundy,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(6),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ] else ...[
                          // Non-recorder section: just show content
                          ContentRenderer(content: section.answer),
                        ],
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
