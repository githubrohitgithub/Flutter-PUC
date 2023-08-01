import 'package:flutter/material.dart';

class CircleDropPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    // Path number 1

    paint.color = Colors.white.withOpacity(0.2);
    path = Path();
    path.lineTo(size.width * 0.63, size.height * 0.1);
    path.cubicTo(size.width * 0.84, size.height * 0.12, size.width,
        size.height / 5, size.width, size.height * 0.3);
    path.cubicTo(size.width, size.height * 0.39, size.width * 0.84,
        size.height * 0.47, size.width * 0.63, size.height / 2);
    path.cubicTo(size.width * 0.58, size.height * 0.51, size.width * 0.55,
        size.height * 0.52, size.width * 0.55, size.height * 0.55);
    path.cubicTo(size.width * 0.55, size.height * 0.57, size.width * 0.58,
        size.height * 0.58, size.width * 0.63, size.height * 0.59);
    path.cubicTo(size.width * 0.84, size.height * 0.62, size.width,
        size.height * 0.7, size.width, size.height * 0.79);
    path.cubicTo(size.width, size.height * 0.91, size.width * 0.78, size.height,
        size.width / 2, size.height);
    path.cubicTo(size.width * 0.22, size.height, 0, size.height * 0.91, 0,
        size.height * 0.79);
    path.cubicTo(0, size.height * 0.7, size.width * 0.16, size.height * 0.62,
        size.width * 0.37, size.height * 0.59);
    path.cubicTo(size.width * 0.42, size.height * 0.58, size.width * 0.45,
        size.height * 0.57, size.width * 0.45, size.height * 0.55);
    path.cubicTo(size.width * 0.45, size.height * 0.52, size.width * 0.42,
        size.height * 0.51, size.width * 0.37, size.height / 2);
    path.cubicTo(size.width * 0.16, size.height * 0.47, 0, size.height * 0.39,
        0, size.height * 0.3);
    path.cubicTo(0, size.height / 5, size.width * 0.16, size.height * 0.12,
        size.width * 0.37, size.height * 0.1);
    path.cubicTo(size.width * 0.42, size.height * 0.09, size.width * 0.45,
        size.height * 0.07, size.width * 0.45, size.height * 0.05);
    path.cubicTo(size.width * 0.45, size.height * 0.03, size.width * 0.42,
        size.height * 0.01, size.width * 0.37, 0);
    path.cubicTo(
        size.width * 0.37, 0, size.width * 0.37, 0, size.width * 0.37, 0);
    path.cubicTo(
        size.width * 0.37, 0, size.width * 0.63, 0, size.width * 0.63, 0);
    path.cubicTo(
        size.width * 0.63, 0, size.width * 0.63, 0, size.width * 0.63, 0);
    path.cubicTo(size.width * 0.58, size.height * 0.01, size.width * 0.55,
        size.height * 0.03, size.width * 0.55, size.height * 0.05);
    path.cubicTo(size.width * 0.55, size.height * 0.07, size.width * 0.58,
        size.height * 0.09, size.width * 0.63, size.height * 0.1);
    path.cubicTo(size.width * 0.63, size.height * 0.1, size.width * 0.63,
        size.height * 0.1, size.width * 0.63, size.height * 0.1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}