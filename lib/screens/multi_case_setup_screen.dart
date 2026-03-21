import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/cases/all_cases.dart';
import '../models/case_model.dart';
import '../providers/exam_settings_provider.dart';
import '../providers/multi_case_provider.dart';
import '../theme/app_theme.dart';
import 'exam_screen.dart';

class MultiCaseSetupScreen extends ConsumerStatefulWidget {
  const MultiCaseSetupScreen({super.key});

  @override
  ConsumerState<MultiCaseSetupScreen> createState() =>
      _MultiCaseSetupScreenState();
}

class _MultiCaseSetupScreenState extends ConsumerState<MultiCaseSetupScreen> {
  final Set<String> _selectedCaseIds = {};
  int _presetCount = 3;

  void _startWithRandom(int count) {
    final shuffled = List<CaseModel>.from(allCases)..shuffle(Random());
    final selected = shuffled.take(count).toList();
    _startSession(selected);
  }

  void _startWithSelected() {
    final selected = allCases
        .where((c) => _selectedCaseIds.contains(c.id))
        .toList();
    if (selected.isEmpty) return;
    _startSession(selected);
  }

  void _startSession(List<CaseModel> cases) {
    ref.read(multiCaseProvider.notifier).startSession(cases);
    final firstCase = cases.first;

    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => ExamScreen(caseData: firstCase),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final settings =
        ref.watch(examSettingsProvider).valueOrNull ?? const ExamSettings();
    final estimatedMinutes = settings.isTimedMode
        ? settings.examDurationMinutes * _presetCount
        : _presetCount * 20; // rough estimate

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: ListView(
              padding: const EdgeInsets.all(32),
              children: [
                // Header
                IconButton(
                  icon: const Icon(Icons.arrow_back, size: 20),
                  onPressed: () => Navigator.pop(context),
                  color: AppColors.navy,
                  alignment: Alignment.centerLeft,
                ),
                const SizedBox(height: 8),
                Container(height: 2, width: 60, color: AppColors.navy),
                const SizedBox(height: 20),
                Text(
                  'Full Exam Session',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: AppColors.navy,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Simulate the real oral boards with multiple consecutive cases.',
                  style: GoogleFonts.sourceSerif4(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 24),
                Container(height: 1, color: AppColors.divider),
                const SizedBox(height: 24),

                // Quick start options
                Text(
                  'Quick Start',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.navy,
                  ),
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    _QuickStartCard(
                      count: 3,
                      isSelected: _presetCount == 3,
                      onTap: () => setState(() => _presetCount = 3),
                    ),
                    const SizedBox(width: 12),
                    _QuickStartCard(
                      count: 5,
                      isSelected: _presetCount == 5,
                      onTap: () => setState(() => _presetCount = 5),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    Text(
                      'Est. ${estimatedMinutes}min',
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        color: AppColors.textMuted,
                      ),
                    ),
                    if (settings.isTimedMode) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: AppColors.success.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Text(
                          'TIMED',
                          style: GoogleFonts.dmSans(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: AppColors.success,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                const SizedBox(height: 16),

                ElevatedButton.icon(
                  onPressed: () => _startWithRandom(_presetCount),
                  icon: const Icon(Icons.shuffle, size: 16),
                  label: Text(
                    'Start with $_presetCount Random Cases',
                    style: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.burgundy,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    minimumSize: const Size(double.infinity, 0),
                  ),
                ),

                const SizedBox(height: 32),
                Container(height: 1, color: AppColors.divider),
                const SizedBox(height: 24),

                // Manual selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Or Select Cases',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppColors.navy,
                      ),
                    ),
                    if (_selectedCaseIds.isNotEmpty)
                      Text(
                        '${_selectedCaseIds.length} selected',
                        style: GoogleFonts.dmSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: AppColors.burgundy,
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 16),

                ...allCases.map((c) {
                  final isSelected = _selectedCaseIds.contains(c.id);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          _selectedCaseIds.remove(c.id);
                        } else {
                          _selectedCaseIds.add(c.id);
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.navy.withValues(alpha: 0.05)
                            : AppColors.surface,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.navy.withValues(alpha: 0.3)
                              : AppColors.border,
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? AppColors.navy
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.navy
                                    : AppColors.border,
                              ),
                            ),
                            child: isSelected
                                ? const Icon(Icons.check,
                                    size: 14, color: Colors.white)
                                : null,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              c.title,
                              style: GoogleFonts.dmSans(
                                fontSize: 14,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: isSelected
                                    ? AppColors.navy
                                    : AppColors.text,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),

                if (_selectedCaseIds.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _startWithSelected,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.navy,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      minimumSize: const Size(double.infinity, 0),
                    ),
                    child: Text(
                      'Start with ${_selectedCaseIds.length} Selected Cases',
                      style: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _QuickStartCard extends StatelessWidget {
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const _QuickStartCard({
    required this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: isSelected
                ? AppColors.navy.withValues(alpha: 0.05)
                : AppColors.surface,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isSelected
                  ? AppColors.navy
                  : AppColors.border,
              width: isSelected ? 2 : 1,
            ),
          ),
          child: Column(
            children: [
              Text(
                '$count',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: AppColors.navy,
                ),
              ),
              Text(
                'Cases',
                style: GoogleFonts.dmSans(
                  fontSize: 13,
                  color: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
