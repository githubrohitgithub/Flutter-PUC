import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class PendulumPainter extends CustomPainter {
  final double length; // Length of the pendulum
  final double angle; // Current angle of the pendulum

  PendulumPainter({required this.length, required this.angle});

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double pivotX = centerX;
    double pivotY = centerY;
    // Calculate the pendulum's bob position
    double bobX = pivotX - length * sin(angle);
    double bobY = pivotY + length * cos(angle);

    // Draw the pendulum rod
    Paint rodPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 8.0;
    canvas.drawLine(Offset(centerX, centerY), Offset(bobX, bobY), rodPaint);

    canvas.drawLine(Offset(pivotX, pivotY), Offset(bobX, bobY), rodPaint);

    // Draw the pendulum bob
    Paint bobPaint = Paint()
      ..shader = RadialGradient(
        center: Alignment.center,
        radius: 1,
        colors: [
          Colors.black, // Outer color
          Colors.black26, // Inner color
        ],
        stops: [0.5, 1.0],
      ).createShader(Rect.fromCircle(center: Offset(bobX, bobY), radius: 20));

    canvas.drawCircle(Offset(bobX, bobY), 30, bobPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
