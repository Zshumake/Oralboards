import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/case_model.dart';
import '../providers/custom_cases_provider.dart';
import '../theme/app_theme.dart';

class CaseAuthorScreen extends ConsumerStatefulWidget {
  final CaseModel? existingCase;

  const CaseAuthorScreen({super.key, this.existingCase});

  @override
  ConsumerState<CaseAuthorScreen> createState() => _CaseAuthorScreenState();
}

class _CaseAuthorScreenState extends ConsumerState<CaseAuthorScreen> {
  late TextEditingController _titleController;
  final List<_SectionEntry> _sections = [];
  bool get _isEditing => widget.existingCase != null;

  @override
  void initState() {
    super.initState();
    if (widget.existingCase != null) {
      _titleController =
          TextEditingController(text: widget.existingCase!.title);
      for (final s in widget.existingCase!.sections) {
        _sections.add(_SectionEntry(
          titleController: TextEditingController(text: s.title),
          contentController: TextEditingController(text: s.content),
        ));
      }
    } else {
      _titleController = TextEditingController();
      _sections.add(_SectionEntry(
        titleController: TextEditingController(text: 'Initial Presentation'),
        contentController: TextEditingController(),
      ));
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    for (final s in _sections) {
      s.titleController.dispose();
      s.contentController.dispose();
    }
    super.dispose();
  }

  CaseModel _buildCase() {
    final id = widget.existingCase?.id ??
        'custom_${DateTime.now().millisecondsSinceEpoch}';
    return CaseModel(
      id: id,
      title: _titleController.text.trim(),
      sections: _sections
          .where((s) =>
              s.titleController.text.trim().isNotEmpty ||
              s.contentController.text.trim().isNotEmpty)
          .map((s) => Section(
                title: s.titleController.text.trim(),
                content: s.contentController.text.trim(),
              ))
          .toList(),
      isCustom: true,
    );
  }

  Future<void> _save() async {
    final caseModel = _buildCase();
    if (caseModel.title.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a case title')),
      );
      return;
    }
    if (caseModel.sections.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please add at least one section')),
      );
      return;
    }

    if (_isEditing) {
      await ref.read(customCasesProvider.notifier).updateCase(caseModel);
    } else {
      await ref.read(customCasesProvider.notifier).createCase(caseModel);
    }
    if (mounted) Navigator.pop(context);
  }

  Future<void> _delete() async {
    if (widget.existingCase == null) return;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Delete Case?',
            style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w700, color: AppColors.navy)),
        content: Text('This cannot be undone.',
            style: GoogleFonts.sourceSerif4(color: AppColors.text)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text('Cancel', style: GoogleFonts.dmSans()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.danger),
            child: Text('Delete', style: GoogleFonts.dmSans()),
          ),
        ],
      ),
    );
    if (confirmed == true) {
      await ref
          .read(customCasesProvider.notifier)
          .deleteCase(widget.existingCase!.id);
      if (mounted) Navigator.pop(context);
    }
  }

  void _exportJson() {
    final jsonStr = _buildCase().toJsonString();
    Clipboard.setData(ClipboardData(text: jsonStr));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Case JSON copied to clipboard')),
    );
  }

  Future<void> _importJson() async {
    final controller = TextEditingController();
    final result = await showDialog<String>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Import Case JSON',
            style: GoogleFonts.playfairDisplay(
                fontWeight: FontWeight.w700, color: AppColors.navy)),
        content: TextField(
          controller: controller,
          maxLines: 8,
          style: GoogleFonts.dmSans(fontSize: 12),
          decoration: const InputDecoration(hintText: 'Paste JSON here...'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text('Cancel', style: GoogleFonts.dmSans()),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, controller.text),
            child: Text('Import', style: GoogleFonts.dmSans()),
          ),
        ],
      ),
    );
    controller.dispose();

    if (result != null && result.trim().isNotEmpty) {
      try {
        final imported = CaseModel.fromJsonString(result);
        setState(() {
          _titleController.text = imported.title;
          _sections.clear();
          for (final s in imported.sections) {
            _sections.add(_SectionEntry(
              titleController: TextEditingController(text: s.title),
              contentController: TextEditingController(text: s.content),
            ));
          }
        });
      } catch (_) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid JSON format')),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, size: 20),
                        onPressed: () => Navigator.pop(context),
                        color: AppColors.navy,
                      ),
                      Expanded(
                        child: Text(
                          _isEditing ? 'Edit Case' : 'Create Case',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.navy,
                          ),
                        ),
                      ),
                      PopupMenuButton<String>(
                        icon: Icon(Icons.more_vert,
                            color: AppColors.navy, size: 20),
                        onSelected: (value) {
                          if (value == 'export') _exportJson();
                          if (value == 'import') _importJson();
                          if (value == 'delete') _delete();
                        },
                        itemBuilder: (_) => [
                          const PopupMenuItem(
                              value: 'export', child: Text('Export as JSON')),
                          const PopupMenuItem(
                              value: 'import', child: Text('Import from JSON')),
                          if (_isEditing)
                            const PopupMenuItem(
                                value: 'delete', child: Text('Delete Case')),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Container(height: 1, color: AppColors.divider),
                ),

                // Content
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(24),
                    children: [
                      // Title
                      TextField(
                        controller: _titleController,
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.navy,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Case Title',
                          hintStyle: GoogleFonts.playfairDisplay(
                            color: AppColors.textLight,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Sections
                      ...List.generate(_sections.length, (i) {
                        final s = _sections[i];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: AppColors.surface,
                            borderRadius: BorderRadius.circular(8),
                            border: Border(
                              left: BorderSide(
                                  color: AppColors.burgundy, width: 3),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    Colors.black.withValues(alpha: 0.03),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: s.titleController,
                                      style: GoogleFonts.dmSans(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.navy,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: 'Section Title',
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        hintStyle: GoogleFonts.dmSans(
                                            color: AppColors.textLight),
                                      ),
                                    ),
                                  ),
                                  if (_sections.length > 1)
                                    IconButton(
                                      icon: const Icon(Icons.close, size: 16),
                                      onPressed: () {
                                        setState(() {
                                          _sections[i]
                                              .titleController
                                              .dispose();
                                          _sections[i]
                                              .contentController
                                              .dispose();
                                          _sections.removeAt(i);
                                        });
                                      },
                                      color: AppColors.textMuted,
                                    ),
                                ],
                              ),
                              const Divider(height: 16),
                              TextField(
                                controller: s.contentController,
                                maxLines: null,
                                minLines: 3,
                                style: GoogleFonts.sourceSerif4(
                                  fontSize: 14,
                                  height: 1.6,
                                  color: AppColors.text,
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Section content...',
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.zero,
                                  hintStyle: GoogleFonts.sourceSerif4(
                                      color: AppColors.textLight),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),

                      // Add section button
                      OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            _sections.add(_SectionEntry(
                              titleController: TextEditingController(),
                              contentController: TextEditingController(),
                            ));
                          });
                        },
                        icon: const Icon(Icons.add, size: 16),
                        label: Text('Add Section',
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.w600)),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),

                // Save bar
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    border:
                        Border(top: BorderSide(color: AppColors.border)),
                  ),
                  child: ElevatedButton(
                    onPressed: _save,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.burgundy,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: Text(
                      _isEditing ? 'Save Changes' : 'Create Case',
                      style: GoogleFonts.dmSans(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionEntry {
  final TextEditingController titleController;
  final TextEditingController contentController;

  _SectionEntry({
    required this.titleController,
    required this.contentController,
  });
}
