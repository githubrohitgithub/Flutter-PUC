
import 'package:flutter/material.dart';

class CurvedBorderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final double cornerRadius = 20;

    final Offset p1 = Offset(cornerRadius, 0);
    final Offset p2 = Offset(size.width - cornerRadius, 0);
    final Offset p3 = Offset(size.width, cornerRadius);
    final Offset p4 = Offset(size.width, size.height - cornerRadius);
    final Offset p5 = Offset(size.width - cornerRadius, size.height);
    final Offset p6 = Offset(cornerRadius, size.height);
    final Offset p7 = Offset(0, size.height - cornerRadius);
    final Offset p8 = Offset(0, cornerRadius);

    final Path path = Path()
      ..moveTo(p1.dx, p1.dy)
      ..quadraticBezierTo(p1.dx, p1.dy, p2.dx, p2.dy)
      ..quadraticBezierTo(p2.dx, p2.dy, p3.dx, p3.dy)
      ..quadraticBezierTo(p3.dx, p3.dy, p4.dx, p4.dy)
      ..quadraticBezierTo(p4.dx, p4.dy, p5.dx, p5.dy)
      ..quadraticBezierTo(p5.dx, p5.dy, p6.dx, p6.dy)
      ..quadraticBezierTo(p6.dx, p6.dy, p7.dx, p7.dy)
      ..quadraticBezierTo(p7.dx, p7.dy, p8.dx, p8.dy)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}