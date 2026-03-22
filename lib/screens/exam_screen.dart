import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/case_model.dart';
import '../models/exam_models.dart';
import '../models/multi_case_session.dart';
import '../providers/exam_session_provider.dart';
import '../providers/exam_settings_provider.dart';
import '../providers/multi_case_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/timer_provider.dart';
import '../theme/app_theme.dart';
import 'case_break_screen.dart';
import 'session_summary_screen.dart';
import '../widgets/exam/exam_chat_bubble.dart';
import '../widgets/exam/exam_header.dart';
import '../widgets/exam/exam_input_bar.dart';
import '../widgets/exam/exam_score_card.dart';
import '../widgets/exam/exam_thinking_indicator.dart';
import '../widgets/exam/examiner_tile.dart';
import '../widgets/exam/student_tile.dart';
import '../widgets/settings_dialog.dart';

class ExamScreen extends ConsumerStatefulWidget {
  final CaseModel caseData;

  const ExamScreen({super.key, required this.caseData});

  @override
  ConsumerState<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends ConsumerState<ExamScreen>
    with SingleTickerProviderStateMixin {
  final _scrollController = ScrollController();
  late AnimationController _fadeController;
  bool _hasShownTimeUp = false;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(examSessionProvider.notifier).loadCase(widget.caseData);
      ref.read(timerProvider.notifier).reset();
      _fadeController.forward();
      _startExam();
    });
  }

  Future<void> _startExam() async {
    // Check for API key first
    var apiKey = ref.read(apiKeyProvider).valueOrNull ?? '';
    if (apiKey.isEmpty) {
      final action = await showDialog<String>(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          title: Text(
            'API Key Required',
            style: GoogleFonts.playfairDisplay(
              fontWeight: FontWeight.w700,
              color: AppColors.navy,
            ),
          ),
          content: Text(
            'Exam mode requires a Gemini API key for the AI examiner. Please add your key in Settings.',
            style: GoogleFonts.sourceSerif4(color: AppColors.text),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx, 'back'),
              child: Text('Go Back', style: GoogleFonts.dmSans()),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(ctx, 'settings'),
              child: Text('Open Settings', style: GoogleFonts.dmSans()),
            ),
          ],
        ),
      );

      if (action == 'back' || action == null) {
        if (mounted) Navigator.pop(context);
        return;
      }

      // Open settings and wait for it to close
      if (action == 'settings' && mounted) {
        await showSettingsDialog(context);
        // Re-check key after settings dialog closes
        await ref.read(apiKeyProvider.notifier).build();
        apiKey = ref.read(apiKeyProvider).valueOrNull ?? '';
        if (apiKey.isEmpty) {
          if (mounted) Navigator.pop(context);
          return;
        }
      }
    }

    // Start timer — countdown or count-up based on settings
    final examSettings =
        ref.read(examSettingsProvider).valueOrNull ?? const ExamSettings();
    final sectionCount =
        ref.read(examSessionProvider).examSections.length;
    if (examSettings.isTimedMode) {
      ref.read(timerProvider.notifier).startCountdown(
            examSettings.examDurationMinutes * 60,
            sectionCount: sectionCount,
          );
    } else {
      ref.read(timerProvider.notifier).toggle();
    }
    ref.read(examSessionProvider.notifier).startExam();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
        );
      }
    });
  }

  void _endExam() {
    ref.read(timerProvider.notifier).toggle(); // stop timer
    ref.read(examSessionProvider.notifier).endExam();
  }

  void _tryAgain() {
    ref.read(examSessionProvider.notifier).loadCase(widget.caseData);
    ref.read(timerProvider.notifier).reset();
    ref.read(timerProvider.notifier).toggle();
    ref.read(examSessionProvider.notifier).startExam();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final examState = ref.watch(examSessionProvider);
    final timer = ref.watch(timerProvider);

    // Check for countdown expiry
    if (timer.isExpired &&
        !_hasShownTimeUp &&
        examState.phase == ExamPhase.inProgress) {
      _hasShownTimeUp = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showTimeUpDialog();
      });
    }

    // Auto-scroll when messages change
    _scrollToBottom();

    // Show score card when exam is complete
    if (examState.phase == ExamPhase.examComplete) {
      final multiCase = ref.read(multiCaseProvider);
      if (multiCase != null && multiCase.phase == MultiCasePhase.inCase) {
        // Multi-case: notify provider and navigate
        WidgetsBinding.instance.addPostFrameCallback((_) {
          ref.read(multiCaseProvider.notifier).onCaseComplete(examState);
          final updated = ref.read(multiCaseProvider);
          if (updated == null) return;

          if (updated.phase == MultiCasePhase.sessionComplete) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                  builder: (_) => const SessionSummaryScreen()),
            );
          } else {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) =>
                    CaseBreakScreen(completedCaseState: examState),
              ),
            );
          }
        });
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(color: AppColors.navy),
          ),
        );
      }

      // Single case: show score card as before
      return ExamScoreCard(
        examState: examState,
        elapsedTime: timer.display,
        onReturnHome: () {
          Navigator.pop(context);
        },
        onTryAgain: _tryAgain,
      );
    }

    // Collect all messages across all sections for display
    final allMessages = <ConversationMessage>[];
    for (var i = 0; i <= examState.currentSectionIndex; i++) {
      if (i < examState.examSections.length) {
        final sectionId = examState.examSections[i].id;
        final msgs = examState.messagesBySection[sectionId] ?? [];
        allMessages.addAll(msgs);
      }
    }

    return Scaffold(
      body: FadeTransition(
        opacity: CurvedAnimation(
          parent: _fadeController,
          curve: Curves.easeOut,
        ),
        child: Column(
          children: [
            // Header
            ExamHeader(
              onBack: () {
                ref.read(timerProvider.notifier).reset();
                Navigator.pop(context);
              },
              onEndExam: _endExam,
            ),

            // Video tiles
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
              child: SizedBox(
                height: 320, // Taller area for the "zoom call" background
                child: Stack(
                  children: [
                    // Main Speaker
                    const Positioned.fill(
                      child: ExaminerTile(),
                    ),
                    // Picture-in-Picture Student
                    Positioned(
                      top: 16,
                      right: 16,
                      width: 100,
                      height: 130,
                      child: const StudentTile(),
                    ),
                  ],
                ),
              ),
            ),

            // Messages area
            Expanded(
              child: Container(
                color: AppColors.bg,
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 780),
                    child: allMessages.isEmpty && !examState.isWaitingForAi
                        ? _buildWaitingState()
                        : ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                            itemCount: allMessages.length +
                                (examState.isWaitingForAi ? 1 : 0),
                            itemBuilder: (context, index) {
                              if (index == allMessages.length &&
                                  examState.isWaitingForAi) {
                                return const ExamThinkingIndicator();
                              }
                              return ExamChatBubble(
                                  message: allMessages[index]);
                            },
                          ),
                  ),
                ),
              ),
            ),

            // Input bar
            const ExamInputBar(),
          ],
        ),
      ),
    );
  }

  void _showTimeUpDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text(
          "Time's Up",
          style: GoogleFonts.playfairDisplay(
            fontWeight: FontWeight.w700,
            color: AppColors.danger,
          ),
        ),
        content: Text(
          'Your exam time has expired. Your exam will be scored based on what you completed.',
          style: GoogleFonts.sourceSerif4(color: AppColors.text),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              _endExam();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.burgundy,
            ),
            child: Text('View Results', style: GoogleFonts.dmSans()),
          ),
        ],
      ),
    );
  }

  Widget _buildWaitingState() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.medical_services_outlined,
            size: 48,
            color: AppColors.navy.withValues(alpha: 0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'Preparing your examination...',
            style: GoogleFonts.sourceSerif4(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
