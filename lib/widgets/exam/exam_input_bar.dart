import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../../providers/exam_session_provider.dart';
import '../../theme/app_theme.dart';

class ExamInputBar extends ConsumerStatefulWidget {
  const ExamInputBar({super.key});

  @override
  ConsumerState<ExamInputBar> createState() => _ExamInputBarState();
}

class _ExamInputBarState extends ConsumerState<ExamInputBar>
    with SingleTickerProviderStateMixin {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  final _speech = stt.SpeechToText();
  bool _speechAvailable = false;
  bool _isRecording = false;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _initSpeech();
  }

  Future<void> _initSpeech() async {
    try {
      _speechAvailable = await _speech.initialize(
        onError: (_) {
          setState(() => _isRecording = false);
          _pulseController.stop();
          ref.read(examSessionProvider.notifier).setListening(false);
        },
        onStatus: (status) {
          if (status == 'done' || status == 'notListening') {
            setState(() => _isRecording = false);
            _pulseController.stop();
            ref.read(examSessionProvider.notifier).setListening(false);
          }
        },
      );
    } catch (_) {
      _speechAvailable = false;
    }
    if (mounted) setState(() {});
  }

  void _toggleRecording() {
    if (_isRecording) {
      _speech.stop();
      _pulseController.stop();
      setState(() => _isRecording = false);
      ref.read(examSessionProvider.notifier).setListening(false);
    } else {
      _speech.listen(
        onResult: (result) {
          _controller.text = result.recognizedWords;
          _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: result.recognizedWords.length),
          );
          ref
              .read(examSessionProvider.notifier)
              .updateInput(result.recognizedWords);
        },
        listenOptions: stt.SpeechListenOptions(
          listenMode: stt.ListenMode.dictation,
        ),
      );
      _pulseController.repeat(reverse: true);
      setState(() => _isRecording = true);
      ref.read(examSessionProvider.notifier).setListening(true);
    }
  }

  void _submit() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    if (_isRecording) {
      _speech.stop();
      _pulseController.stop();
      setState(() => _isRecording = false);
      ref.read(examSessionProvider.notifier).setListening(false);
    }
    ref.read(examSessionProvider.notifier).submitResponse(text);
    _controller.clear();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _speech.stop();
    _controller.dispose();
    _focusNode.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final examState = ref.watch(examSessionProvider);
    final isDisabled = examState.isWaitingForAi || examState.isTtsSpeaking;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border(
          top: BorderSide(color: AppColors.border),
        ),
      ),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Mic button
            if (_speechAvailable)
              Padding(
                padding: const EdgeInsets.only(right: 8, bottom: 2),
                child: AnimatedBuilder(
                  animation: _pulseController,
                  builder: (context, child) {
                    return Material(
                      color: _isRecording
                          ? AppColors.danger
                              .withValues(alpha: 0.8 + _pulseController.value * 0.2)
                          : AppColors.surfaceAlt,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        onTap: isDisabled ? null : _toggleRecording,
                        borderRadius: BorderRadius.circular(20),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Icon(
                            _isRecording ? Icons.stop : Icons.mic,
                            size: 20,
                            color: _isRecording
                                ? Colors.white
                                : (isDisabled
                                    ? AppColors.textLight
                                    : AppColors.navy),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

            // Text field
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.surfaceAlt.withValues(alpha: 0.5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.border),
                ),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  enabled: !isDisabled,
                  maxLines: 4,
                  minLines: 1,
                  textInputAction: TextInputAction.send,
                  onSubmitted: (_) => _submit(),
                  onChanged: (value) =>
                      ref.read(examSessionProvider.notifier).updateInput(value),
                  style: GoogleFonts.sourceSerif4(
                    fontSize: 14,
                    color: AppColors.text,
                  ),
                  decoration: InputDecoration(
                    hintText: isDisabled
                        ? 'Examiner is responding...'
                        : 'Type your response...',
                    hintStyle: GoogleFonts.sourceSerif4(
                      color: AppColors.textLight,
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
            ),

            // Send button
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 2),
              child: Material(
                color: isDisabled ? AppColors.surfaceAlt : AppColors.navy,
                borderRadius: BorderRadius.circular(20),
                child: InkWell(
                  onTap: isDisabled ? null : _submit,
                  borderRadius: BorderRadius.circular(20),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.send,
                      size: 20,
                      color: isDisabled ? AppColors.textLight : Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
