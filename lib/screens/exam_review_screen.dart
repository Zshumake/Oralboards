import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/cases/all_cases.dart';
import '../models/exam_result.dart';
import '../models/exam_transcript.dart';
import '../services/database_service.dart';
import '../theme/app_theme.dart';

class ExamReviewScreen extends ConsumerStatefulWidget {
  final ExamResult result;

  const ExamReviewScreen({super.key, required this.result});

  @override
  ConsumerState<ExamReviewScreen> createState() => _ExamReviewScreenState();
}

class _ExamReviewScreenState extends ConsumerState<ExamReviewScreen> {
  Map<String, ExamTranscript> _transcripts = {};
  bool _isLoading = true;
  int _expandedIndex = -1;

  @override
  void initState() {
    super.initState();
    _loadTranscripts();
  }

  Future<void> _loadTranscripts() async {
    if (widget.result.id != null) {
      final transcripts =
          await DatabaseService.getTranscriptsForResult(widget.result.id!);
      setState(() {
        _transcripts = {for (final t in transcripts) t.sectionId: t};
        _isLoading = false;
      });
    } else {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final r = widget.result;
    final scorePercent = (r.overallScore * 100).round();
    final scoreColor = scorePercent >= 70
        ? AppColors.success
        : (scorePercent >= 50 ? AppColors.warning : AppColors.danger);

    // Find the original case for model answers
    final caseData = allCases.where((c) => c.id == r.caseId).firstOrNull;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: ListView(
              padding: const EdgeInsets.all(32),
              children: [
                // Header
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, size: 20),
                      onPressed: () => Navigator.pop(context),
                      color: AppColors.navy,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Exam Review',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppColors.navy,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            r.caseTitle,
                            style: GoogleFonts.sourceSerif4(
                              fontSize: 14,
                              fontStyle: FontStyle.italic,
                              color: AppColors.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: scoreColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        '$scorePercent%',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: scoreColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(height: 1, color: AppColors.divider),
                const SizedBox(height: 24),

                if (_isLoading)
                  const Center(
                      child:
                          CircularProgressIndicator(color: AppColors.navy))
                else
                  ...r.sectionScores.asMap().entries.map((entry) {
                    final i = entry.key;
                    final section = entry.value;
                    final isExpanded = _expandedIndex == i;
                    return _ReviewSectionCard(
                      section: section,
                      transcript: _transcripts[section.sectionId],
                      caseData: caseData,
                      isExpanded: isExpanded,
                      onToggle: () {
                        setState(() {
                          _expandedIndex = isExpanded ? -1 : i;
                        });
                      },
                    );
                  }),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ReviewSectionCard extends StatelessWidget {
  final SectionScoreRecord section;
  final ExamTranscript? transcript;
  final dynamic caseData;
  final bool isExpanded;
  final VoidCallback onToggle;

  const _ReviewSectionCard({
    required this.section,
    this.transcript,
    this.caseData,
    required this.isExpanded,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final pct = section.percentCovered;
    final pctColor = pct >= 0.7
        ? AppColors.success
        : (pct >= 0.4 ? AppColors.warning : AppColors.danger);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          InkWell(
            onTap: onToggle,
            borderRadius: BorderRadius.circular(8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: pctColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: Text(
                        '${(pct * 100).round()}%',
                        style: GoogleFonts.dmSans(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: pctColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      section.sectionTitle,
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.navy,
                      ),
                    ),
                  ),
                  AnimatedRotation(
                    turns: isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.expand_more,
                        size: 20, color: AppColors.textMuted),
                  ),
                ],
              ),
            ),
          ),

          // Expanded content
          if (isExpanded)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 1, color: AppColors.divider),
                  const SizedBox(height: 16),

                  // Conversation transcript
                  if (transcript != null &&
                      transcript!.messages.isNotEmpty) ...[
                    Text(
                      'Conversation',
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.navy,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...transcript!.messages.map((m) {
                      final isExaminer = m.role == 'examiner';
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: isExaminer
                              ? AppColors.navy.withValues(alpha: 0.05)
                              : AppColors.surfaceAlt,
                          borderRadius: BorderRadius.circular(6),
                          border: isExaminer
                              ? Border(
                                  left: BorderSide(
                                      color: AppColors.navy, width: 3))
                              : null,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isExaminer ? 'Examiner' : 'You',
                              style: GoogleFonts.dmSans(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: isExaminer
                                    ? AppColors.navy
                                    : AppColors.burgundy,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              m.text,
                              style: GoogleFonts.sourceSerif4(
                                fontSize: 13,
                                color: AppColors.text,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 16),
                  ],

                  // Concepts covered
                  if (section.conceptsHitList.isNotEmpty) ...[
                    Text(
                      'Concepts Covered',
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.success,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ...section.conceptsHitList.map((c) => Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Row(
                            children: [
                              const Icon(Icons.check_circle,
                                  size: 14, color: AppColors.success),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  c,
                                  style: GoogleFonts.sourceSerif4(
                                    fontSize: 13,
                                    color: AppColors.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 12),
                  ],

                  // Concepts missed
                  if (section.conceptsMissedList.isNotEmpty) ...[
                    Text(
                      'Concepts Missed',
                      style: GoogleFonts.dmSans(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: AppColors.danger,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ...section.conceptsMissedList.map((c) => Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: Row(
                            children: [
                              const Icon(Icons.cancel,
                                  size: 14, color: AppColors.danger),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  c,
                                  style: GoogleFonts.sourceSerif4(
                                    fontSize: 13,
                                    color: AppColors.text,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(height: 12),
                  ],

                  // Red flags
                  if (section.redFlagsList.isNotEmpty) ...[
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppColors.danger.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                            color: AppColors.danger.withValues(alpha: 0.2)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.warning_amber,
                                  size: 14, color: AppColors.danger),
                              const SizedBox(width: 6),
                              Text(
                                'Safety Concerns',
                                style: GoogleFonts.dmSans(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.danger,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          ...section.redFlagsList.map((f) => Text(
                                '  $f',
                                style: GoogleFonts.sourceSerif4(
                                  fontSize: 13,
                                  color: AppColors.danger,
                                ),
                              )),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
        ],
      ),
    );
  }
}
