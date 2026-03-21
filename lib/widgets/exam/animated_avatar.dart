import 'dart:math';
import 'package:flutter/material.dart';
import 'avatar_state.dart';

class AnimatedAvatar extends StatefulWidget {
  final AvatarState avatarState;

  const AnimatedAvatar({super.key, required this.avatarState});

  @override
  State<AnimatedAvatar> createState() => _AnimatedAvatarState();
}

class _AnimatedAvatarState extends State<AnimatedAvatar>
    with TickerProviderStateMixin {
  late AnimationController _breathController;
  late AnimationController _blinkController;
  late AnimationController _mouthController;
  late AnimationController _headController;

  final _random = Random();
  bool _isBlinking = false;
  double _eyeWanderX = 0;
  double _eyeWanderY = 0;

  @override
  void initState() {
    super.initState();
    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);

    _blinkController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );

    _mouthController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    );

    _headController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _scheduleBlink();
    _scheduleEyeWander();
    _updateForState();
  }

  @override
  void didUpdateWidget(AnimatedAvatar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.avatarState != widget.avatarState) {
      _updateForState();
    }
  }

  void _updateForState() {
    switch (widget.avatarState) {
      case AvatarState.speaking:
        _mouthController.repeat(reverse: true);
        _headController.animateTo(0, duration: const Duration(milliseconds: 300));
        break;
      case AvatarState.thinking:
        _mouthController.stop();
        _mouthController.value = 0;
        _headController.animateTo(1, duration: const Duration(milliseconds: 600));
        break;
      case AvatarState.listening:
        _mouthController.stop();
        _mouthController.value = 0;
        _headController.animateTo(0, duration: const Duration(milliseconds: 300));
        break;
      case AvatarState.idle:
        _mouthController.stop();
        _mouthController.value = 0;
        _headController.animateTo(0, duration: const Duration(milliseconds: 300));
        break;
    }
  }

  void _scheduleBlink() {
    if (!mounted) return;
    final delay = Duration(milliseconds: 2000 + _random.nextInt(4000));
    Future.delayed(delay, () {
      if (!mounted) return;
      setState(() => _isBlinking = true);
      _blinkController.forward().then((_) {
        _blinkController.reverse().then((_) {
          if (mounted) setState(() => _isBlinking = false);
          _scheduleBlink();
        });
      });
    });
  }

  void _scheduleEyeWander() {
    if (!mounted) return;
    final delay = Duration(milliseconds: 5000 + _random.nextInt(3000));
    Future.delayed(delay, () {
      if (!mounted) return;
      setState(() {
        if (widget.avatarState == AvatarState.thinking) {
          _eyeWanderX = -2;
          _eyeWanderY = -2;
        } else {
          _eyeWanderX = (_random.nextDouble() - 0.5) * 3;
          _eyeWanderY = (_random.nextDouble() - 0.5) * 2;
        }
      });
      Future.delayed(const Duration(milliseconds: 800), () {
        if (mounted) setState(() { _eyeWanderX = 0; _eyeWanderY = 0; });
        _scheduleEyeWander();
      });
    });
  }

  @override
  void dispose() {
    _breathController.dispose();
    _blinkController.dispose();
    _mouthController.dispose();
    _headController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        _breathController,
        _blinkController,
        _mouthController,
        _headController,
      ]),
      builder: (context, child) {
        final breathScale = 1.0 + (_breathController.value * 0.015);
        final headTilt = _headController.value * 0.05;
        final mouthOpen = _mouthController.value;
        final listenLean = widget.avatarState == AvatarState.listening ? -1.5 : 0.0;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..scale(breathScale)
            ..rotateZ(headTilt)
            ..translate(0.0, listenLean),
          child: CustomPaint(
            painter: _AvatarPainter(
              isBlinking: _isBlinking,
              mouthOpen: mouthOpen,
              eyeWanderX: _eyeWanderX,
              eyeWanderY: _eyeWanderY,
              avatarState: widget.avatarState,
            ),
            size: Size.infinite,
          ),
        );
      },
    );
  }
}

class _AvatarPainter extends CustomPainter {
  final bool isBlinking;
  final double mouthOpen;
  final double eyeWanderX;
  final double eyeWanderY;
  final AvatarState avatarState;

  _AvatarPainter({
    required this.isBlinking,
    required this.mouthOpen,
    required this.eyeWanderX,
    required this.eyeWanderY,
    required this.avatarState,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final headRadius = size.width * 0.22;

    // Shoulders
    final shoulderPaint = Paint()
      ..color = const Color(0xFF2A4A6B)
      ..style = PaintingStyle.fill;
    final shoulderPath = Path()
      ..moveTo(cx - headRadius * 1.5, cy + headRadius * 1.3)
      ..quadraticBezierTo(cx, cy + headRadius * 0.8, cx + headRadius * 1.5, cy + headRadius * 1.3)
      ..lineTo(cx + headRadius * 1.5, size.height)
      ..lineTo(cx - headRadius * 1.5, size.height)
      ..close();
    canvas.drawPath(shoulderPath, shoulderPaint);

    // Neck
    canvas.drawRect(
      Rect.fromCenter(
        center: Offset(cx, cy + headRadius * 0.9),
        width: headRadius * 0.5,
        height: headRadius * 0.5,
      ),
      Paint()..color = const Color(0xFFDEB89C),
    );

    // Head
    canvas.drawCircle(
      Offset(cx, cy - headRadius * 0.1),
      headRadius,
      Paint()..color = const Color(0xFFDEB89C),
    );

    // Eyes
    if (!isBlinking) {
      final eyeY = cy - headRadius * 0.25 + eyeWanderY;
      final eyeSpacing = headRadius * 0.35;

      // White of eye
      final eyeWhitePaint = Paint()..color = Colors.white;
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(cx - eyeSpacing, eyeY),
          width: headRadius * 0.28,
          height: headRadius * 0.18,
        ),
        eyeWhitePaint,
      );
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(cx + eyeSpacing, eyeY),
          width: headRadius * 0.28,
          height: headRadius * 0.18,
        ),
        eyeWhitePaint,
      );

      // Pupils
      final pupilPaint = Paint()..color = const Color(0xFF1B3A5C);
      canvas.drawCircle(
        Offset(cx - eyeSpacing + eyeWanderX, eyeY),
        headRadius * 0.06,
        pupilPaint,
      );
      canvas.drawCircle(
        Offset(cx + eyeSpacing + eyeWanderX, eyeY),
        headRadius * 0.06,
        pupilPaint,
      );
    } else {
      // Closed eyes (lines)
      final eyeY = cy - headRadius * 0.25;
      final eyeSpacing = headRadius * 0.35;
      final linePaint = Paint()
        ..color = const Color(0xFF4A3728)
        ..strokeWidth = 1.5
        ..style = PaintingStyle.stroke;
      canvas.drawLine(
        Offset(cx - eyeSpacing - headRadius * 0.1, eyeY),
        Offset(cx - eyeSpacing + headRadius * 0.1, eyeY),
        linePaint,
      );
      canvas.drawLine(
        Offset(cx + eyeSpacing - headRadius * 0.1, eyeY),
        Offset(cx + eyeSpacing + headRadius * 0.1, eyeY),
        linePaint,
      );
    }

    // Mouth
    final mouthY = cy + headRadius * 0.25;
    if (mouthOpen > 0.1) {
      // Open mouth (speaking)
      canvas.drawOval(
        Rect.fromCenter(
          center: Offset(cx, mouthY),
          width: headRadius * 0.3,
          height: headRadius * 0.15 * mouthOpen,
        ),
        Paint()..color = const Color(0xFF6B3A3A),
      );
    } else {
      // Closed mouth (line)
      canvas.drawLine(
        Offset(cx - headRadius * 0.15, mouthY),
        Offset(cx + headRadius * 0.15, mouthY),
        Paint()
          ..color = const Color(0xFF8B6B5C)
          ..strokeWidth = 1.5
          ..style = PaintingStyle.stroke,
      );
    }

    // Hair
    final hairPaint = Paint()..color = const Color(0xFF3A2A1A);
    final hairPath = Path()
      ..addArc(
        Rect.fromCircle(center: Offset(cx, cy - headRadius * 0.1), radius: headRadius),
        -pi * 0.85,
        pi * 0.7,
      )
      ..close();
    canvas.drawPath(hairPath, hairPaint);
  }

  @override
  bool shouldRepaint(covariant _AvatarPainter old) {
    return old.isBlinking != isBlinking ||
        old.mouthOpen != mouthOpen ||
        old.eyeWanderX != eyeWanderX ||
        old.eyeWanderY != eyeWanderY ||
        old.avatarState != avatarState;
  }
}
