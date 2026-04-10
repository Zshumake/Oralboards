import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/examiner_persona.dart';
import '../providers/exam_settings_provider.dart';
import '../providers/persona_provider.dart';
import '../providers/settings_provider.dart';
import '../providers/theme_provider.dart';
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
            const _PersonaSelector(),
            const SizedBox(height: 16),
            Container(height: 1, color: AppColors.divider),
            const SizedBox(height: 16),
            _TimedExamToggle(),
            const SizedBox(height: 16),
            Container(height: 1, color: AppColors.divider),
            const SizedBox(height: 16),
            _HighContrastToggle(),
            const SizedBox(height: 16),
            Container(height: 1, color: AppColors.divider),
            const SizedBox(height: 16),
            _DarkModeToggle(),
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

class _PersonaSelector extends ConsumerWidget {
  const _PersonaSelector();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedPersona = ref.watch(selectedPersonaProvider).valueOrNull ??
        ExaminerPersona.chen;
    final randomize = ref.watch(randomizePersonaProvider).valueOrNull ?? false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.person_outline, size: 18, color: AppColors.navy),
            const SizedBox(width: 10),
            Text(
              'Examiner Persona',
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: AppColors.navy,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 80,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: ExaminerPersona.all.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final persona = ExaminerPersona.all[index];
              final isSelected = persona.id == selectedPersona.id;
              return GestureDetector(
                onTap: () =>
                    ref.read(selectedPersonaProvider.notifier).select(persona),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  width: 110,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? AppColors.navy.withValues(alpha: 0.08)
                        : AppColors.surfaceAlt,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: isSelected ? AppColors.navy : Colors.transparent,
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: persona.iconColor,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          persona.initials,
                          style: GoogleFonts.dmSans(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        persona.name,
                        style: GoogleFonts.dmSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: AppColors.text,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        persona.description,
                        style: GoogleFonts.dmSans(
                          fontSize: 9,
                          color: AppColors.textMuted,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.shuffle, size: 16, color: AppColors.textMuted),
                const SizedBox(width: 8),
                Text(
                  'Randomize on exam start',
                  style: GoogleFonts.dmSans(
                    fontSize: 13,
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () =>
                  ref.read(randomizePersonaProvider.notifier).toggle(),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                decoration: BoxDecoration(
                  color:
                      randomize ? AppColors.success : AppColors.surfaceAlt,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  randomize ? 'ON' : 'OFF',
                  style: GoogleFonts.dmSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                    color: randomize ? Colors.white : AppColors.textMuted,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _DarkModeToggle extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = ref.watch(isDarkModeProvider).valueOrNull ?? false;

    return Semantics(
      toggled: isDark,
      label: 'Dark mode',
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                isDark ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
                size: 18,
                color: AppColors.navy,
              ),
              const SizedBox(width: 10),
              Text(
                'Dark Mode',
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: AppColors.navy,
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () => ref.read(isDarkModeProvider.notifier).toggle(),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: isDark ? AppColors.success : AppColors.surfaceAlt,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                isDark ? 'ON' : 'OFF',
                style: GoogleFonts.dmSans(
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                  color: isDark ? Colors.white : AppColors.textMuted,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<void> showSettingsDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) => const SettingsDialog(),
  );
}
