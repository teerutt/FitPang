import 'package:flutter/material.dart';
import 'dart:math';

class GradientCircularProgressIndicator extends StatelessWidget {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;
  final double value;
  final Color? backgroundColor;

  GradientCircularProgressIndicator({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
    required this.value,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: _GradientCircularProgressPainter(
        strokeWidth: strokeWidth,
        radius: radius,
        gradient: gradient,
        value: value,
      ),
    );
  }
}

class _GradientCircularProgressPainter extends CustomPainter {
  final double strokeWidth;
  final double radius;
  final Gradient gradient;
  final double value;
  final Color? backgroundColor;

  _GradientCircularProgressPainter({
    required this.strokeWidth,
    required this.radius,
    required this.gradient,
    required this.value,
    this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (backgroundColor != null) {
      final backgroundPaint = Paint()
        ..color = backgroundColor!
        ..style = PaintingStyle.fill;
      canvas.drawCircle(
        size.center(Offset.zero),
        radius,
        backgroundPaint,
      );
    }

    final Rect rect = Rect.fromCircle(center: size.center(Offset.zero), radius: radius);
    final paint = Paint()
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..shader = gradient.createShader(rect);

    // Adjust the start and end angles according to the value (0.0 to 1.0)
    final double startAngle = -pi / 2;
    final double endAngle = startAngle + value * 2 * pi;

    canvas.drawArc(rect, startAngle, endAngle - startAngle, false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}