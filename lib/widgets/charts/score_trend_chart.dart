import 'dart:math';
import 'package:flutter/material.dart';
import '../../models/weak_area.dart';
import '../../theme/app_theme.dart';

class ScoreTrendChart extends StatelessWidget {
  final List<TrendPoint> trend;

  const ScoreTrendChart({super.key, required this.trend});

  @override
  Widget build(BuildContext context) {
    if (trend.length < 2) {
      return const SizedBox(
        height: 120,
        child: Center(
          child: Text(
            'Need more data for trend',
            style: TextStyle(color: AppColors.textMuted, fontSize: 13),
          ),
        ),
      );
    }

    final first = trend.first.score.round();
    final last = trend.last.score.round();
    final direction = last > first ? 'improving' : (last < first ? 'declining' : 'stable');

    return Semantics(
      label: 'Score trend chart: $direction from $first% to $last% over ${trend.length} data points',
      child: SizedBox(
        height: 140,
        child: CustomPaint(
          size: Size.infinite,
          painter: _TrendPainter(trend),
        ),
      ),
    );
  }
}

class _TrendPainter extends CustomPainter {
  final List<TrendPoint> trend;

  _TrendPainter(this.trend);

  @override
  void paint(Canvas canvas, Size size) {
    if (trend.length < 2) return;

    const leftPad = 36.0;
    const bottomPad = 4.0;
    final chartW = size.width - leftPad;
    final chartH = size.height - bottomPad;

    final minScore = trend.map((t) => t.score).reduce(min).clamp(0.0, 100.0);
    final maxScore = trend.map((t) => t.score).reduce(max).clamp(0.0, 100.0);
    final scoreRange = (maxScore - minScore).clamp(10.0, 100.0);

    // Grid lines
    final gridPaint = Paint()
      ..color = AppColors.divider
      ..strokeWidth = 0.5;

    for (var pct = 0.0; pct <= 1.0; pct += 0.25) {
      final y = chartH - (pct * chartH);
      canvas.drawLine(
        Offset(leftPad, y),
        Offset(size.width, y),
        gridPaint,
      );
    }

    // Plot line
    final linePaint = Paint()
      ..color = AppColors.burgundy
      ..strokeWidth = 2.5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final dotPaint = Paint()
      ..color = AppColors.burgundy
      ..style = PaintingStyle.fill;

    final path = Path();
    for (var i = 0; i < trend.length; i++) {
      final x = leftPad + (i / (trend.length - 1)) * chartW;
      final normalized = (trend[i].score - minScore) / scoreRange;
      final y = chartH - (normalized.clamp(0.0, 1.0) * chartH);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
      canvas.drawCircle(Offset(x, y), 3, dotPaint);
    }
    canvas.drawPath(path, linePaint);

    // Y-axis labels
    final textStyle = TextStyle(
      color: AppColors.textMuted,
      fontSize: 10,
    );
    for (var pct = 0.0; pct <= 1.0; pct += 0.5) {
      final val = (minScore + pct * scoreRange).round();
      final y = chartH - (pct * chartH);
      final tp = TextPainter(
        text: TextSpan(text: '$val%', style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(0, y - tp.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
