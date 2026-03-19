import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/case_model.dart';
import '../providers/ai_provider.dart' as ai;
import '../providers/study_session_provider.dart';
import '../providers/timer_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/content_renderer.dart';
import '../widgets/section_accordion.dart';
import '../widgets/settings_dialog.dart';
import '../widgets/study_header.dart';

class StudySessionScreen extends ConsumerStatefulWidget {
  final CaseModel caseData;

  const StudySessionScreen({super.key, required this.caseData});

  @override
  ConsumerState<StudySessionScreen> createState() =>
      _StudySessionScreenState();
}

class _StudySessionScreenState extends ConsumerState<StudySessionScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(studySessionProvider.notifier).loadCase(widget.caseData);
      ref.read(timerProvider.notifier).reset();
      ai.resetAiState(ref);
      _fadeController.forward();
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sessionState = ref.watch(studySessionProvider);

    final presentationSections = widget.caseData.sections.where((s) {
      final lower = s.title.toLowerCase();
      return lower.contains('chief complaint') ||
          lower.contains('presentation');
    }).toList();

    return Scaffold(
      body: SafeArea(
        child: FadeTransition(
          opacity: CurvedAnimation(
            parent: _fadeController,
            curve: Curves.easeOut,
          ),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1280),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
                child: CustomScrollView(
                  slivers: [
                    // Sticky header
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: _StudyHeaderDelegate(
                        onBack: () => Navigator.pop(context),
                        onOpenSettings: () => showSettingsDialog(context),
                      ),
                    ),

                    SliverToBoxAdapter(
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 780),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 32),
                              // Case title — editorial style
                              Text(
                                widget.caseData.title,
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.navy,
                                  height: 1.2,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Oral Board Case Study',
                                style: GoogleFonts.sourceSerif4(
                                  fontSize: 15,
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.burgundy,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                height: 2,
                                width: 60,
                                color: AppColors.burgundy,
                              ),
                              const SizedBox(height: 28),

                              // Patient presentation card(s)
                              for (final section in presentationSections)
                                Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 24),
                                  decoration: BoxDecoration(
                                    color: AppColors.surface,
                                    borderRadius: BorderRadius.circular(8),
                                    border: const Border(
                                      left: BorderSide(
                                          color: AppColors.burgundy, width: 3),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.04),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(24),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person_outline,
                                              size: 18,
                                              color: AppColors.burgundy
                                                  .withValues(alpha: 0.7),
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              'Patient Presentation',
                                              style: GoogleFonts.dmSans(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 13,
                                                letterSpacing: 1,
                                                color: AppColors.burgundy,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 16),
                                        ContentRenderer(
                                            content: section.content),
                                      ],
                                    ),
                                  ),
                                ),

                              // Section accordions
                              ...sessionState.processedSections
                                  .map((s) => Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 12),
                                        child: SectionAccordion(section: s),
                                      )),

                              const SizedBox(height: 48),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StudyHeaderDelegate extends SliverPersistentHeaderDelegate {
  final VoidCallback onBack;
  final VoidCallback onOpenSettings;

  _StudyHeaderDelegate({
    required this.onBack,
    required this.onOpenSettings,
  });

  @override
  double get minExtent => 58;

  @override
  double get maxExtent => 58;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return StudyHeader(
      onBack: onBack,
      onOpenSettings: onOpenSettings,
    );
  }

  @override
  bool shouldRebuild(covariant _StudyHeaderDelegate oldDelegate) => false;
}
