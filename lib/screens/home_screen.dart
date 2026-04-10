import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/case_model.dart';
import '../providers/cases_provider.dart';
import '../providers/recommendations_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/due_reviews_card.dart';
import '../widgets/recommendation_card.dart';
import '../widgets/achievements_sheet.dart';
import '../widgets/streak_card.dart';
import '../widgets/study_plan_card.dart';
import '../widgets/case_card.dart';
import '../widgets/xp_bar.dart';
import '../providers/achievement_provider.dart';
import 'case_author_screen.dart';
import 'dashboard_screen.dart';
import 'exam_screen.dart';
import 'history_screen.dart';
import 'multi_case_setup_screen.dart';
import 'study_session_screen.dart';
import '../widgets/settings_dialog.dart';
import '../providers/settings_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with TickerProviderStateMixin {
  final _searchController = TextEditingController();
  late AnimationController _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );
    _fadeController.forward();

    // Check achievements on app load
    Future.microtask(() {
      ref.read(achievementProvider.notifier).checkAchievements();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  Future<void> _openCase(CaseModel caseData) async {
    final isExamMode = ref.read(isExamModeProvider);

    // Gate exam mode behind API key check
    if (isExamMode) {
      final apiKey = ref.read(apiKeyProvider).valueOrNull ?? '';
      if (apiKey.isEmpty) {
        final action = await showDialog<String>(
          context: context,
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
                onPressed: () => Navigator.pop(ctx, 'cancel'),
                child: Text('Cancel', style: GoogleFonts.dmSans()),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(ctx, 'settings'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.navy,
                  foregroundColor: Colors.white,
                ),
                child: Text('Open Settings', style: GoogleFonts.dmSans()),
              ),
            ],
          ),
        );

        if (action == 'settings' && mounted) {
          await showSettingsDialog(context);
          final newKey = ref.read(apiKeyProvider).valueOrNull ?? '';
          if (newKey.isEmpty) return; // Still no key, don't navigate
        } else {
          return; // Cancelled
        }
      }
    }

    if (!mounted) return;
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => isExamMode
            ? ExamScreen(caseData: caseData)
            : StudySessionScreen(caseData: caseData),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(opacity: animation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 300),
      ),
    );
  }

  void _randomCase() {
    final filtered = ref.read(filteredCasesProvider);
    final all = ref.read(allAvailableCasesProvider);
    final pool = filtered.isNotEmpty ? filtered : all;
    final random = pool[Random().nextInt(pool.length)];
    _openCase(random);
  }

  @override
  Widget build(BuildContext context) {
    final filteredCases = ref.watch(filteredCasesProvider);
    final screenWidth = MediaQuery.of(context).size.width;

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
                    // Editorial masthead
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 16),
                          // Thin top rule
                          Container(
                            height: 2,
                            color: AppColors.navy,
                          ),
                          const SizedBox(height: 24),
                          // Masthead title
                          Text(
                            'PM&R Oral Boards',
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 38,
                              fontWeight: FontWeight.w700,
                              color: AppColors.navy,
                              letterSpacing: -0.5,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            'Case-Based Examination Preparation',
                            style: GoogleFonts.sourceSerif4(
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: AppColors.textMuted,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '${ref.watch(allAvailableCasesProvider).length} High-Yield Practice Cases',
                                style: GoogleFonts.dmSans(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textMuted,
                                  letterSpacing: 2,
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const DashboardScreen(),
                                      transitionsBuilder:
                                          (_, animation, __, child) {
                                        return FadeTransition(
                                            opacity: animation, child: child);
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.insights,
                                      size: 14,
                                      color: AppColors.navy,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'DASHBOARD',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.navy,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const HistoryScreen(),
                                      transitionsBuilder:
                                          (_, animation, __, child) {
                                        return FadeTransition(
                                            opacity: animation, child: child);
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                    ),
                                  );
                                },
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.bar_chart_rounded,
                                      size: 14,
                                      color: AppColors.burgundy,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'HISTORY',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.burgundy,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () =>
                                    AchievementsSheet.show(context),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.emoji_events_outlined,
                                      size: 14,
                                      color: const Color(0xFFD4A843),
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'BADGES',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: const Color(0xFFD4A843),
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              GestureDetector(
                                onTap: () => showSettingsDialog(context),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.settings_outlined,
                                      size: 14,
                                      color: AppColors.navy,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      'SETTINGS',
                                      style: GoogleFonts.dmSans(
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.navy,
                                        letterSpacing: 1.5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          // Mode toggle
                          _ModeToggle(),
                          const SizedBox(height: 16),
                          // API key banner when not set
                          _ApiKeyBanner(),
                          const SizedBox(height: 16),
                          // Study plan countdown + today's focus
                          StudyPlanCard(onOpenCase: _openCase),
                          const SizedBox(height: 16),
                          // Due reviews
                          const DueReviewsCard(),
                          // Streak & Goals
                          const StreakCard(),
                          const SizedBox(height: 12),
                          // XP progress bar
                          const XpBar(),
                          const SizedBox(height: 24),
                          // Thin bottom rule
                          Container(
                            height: 1,
                            color: AppColors.divider,
                          ),
                          const SizedBox(height: 28),
                          // Search + random row
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.surface,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withValues(alpha: 0.05),
                                        blurRadius: 8,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: TextField(
                                    controller: _searchController,
                                    onChanged: (value) {
                                      ref.read(searchTermProvider.notifier).state =
                                          value;
                                    },
                                    style: GoogleFonts.dmSans(
                                      fontSize: 14,
                                      color: AppColors.text,
                                    ),
                                    decoration: InputDecoration(
                                      prefixIcon: const Icon(
                                        Icons.search,
                                        color: AppColors.textMuted,
                                        size: 20,
                                      ),
                                      hintText:
                                          'Search cases by title or content...',
                                      border: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      contentPadding:
                                          const EdgeInsets.symmetric(vertical: 14),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          const CaseAuthorScreen(),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.add, size: 16),
                                label: Text(
                                  'Create',
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppColors.navy,
                                  side: const BorderSide(color: AppColors.navy),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton.icon(
                                onPressed: _randomCase,
                                icon: const Icon(Icons.shuffle, size: 16),
                                label: Text(
                                  'Random Case',
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.burgundy,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  elevation: 0,
                                ),
                              ),
                            ],
                          ),
                          // Full Exam Session button (exam mode only)
                          if (ref.watch(isExamModeProvider)) ...[
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          const MultiCaseSetupScreen(),
                                      transitionsBuilder:
                                          (_, animation, __, child) {
                                        return FadeTransition(
                                            opacity: animation, child: child);
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.playlist_play, size: 18),
                                label: Text(
                                  'Full Exam Session (Multiple Cases)',
                                  style: GoogleFonts.dmSans(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: AppColors.navy,
                                  side: const BorderSide(color: AppColors.navy),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          const SizedBox(height: 32),
                        ],
                      ),
                    ),

                    // Recommendations
                    _RecommendationsSection(onOpenCase: _openCase),

                    // Case grid or empty state
                    if (filteredCases.isEmpty)
                      SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 48,
                                color: AppColors.textMuted.withValues(alpha: 0.5),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'No cases found',
                                style: GoogleFonts.playfairDisplay(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.textMuted,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Try adjusting your search terms.',
                                style: GoogleFonts.sourceSerif4(
                                  color: AppColors.textMuted,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      SliverGrid(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: screenWidth > 900 ? 420 : 600,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 20,
                          mainAxisExtent: 240,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final c = filteredCases[index];
                            return _StaggeredFadeIn(
                              index: index,
                              child: CaseCard(
                                data: c,
                                onTap: () => _openCase(c),
                              ),
                            );
                          },
                          childCount: filteredCases.length,
                        ),
                      ),

                    // Footer
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 48),
                        child: Column(
                          children: [
                            Container(
                              height: 1,
                              width: 120,
                              color: AppColors.divider,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Original cases for PM&R oral board preparation.',
                              style: GoogleFonts.sourceSerif4(
                                fontSize: 13,
                                fontStyle: FontStyle.italic,
                                color: AppColors.textMuted,
                              ),
                            ),
                          ],
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

/// Study / Exam mode segmented control
class _ModeToggle extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isExamMode = ref.watch(isExamModeProvider);

    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceAlt,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: const EdgeInsets.all(3),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ModeOption(
            label: 'Study',
            icon: Icons.menu_book_outlined,
            isSelected: !isExamMode,
            onTap: () =>
                ref.read(isExamModeProvider.notifier).state = false,
          ),
          _ModeOption(
            label: 'Exam Simulation',
            icon: Icons.videocam_outlined,
            isSelected: isExamMode,
            onTap: () =>
                ref.read(isExamModeProvider.notifier).state = true,
          ),
        ],
      ),
    );
  }
}

class _ModeOption extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const _ModeOption({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? AppColors.navy : AppColors.textMuted,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.dmSans(
                fontSize: 13,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? AppColors.navy : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Recommended cases based on weak areas
class _RecommendationsSection extends ConsumerWidget {
  final void Function(CaseModel) onOpenCase;

  const _RecommendationsSection({required this.onOpenCase});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recs = ref.watch(recommendationsProvider);
    if (recs.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recommended for You',
            style: GoogleFonts.playfairDisplay(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.navy,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Based on your weak areas',
            style: GoogleFonts.sourceSerif4(
              fontSize: 13,
              fontStyle: FontStyle.italic,
              color: AppColors.textMuted,
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: recs.length,
              itemBuilder: (context, index) {
                final rec = recs[index];
                return RecommendationCard(
                  recommendation: rec,
                  onTap: () => onOpenCase(rec.caseModel),
                );
              },
            ),
          ),
          const SizedBox(height: 28),
          Container(height: 1, color: AppColors.divider),
          const SizedBox(height: 28),
        ],
      ),
    );
  }
}

/// Banner shown when API key is not configured
class _ApiKeyBanner extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiKey = ref.watch(apiKeyProvider).valueOrNull ?? '';
    if (apiKey.isNotEmpty) return const SizedBox.shrink();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.warning.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.warning.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          Icon(Icons.key, size: 18, color: AppColors.warning),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Add your Gemini API key to enable AI-powered exam simulation and feedback.',
              style: GoogleFonts.sourceSerif4(
                fontSize: 13,
                color: AppColors.text,
              ),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () => showSettingsDialog(context),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.navy,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'Set Up',
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Staggered fade-in animation for grid items
class _StaggeredFadeIn extends StatefulWidget {
  final int index;
  final Widget child;

  const _StaggeredFadeIn({required this.index, required this.child});

  @override
  State<_StaggeredFadeIn> createState() => _StaggeredFadeInState();
}

class _StaggeredFadeInState extends State<_StaggeredFadeIn>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    final delay = (widget.index * 40).clamp(0, 400);
    _opacity = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slide = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    Future.delayed(Duration(milliseconds: delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slide,
        child: widget.child,
      ),
    );
  }
}
