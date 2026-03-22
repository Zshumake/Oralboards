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
  late AnimationController _nodController;
  late AnimationController _swayController;
  late AnimationController _browController;

  final _random = Random();
  bool _isSpeakingLoopActive = false;
  double _eyeWanderX = 0;
  double _eyeWanderY = 0;

  @override
  void initState() {
    super.initState();
    _breathController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    )..repeat(reverse: true);

    _swayController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 6000),
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

    _nodController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _browController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _scheduleBlink();
    _scheduleEyeWander();
    _scheduleNod();
    _scheduleBrowRaise();
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
        _headController.animateTo(0, duration: const Duration(milliseconds: 300));
        if (!_isSpeakingLoopActive) {
          _isSpeakingLoopActive = true;
          _speakSyllableLoop();
        }
        break;
      case AvatarState.thinking:
        _isSpeakingLoopActive = false;
        _mouthController.animateTo(0, duration: const Duration(milliseconds: 200));
        _headController.animateTo(1, duration: const Duration(milliseconds: 600));
        break;
      case AvatarState.listening:
        _isSpeakingLoopActive = false;
        _mouthController.animateTo(0, duration: const Duration(milliseconds: 200));
        _headController.animateTo(0, duration: const Duration(milliseconds: 300));
        break;
      case AvatarState.idle:
        _isSpeakingLoopActive = false;
        _mouthController.animateTo(0, duration: const Duration(milliseconds: 200));
        _headController.animateTo(0, duration: const Duration(milliseconds: 300));
        break;
    }
  }

  void _speakSyllableLoop() {
    if (!mounted || !_isSpeakingLoopActive) return;
    final targetOpen = 0.2 + _random.nextDouble() * 0.8;
    final duration = Duration(milliseconds: 80 + _random.nextInt(120));
    _mouthController.animateTo(targetOpen, duration: duration, curve: Curves.easeInOut).then((_) {
      if (!mounted || !_isSpeakingLoopActive) return;
      final closeDuration = Duration(milliseconds: 50 + _random.nextInt(80));
      _mouthController.animateTo(0.1, duration: closeDuration, curve: Curves.easeInOut).then((_) {
        _speakSyllableLoop();
      });
    });
  }

  void _scheduleBlink() {
    if (!mounted) return;
    final delay = Duration(milliseconds: 2000 + _random.nextInt(4000));
    Future.delayed(delay, () {
      if (!mounted) return;
      final isDouble = _random.nextDouble() < 0.3; // 30% chance for double blink
      
      void completeBlink() {
        if (!isDouble || !mounted) {
          _scheduleBlink();
        } else {
          _blinkController.forward().then((_) {
            _blinkController.reverse().then((_) {
               if (mounted) _scheduleBlink();
            });
          });
        }
      }

      _blinkController.forward().then((_) {
        _blinkController.reverse().then((_) {
          completeBlink();
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

  void _scheduleNod() {
    if (!mounted) return;
    final delay = Duration(milliseconds: 3000 + _random.nextInt(4000));
    Future.delayed(delay, () {
      if (!mounted) return;
      if (widget.avatarState == AvatarState.listening || widget.avatarState == AvatarState.idle) {
        _nodController.forward().then((_) {
          if (mounted) _nodController.reverse();
        });
      }
      _scheduleNod();
    });
  }

  void _scheduleBrowRaise() {
    if (!mounted) return;
    final delay = Duration(milliseconds: 2000 + _random.nextInt(5000));
    Future.delayed(delay, () {
      if (!mounted) return;
      if (widget.avatarState == AvatarState.speaking || widget.avatarState == AvatarState.idle) {
        _browController.forward().then((_) {
          Future.delayed(Duration(milliseconds: 200 + _random.nextInt(500)), () {
            if (mounted) _browController.reverse();
          });
        });
      }
      _scheduleBrowRaise();
    });
  }

  @override
  void dispose() {
    _isSpeakingLoopActive = false;
    _breathController.dispose();
    _blinkController.dispose();
    _mouthController.dispose();
    _headController.dispose();
    _swayController.dispose();
    _nodController.dispose();
    _browController.dispose();
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
        _swayController,
        _nodController,
        _browController,
      ]),
      builder: (context, child) {
        final breathScale = 1.0 + (_breathController.value * 0.015);
        final headTilt = _headController.value * 0.05;
        final swayX = (_swayController.value * 2.0 - 1.0) * 4.0;
        final swayRotate = (_swayController.value * 2.0 - 1.0) * 0.02;
        
        final nodLean = _nodController.value * 4.0;
        final baseListenLean = widget.avatarState == AvatarState.listening ? -1.5 : 0.0;
        final totalLeanY = baseListenLean + nodLean;
        
        final mouthOpen = _mouthController.value;

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..scale(breathScale)
            ..translate(swayX, totalLeanY)
            ..rotateZ(headTilt + swayRotate),
          child: CustomPaint(
            painter: _AvatarPainter(
              blinkProgress: _blinkController.value,
              mouthOpen: mouthOpen,
              eyeWanderX: _eyeWanderX,
              eyeWanderY: _eyeWanderY,
              browRaise: _browController.value,
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
  final double blinkProgress;
  final double mouthOpen;
  final double eyeWanderX;
  final double eyeWanderY;
  final double browRaise;
  final AvatarState avatarState;

  _AvatarPainter({
    required this.blinkProgress,
    required this.mouthOpen,
    required this.eyeWanderX,
    required this.eyeWanderY,
    required this.browRaise,
    required this.avatarState,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final scale = size.width / 200.0;

    final faceCenterY = cy - 20 * scale;

    // Background/Shoulders (Suit Jacket)
    final suitPaint = Paint()
      ..color = const Color(0xFF1A2238)
      ..style = PaintingStyle.fill;
    final suitPath = Path()
      ..moveTo(cx - 95 * scale, size.height)
      ..quadraticBezierTo(
          cx - 85 * scale, cy + 40 * scale, cx - 40 * scale, cy + 30 * scale)
      ..lineTo(cx + 40 * scale, cy + 30 * scale)
      ..quadraticBezierTo(
          cx + 85 * scale, cy + 40 * scale, cx + 95 * scale, size.height)
      ..close();
    canvas.drawPath(suitPath, suitPaint);

    // White Shirt Collar
    final shirtPaint = Paint()
      ..color = const Color(0xFFF0F4F8)
      ..style = PaintingStyle.fill;
    final shirtPath = Path()
      ..moveTo(cx, cy + 60 * scale)
      ..lineTo(cx - 35 * scale, cy + 30 * scale)
      ..lineTo(cx - 18 * scale, cy + 20 * scale)
      ..lineTo(cx + 18 * scale, cy + 20 * scale)
      ..lineTo(cx + 35 * scale, cy + 30 * scale)
      ..close();
    canvas.drawPath(shirtPath, shirtPaint);

    // Red Tie
    final tiePaint = Paint()
      ..color = const Color(0xFF8B0000)
      ..style = PaintingStyle.fill;
    final tiePath = Path()
      ..moveTo(cx - 10 * scale, cy + 45 * scale)
      ..lineTo(cx + 10 * scale, cy + 45 * scale)
      ..lineTo(cx + 15 * scale, cy + 90 * scale)
      ..lineTo(cx, cy + 110 * scale)
      ..lineTo(cx - 15 * scale, cy + 90 * scale)
      ..close();
    tiePath.addPolygon([
      Offset(cx - 13 * scale, cy + 30 * scale),
      Offset(cx + 13 * scale, cy + 30 * scale),
      Offset(cx + 10 * scale, cy + 48 * scale),
      Offset(cx - 10 * scale, cy + 48 * scale),
    ], true);
    canvas.drawPath(tiePath, tiePaint);

    // Neck
    final skinPaint = Paint()
      ..color = const Color(0xFFFFDBAC)
      ..style = PaintingStyle.fill;
    final neckShadowPaint = Paint()
      ..color = const Color(0xFFE0B888)
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromCenter(
          center: Offset(cx, faceCenterY + 55 * scale),
          width: 32 * scale,
          height: 40 * scale),
      skinPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(cx, faceCenterY + 45 * scale),
          width: 32 * scale,
          height: 18 * scale),
      neckShadowPaint,
    );

    // Ears
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(cx - 43 * scale, faceCenterY + 5 * scale),
          width: 14 * scale,
          height: 28 * scale),
      skinPaint,
    );
    canvas.drawOval(
      Rect.fromCenter(
          center: Offset(cx + 43 * scale, faceCenterY + 5 * scale),
          width: 14 * scale,
          height: 28 * scale),
      skinPaint,
    );

    // Face shape
    final jawDrop = mouthOpen * 8 * scale;
    final facePath = Path()
      ..moveTo(cx - 40 * scale, faceCenterY - 10 * scale)
      ..quadraticBezierTo(cx - 40 * scale, faceCenterY + 30 * scale,
          cx - 25 * scale, faceCenterY + 45 * scale + (jawDrop * 0.5))
      ..quadraticBezierTo(
          cx, faceCenterY + 55 * scale + jawDrop, cx + 25 * scale, faceCenterY + 45 * scale + (jawDrop * 0.5))
      ..quadraticBezierTo(
          cx + 40 * scale, faceCenterY + 30 * scale, cx + 40 * scale, faceCenterY - 10 * scale)
      ..quadraticBezierTo(
          cx + 40 * scale, faceCenterY - 50 * scale, cx, faceCenterY - 50 * scale)
      ..quadraticBezierTo(
          cx - 40 * scale, faceCenterY - 50 * scale, cx - 40 * scale, faceCenterY - 10 * scale)
      ..close();
    canvas.drawPath(facePath, skinPaint);

    // Hair
    final hairPaint = Paint()
      ..color = const Color(0xFF2C1B18)
      ..style = PaintingStyle.fill;
    final hairPath = Path()
      ..moveTo(cx - 42 * scale, faceCenterY - 10 * scale)
      ..quadraticBezierTo(
          cx - 45 * scale, faceCenterY - 55 * scale, cx, faceCenterY - 60 * scale)
      ..quadraticBezierTo(
          cx + 45 * scale, faceCenterY - 55 * scale, cx + 42 * scale, faceCenterY - 10 * scale)
      ..quadraticBezierTo(
          cx + 35 * scale, faceCenterY - 30 * scale, cx + 15 * scale, faceCenterY - 35 * scale)
      ..quadraticBezierTo(
          cx, faceCenterY - 30 * scale, cx - 15 * scale, faceCenterY - 35 * scale)
      ..quadraticBezierTo(
          cx - 35 * scale, faceCenterY - 30 * scale, cx - 42 * scale, faceCenterY - 10 * scale)
      ..close();
    canvas.drawPath(hairPath, hairPaint);

    // Eyebrows
    final eyebrowPaint = Paint()
      ..color = const Color(0xFF2C1B18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3 * scale
      ..strokeCap = StrokeCap.round;

    final browMidY = faceCenterY -
        20 * scale +
        (avatarState == AvatarState.thinking ? 3 * scale : (-1.5 * browRaise * scale));

    canvas.drawPath(
      Path()
        ..moveTo(cx - 30 * scale, faceCenterY - 18 * scale - (browRaise * scale))
        ..quadraticBezierTo(
            cx - 20 * scale, faceCenterY - 24 * scale - (browRaise * 1.5 * scale), cx - 8 * scale, browMidY),
      eyebrowPaint,
    );
    canvas.drawPath(
      Path()
        ..moveTo(cx + 30 * scale, faceCenterY - 18 * scale - (browRaise * scale))
        ..quadraticBezierTo(
            cx + 20 * scale, faceCenterY - 24 * scale - (browRaise * 1.5 * scale), cx + 8 * scale, browMidY),
      eyebrowPaint,
    );

    // Nose
    final nosePaint = Paint()
      ..color = const Color(0xFFD3A378)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8 * scale
      ..strokeCap = StrokeCap.round;
    final nosePath = Path()
      ..moveTo(cx, faceCenterY - 5 * scale)
      ..lineTo(cx, faceCenterY + 15 * scale)
      ..lineTo(cx + 6 * scale, faceCenterY + 18 * scale)
      ..moveTo(cx - 5 * scale, faceCenterY + 18 * scale)
      ..quadraticBezierTo(
          cx, faceCenterY + 22 * scale, cx + 5 * scale, faceCenterY + 18 * scale);
    canvas.drawPath(nosePath, nosePaint);

    // Eyes
    final eyeY = faceCenterY - 5 * scale;
    final eyeXOffset = 18 * scale;
    final eyeWidth = 16 * scale;
    final eyeHeight = 8 * scale;

    final scleraPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    final irisPaint = Paint()
      ..color = const Color(0xFF4B3621)
      ..style = PaintingStyle.fill;
    final pupilPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    final catchlightPaint = Paint()
      ..color = Colors.white.withValues(alpha: 0.8)
      ..style = PaintingStyle.fill;

    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(cx - eyeXOffset, eyeY),
            width: eyeWidth,
            height: eyeHeight),
        scleraPaint);
    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(cx + eyeXOffset, eyeY),
            width: eyeWidth,
            height: eyeHeight),
        scleraPaint);

    canvas.save();
    final clipPath = Path()
      ..addOval(Rect.fromCenter(
          center: Offset(cx - eyeXOffset, eyeY),
          width: eyeWidth,
          height: eyeHeight))
      ..addOval(Rect.fromCenter(
          center: Offset(cx + eyeXOffset, eyeY),
          width: eyeWidth,
          height: eyeHeight));
    canvas.clipPath(clipPath);

    final irisX = eyeWanderX * scale;
    final irisY = eyeWanderY * scale;

    canvas.drawCircle(
        Offset(cx - eyeXOffset + irisX, eyeY + irisY), 4 * scale, irisPaint);
    canvas.drawCircle(
        Offset(cx - eyeXOffset + irisX, eyeY + irisY), 2 * scale, pupilPaint);
    canvas.drawCircle(
        Offset(cx - eyeXOffset + irisX + 1.5 * scale,
            eyeY + irisY - 1.5 * scale),
        1 * scale,
        catchlightPaint);

    canvas.drawCircle(
        Offset(cx + eyeXOffset + irisX, eyeY + irisY), 4 * scale, irisPaint);
    canvas.drawCircle(
        Offset(cx + eyeXOffset + irisX, eyeY + irisY), 2 * scale, pupilPaint);
    canvas.drawCircle(
        Offset(cx + eyeXOffset + irisX + 1.5 * scale,
            eyeY + irisY - 1.5 * scale),
        1 * scale,
        catchlightPaint);
        
    // Eyelid skin covering the eye during a blink
    if (blinkProgress > 0) {
      final lidPaint = Paint()..color = const Color(0xFFC49A6C)..style = PaintingStyle.fill;
      canvas.drawRect(Rect.fromLTWH(cx - eyeXOffset - eyeWidth, eyeY - eyeHeight, eyeWidth*2 + eyeXOffset*2, eyeHeight * 2 * blinkProgress), lidPaint);
    }
    
    canvas.restore();

    // Eyelashes line, moving down with blinkProgress
    final lashPaint = Paint()
      ..color = const Color(0xFF2C1B18)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.6 * scale;
      
    final lashCurveY = eyeY - 6 * scale + (blinkProgress * 6 * scale);
    final lashEndsY = eyeY + blinkProgress * (eyeHeight/2);
    
    canvas.drawPath(
        Path()
          ..moveTo(cx - eyeXOffset - 8 * scale, lashEndsY)
          ..quadraticBezierTo(cx - eyeXOffset, lashCurveY,
              cx - eyeXOffset + 8 * scale, lashEndsY),
        lashPaint);
    canvas.drawPath(
        Path()
          ..moveTo(cx + eyeXOffset - 8 * scale, lashEndsY)
          ..quadraticBezierTo(cx + eyeXOffset, lashCurveY,
              cx + eyeXOffset + 8 * scale, lashEndsY),
        lashPaint);

    // Mouth
    final mouthY = faceCenterY + 32 * scale;
    final lipColor = const Color(0xFFC88A7A);
    final darkMouthColor = const Color(0xFF3B1F20);
    final teethColor = const Color(0xFFEEEEEE);

    if (mouthOpen > 0.05) {
      final mOpenHeight = 15 * mouthOpen * scale;
      final mouthPath = Path()
        ..moveTo(cx - 10 * scale, mouthY)
        ..quadraticBezierTo(cx, mouthY - 4 * scale, cx + 10 * scale, mouthY)
        ..quadraticBezierTo(
            cx, mouthY + mOpenHeight, cx - 10 * scale, mouthY)
        ..close();
      canvas.drawPath(mouthPath, Paint()..color = darkMouthColor);

      canvas.save();
      canvas.clipPath(mouthPath);
      canvas.drawRect(
          Rect.fromLTWH(cx - 10 * scale, mouthY - 4 * scale, 20 * scale, 5 * scale),
          Paint()..color = teethColor);
      canvas.restore();

      canvas.drawPath(
          mouthPath,
          Paint()
            ..color = lipColor
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2 * scale);
    } else {
      final lipPath = Path()
        ..moveTo(cx - 12 * scale, mouthY + 1 * scale)
        ..quadraticBezierTo(
            cx, mouthY + 4 * scale, cx + 12 * scale, mouthY + 1 * scale);
      canvas.drawPath(
          lipPath,
          Paint()
            ..color = lipColor
            ..style = PaintingStyle.stroke
            ..strokeWidth = 2.5 * scale
            ..strokeCap = StrokeCap.round);

      final centerLipPath = Path()
        ..moveTo(cx - 10 * scale, mouthY + 1 * scale)
        ..quadraticBezierTo(cx, mouthY + 2 * scale, cx + 10 * scale, mouthY + 1 * scale);
      canvas.drawPath(
          centerLipPath,
          Paint()
            ..color = darkMouthColor
            ..style = PaintingStyle.stroke
            ..strokeWidth = 1 * scale);
    }
  }

  @override
  bool shouldRepaint(covariant _AvatarPainter old) {
    return old.blinkProgress != blinkProgress ||
        old.mouthOpen != mouthOpen ||
        old.eyeWanderX != eyeWanderX ||
        old.eyeWanderY != eyeWanderY ||
        old.browRaise != browRaise ||
        old.avatarState != avatarState;
  }
}
