
import 'package:flutter/material.dart';

class BottomAlertPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = Colors.white.withOpacity(0.2);
    path = Path();
    path.lineTo(0, size.height * 0.3);
    path.cubicTo(0, size.height * 0.13, size.width * 0.04, 0, size.width * 0.09, 0);
    path.cubicTo(size.width * 0.09, 0, size.width * 0.36, 0, size.width * 0.36, 0);
    path.cubicTo(size.width * 0.38, 0, size.width * 0.39, size.height * 0.02, size.width * 0.4, size.height * 0.06);
    path.cubicTo(size.width * 0.4, size.height * 0.06, size.width * 0.4, size.height * 0.06, size.width * 0.4, size.height * 0.06);
    path.cubicTo(size.width * 0.4, size.height * 0.1, size.width * 0.41, size.height * 0.13, size.width * 0.43, size.height * 0.13);
    path.cubicTo(size.width * 0.43, size.height * 0.13, size.width * 0.59, size.height * 0.13, size.width * 0.59, size.height * 0.13);
    path.cubicTo(size.width * 0.6, size.height * 0.13, size.width * 0.61, size.height * 0.1, size.width * 0.62, size.height * 0.06);
    path.cubicTo(size.width * 0.62, size.height * 0.06, size.width * 0.62, size.height * 0.06, size.width * 0.62, size.height * 0.06);
    path.cubicTo(size.width * 0.63, size.height * 0.02, size.width * 0.64, 0, size.width * 0.65, 0);
    path.cubicTo(size.width * 0.65, 0, size.width * 0.91, 0, size.width * 0.91, 0);
    path.cubicTo(size.width * 0.96, 0, size.width, size.height * 0.13, size.width, size.height * 0.3);
    path.cubicTo(size.width, size.height * 0.3, size.width, size.height * 0.7, size.width, size.height * 0.7);
    path.cubicTo(size.width, size.height * 0.87, size.width * 0.96, size.height, size.width * 0.91, size.height);
    path.cubicTo(size.width * 0.91, size.height, size.width * 0.09, size.height, size.width * 0.09, size.height);
    path.cubicTo(size.width * 0.04, size.height, 0, size.height * 0.87, 0, size.height * 0.7);
    path.cubicTo(0, size.height * 0.7, 0, size.height * 0.3, 0, size.height * 0.3);
    path.cubicTo(0, size.height * 0.3, 0, size.height * 0.3, 0, size.height * 0.3);
    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}