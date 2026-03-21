import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/weak_area.dart';
import '../../theme/app_theme.dart';

class DomainBarChart extends StatelessWidget {
  final Map<String, DomainSummary> domains;

  const DomainBarChart({super.key, required this.domains});

  @override
  Widget build(BuildContext context) {
    final entries = domains.entries.toList();

    return Semantics(
      label: 'Domain performance: ${entries.map((e) => '${e.value.domainName} ${(e.value.hitRate * 100).round()}%').join(', ')}',
      child: Column(
      children: entries.map((e) {
        final d = e.value;
        final pct = d.hitRate;
        final color = pct >= 0.7
            ? AppColors.success
            : (pct >= 0.4 ? AppColors.warning : AppColors.danger);

        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Row(
            children: [
              SizedBox(
                width: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Domain ${d.domain}',
                      style: GoogleFonts.dmSans(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.navy,
                        letterSpacing: 0.5,
                      ),
                    ),
                    Text(
                      d.domainName,
                      style: GoogleFonts.dmSans(
                        fontSize: 11,
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: pct,
                    backgroundColor: AppColors.surfaceAlt,
                    color: color,
                    minHeight: 10,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              SizedBox(
                width: 42,
                child: Text(
                  d.totalConcepts > 0 ? '${(pct * 100).round()}%' : '--',
                  textAlign: TextAlign.right,
                  style: GoogleFonts.dmSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: d.totalConcepts > 0 ? color : AppColors.textMuted,
                  ),
                ),
              ),
            ],
          ),
        );
      }).toList(),
    ),
    );
  }
}
