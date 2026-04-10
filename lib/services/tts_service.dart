import 'package:flutter_tts/flutter_tts.dart';
import '../models/examiner_persona.dart';

class TtsService {
  final FlutterTts _tts = FlutterTts();
  bool _isInitialized = false;
  bool _isSpeaking = false;
  void Function()? onComplete;

  bool get isSpeaking => _isSpeaking;

  Future<void> init() async {
    if (_isInitialized) return;
    await _tts.setLanguage('en-US');
    await _tts.setPitch(0.85); // Lower, more authoritative
    await _tts.setSpeechRate(0.45); // Measured, deliberate pace
    await _tts.setVolume(1.0);

    _tts.setCompletionHandler(() {
      _isSpeaking = false;
      onComplete?.call();
    });

    _tts.setCancelHandler(() {
      _isSpeaking = false;
    });

    _tts.setErrorHandler((msg) {
      _isSpeaking = false;
    });

    _isInitialized = true;
  }

  /// Apply pitch and rate from an examiner persona.
  Future<void> applyPersona(ExaminerPersona persona) async {
    if (!_isInitialized) await init();
    await _tts.setPitch(persona.pitch);
    await _tts.setSpeechRate(persona.rate);
  }

  Future<void> speak(String text) async {
    if (!_isInitialized) await init();
    _isSpeaking = true;
    await _tts.speak(text);
  }

  Future<void> stop() async {
    _isSpeaking = false;
    await _tts.stop();
  }

  void dispose() {
    _tts.stop();
    _isSpeaking = false;
  }
}
