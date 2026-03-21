import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/weak_area.dart';
import '../providers/history_provider.dart';
import '../services/pdf_report_service.dart';
import '../theme/app_theme.dart';

class ExportReportButton extends ConsumerStatefulWidget {
  final WeakAreaAnalysis analysis;

  const ExportReportButton({super.key, required this.analysis});

  @override
  ConsumerState<ExportReportButton> createState() =>
      _ExportReportButtonState();
}

class _ExportReportButtonState extends ConsumerState<ExportReportButton> {
  bool _isGenerating = false;

  Future<void> _generate() async {
    setState(() => _isGenerating = true);

    try {
      final results =
          ref.read(examHistoryProvider).valueOrNull ?? [];
      final pdfBytes =
          await PdfReportService.generate(widget.analysis, results);

      final dir = await getTemporaryDirectory();
      final file = File(
          '${dir.path}/pmr_report_${DateTime.now().millisecondsSinceEpoch}.pdf');
      await file.writeAsBytes(pdfBytes);

      await SharePlus.instance.share(
        ShareParams(
          files: [XFile(file.path)],
          subject: 'PM&R Oral Boards Performance Report',
        ),
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error generating report: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isGenerating = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Export performance report as PDF',
      child: InkWell(
        onTap: _isGenerating ? null : _generate,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.navy.withValues(alpha: 0.3)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_isGenerating)
                const SizedBox(
                  width: 14,
                  height: 14,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.navy,
                  ),
                )
              else
                const Icon(Icons.download, size: 14, color: AppColors.navy),
              const SizedBox(width: 6),
              Text(
                _isGenerating ? 'Generating...' : 'Export Report',
                style: GoogleFonts.dmSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: AppColors.navy,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
