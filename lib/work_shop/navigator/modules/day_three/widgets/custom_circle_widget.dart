import 'package:flutter/cupertino.dart';

class CircleWithText extends StatelessWidget {
  final Widget centerWidget;
  final double radius;
  final Color backgroundColor;
  final Color textColor;

  const CircleWithText({
    super.key,
    required this.centerWidget,
    required this.radius,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius * 2,
      height: radius * 2,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Center(
        child: centerWidget,
      ),
    );
  }
}