import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';

class ContentRenderer extends StatelessWidget {
  final String content;

  const ContentRenderer({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
      data: content,
      selectable: true,
      styleSheet: MarkdownStyleSheet(
        p: GoogleFonts.sourceSerif4(
          color: AppColors.text,
          fontSize: 15,
          height: 1.7,
        ),
        strong: GoogleFonts.sourceSerif4(
          color: AppColors.text,
          fontWeight: FontWeight.w700,
        ),
        h1: GoogleFonts.playfairDisplay(
          color: AppColors.navy,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
        h2: GoogleFonts.playfairDisplay(
          color: AppColors.text,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
        h3: GoogleFonts.playfairDisplay(
          color: AppColors.burgundy,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        listBullet: GoogleFonts.sourceSerif4(
          color: AppColors.textMuted,
          fontSize: 15,
        ),
        listIndent: 20,
        blockSpacing: 14,
        horizontalRuleDecoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: AppColors.divider),
          ),
        ),
      ),
    );
  }
}
