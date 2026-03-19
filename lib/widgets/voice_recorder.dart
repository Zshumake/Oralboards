import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../theme/app_theme.dart';

class VoiceRecorder extends StatefulWidget {
  final ValueChanged<String> onTranscriptChange;
  final bool isEnabled;
  final VoidCallback? onMissingKeyClick;

  const VoiceRecorder({
    super.key,
    required this.onTranscriptChange,
    this.isEnabled = true,
    this.onMissingKeyClick,
  });

  @override
  State<VoiceRecorder> createState() => _VoiceRecorderState();
}

class _VoiceRecorderState extends State<VoiceRecorder>
    with SingleTickerProviderStateMixin {
  final _controller = TextEditingController();
  final _speech = stt.SpeechToText();
  bool _isSupported = false;
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
      _isSupported = await _speech.initialize(
        onError: (error) {
          setState(() => _isRecording = false);
          _pulseController.stop();
        },
        onStatus: (status) {
          if (status == 'done' || status == 'notListening') {
            setState(() => _isRecording = false);
            _pulseController.stop();
          }
        },
      );
    } catch (_) {
      _isSupported = false;
    }
    if (mounted) setState(() {});
  }

  void _toggleRecording() {
    if (_isRecording) {
      _speech.stop();
      _pulseController.stop();
      setState(() => _isRecording = false);
    } else {
      _controller.clear();
      widget.onTranscriptChange('');
      _speech.listen(
        onResult: (result) {
          final text = result.recognizedWords;
          _controller.text = text;
          _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: text.length),
          );
          widget.onTranscriptChange(text);
        },
        listenOptions: stt.SpeechListenOptions(
          listenMode: stt.ListenMode.dictation,
        ),
      );
      _pulseController.repeat(reverse: true);
      setState(() => _isRecording = true);
    }
  }

  void _clear() {
    _controller.clear();
    widget.onTranscriptChange('');
  }

  @override
  void dispose() {
    _speech.stop();
    _controller.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isSupported) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            Text(
              'Speech recognition not available on this device.',
              style: GoogleFonts.dmSans(
                color: AppColors.danger,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 12),
            _buildTextArea(),
          ],
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (_isRecording)
                    AnimatedBuilder(
                      animation: _pulseController,
                      builder: (context, child) {
                        return Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.danger.withValues(
                              alpha: 0.5 + (_pulseController.value * 0.5),
                            ),
                          ),
                        );
                      },
                    ),
                  Text(
                    _isRecording ? 'Listening...' : 'Reflect & Record',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: _isRecording ? AppColors.danger : AppColors.navy,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  if (!widget.isEnabled)
                    GestureDetector(
                      onTap: widget.onMissingKeyClick,
                      child: Text(
                        'Missing API Key',
                        style: GoogleFonts.dmSans(
                          color: AppColors.warning,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  const SizedBox(width: 8),
                  // Record button
                  Material(
                    color: _isRecording ? AppColors.danger : AppColors.navy,
                    borderRadius: BorderRadius.circular(6),
                    child: InkWell(
                      onTap: widget.isEnabled ? _toggleRecording : null,
                      borderRadius: BorderRadius.circular(6),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              _isRecording ? Icons.stop : Icons.mic,
                              size: 14,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _isRecording ? 'Stop' : 'Record',
                              style: GoogleFonts.dmSans(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  // Clear button
                  Tooltip(
                    message: 'Clear',
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: widget.isEnabled ? _clear : null,
                        borderRadius: BorderRadius.circular(4),
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Icon(
                            Icons.refresh,
                            size: 16,
                            color: widget.isEnabled
                                ? AppColors.textMuted
                                : AppColors.textLight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTextArea(),
        ],
      ),
    );
  }

  Widget _buildTextArea() {
    return TextField(
      controller: _controller,
      enabled: widget.isEnabled,
      maxLines: 5,
      minLines: 3,
      onChanged: widget.onTranscriptChange,
      style: GoogleFonts.sourceSerif4(
        color: AppColors.text,
        fontSize: 14,
        height: 1.6,
      ),
      decoration: InputDecoration(
        hintText: widget.isEnabled
            ? 'Your answer will appear here... (or type directly)'
            : 'Add your Gemini API Key in settings to enable recording.',
        hintStyle: GoogleFonts.sourceSerif4(
          color: AppColors.textLight,
          fontSize: 14,
          fontStyle: FontStyle.italic,
        ),
        filled: true,
        fillColor: AppColors.surfaceAlt.withValues(alpha: 0.5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: AppColors.navy, width: 1.5),
        ),
      ),
    );
  }
}
