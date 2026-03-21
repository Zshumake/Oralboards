import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/exam_settings_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/tts_provider.dart';
import '../theme/app_theme.dart';

class SettingsDialog extends ConsumerStatefulWidget {
  const SettingsDialog({super.key});

  @override
  ConsumerState<SettingsDialog> createState() => _SettingsDialogState();
}

class _SettingsDialogState extends ConsumerState<SettingsDialog> {
  late TextEditingController _keyController;

  @override
  void initState() {
    super.initState();
    final currentKey = ref.read(apiKeyProvider).valueOrNull ?? '';
    _keyController = TextEditingController(text: currentKey);
  }

  @override
  void dispose() {
    _keyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Settings',
            style: GoogleFonts.playfairDisplay(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: AppColors.navy,
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => Navigator.pop(context),
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Icon(Icons.close, size: 18, color: AppColors.textMuted),
              ),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 420,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 1, color: AppColors.divider),
            const SizedBox(height: 20),
            Text(
              'Gemini API Key',
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.navy,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _keyController,
              obscureText: true,
              style: GoogleFonts.dmSans(fontSize: 14, color: AppColors.text),
              decoration: InputDecoration(
                hintText: 'AIzaSy...',
                hintStyle: GoogleFonts.dmSans(
                  color: AppColors.textLight,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Required for AI Feedback. Your key is stored locally on your device.',
              style: GoogleFonts.sourceSerif4(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: AppColors.textMuted,
              ),
            ),
            const SizedBox(height: 8),
            GestureDetector(
              onTap: () => launchUrl(
                  Uri.parse('https://aistudio.google.com/app/apikey')),
              child: Text(
                'Get a free API key here \u2192',
                style: GoogleFonts.dmSans(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.burgundy,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.burgundy.withValues(alpha: 0.4),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(height: 1, color: AppColors.divider),
            const SizedBox(height: 16),
            _TtsToggle(),
            const SizedBox(height: 16),
            Container(height: 1, color: AppColors.divider),
            const SizedBox(height: 16),
            _TimedExamToggle(),
            const SizedBox(height: 16),
            Container(height: 1, color: AppColors.divider),
            const SizedBox(height: 16),
            _HighContrastToggle(),
          ],
        ),
      ),
      actionsPadding: const EdgeInsets.fromLTRB(24, 8, 24, 20),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'Cancel',
            style: GoogleFonts.dmSans(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            ref.read(apiKeyProvider.notifier).save(_keyController.text);
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.navy,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          ),
          child: Text(
            'Save',
            style: GoogleFonts.dmSans(
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}

class _TtsToggle extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTtsEnabled = ref.watch(isTtsEnabledProvider).valueOrNull ?? true;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.volume_up_outlined, size: 18, color: AppColors.navy),
            const SizedBox(width: 10),
            Text(
              'Examiner Voice (TTS)',
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.navy,
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () => ref.read(isTtsEnabledProvider.notifier).toggle(),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color:
                  isTtsEnabled ? AppColors.success : AppColors.surfaceAlt,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              isTtsEnabled ? 'ON' : 'OFF',
              style: GoogleFonts.dmSans(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
                color: isTtsEnabled ? Colors.white : AppColors.textMuted,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TimedExamToggle extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings =
        ref.watch(examSettingsProvider).valueOrNull ?? const ExamSettings();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.timer_outlined, size: 18, color: AppColors.navy),
                const SizedBox(width: 10),
                Text(
                  'Timed Exam',
                  style: GoogleFonts.dmSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.navy,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () => ref
                  .read(examSettingsProvider.notifier)
                  .setTimedMode(!settings.isTimedMode),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color: settings.isTimedMode
                      ? AppColors.success
                      : AppColors.surfaceAlt,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  settings.isTimedMode ? 'ON' : 'OFF',
                  style: GoogleFonts.dmSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: settings.isTimedMode
                        ? Colors.white
                        : AppColors.textMuted,
                  ),
                ),
              ),
            ),
          ],
        ),
        if (settings.isTimedMode) ...[
          const SizedBox(height: 12),
          Row(
            children: [
              const SizedBox(width: 28),
              Text(
                'Duration:',
                style: GoogleFonts.dmSans(
                  fontSize: 13,
                  color: AppColors.textMuted,
                ),
              ),
              const SizedBox(width: 12),
              ...([15, 20, 25, 30]).map((min) {
                final isSelected = settings.examDurationMinutes == min;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: GestureDetector(
                    onTap: () => ref
                        .read(examSettingsProvider.notifier)
                        .setDuration(min),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 150),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 5),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.navy
                            : AppColors.surfaceAlt,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${min}m',
                        style: GoogleFonts.dmSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color:
                              isSelected ? Colors.white : AppColors.textMuted,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ],
    );
  }
}

class _HighContrastToggle extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isHC = ref.watch(highContrastProvider).valueOrNull ?? false;

    return Semantics(
      toggled: isHC,
      label: 'High contrast mode',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.contrast, size: 18, color: AppColors.navy),
              const SizedBox(width: 10),
              Text(
                'High Contrast',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.navy,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => ref.read(highContrastProvider.notifier).toggle(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: isHC ? AppColors.success : AppColors.surfaceAlt,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                isHC ? 'ON' : 'OFF',
                style: GoogleFonts.dmSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  color: isHC ? Colors.white : AppColors.textMuted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showSettingsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (_) => const SettingsDialog(),
  );
}
