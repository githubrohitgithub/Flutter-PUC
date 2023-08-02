import 'package:flutter/material.dart';
import 'dart:ui';

class GlassContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  final Color? color; // Make the color parameter optional
  final double? boxRadius; // Make the color parameter optional
  final VoidCallback? onTap;

  const GlassContainer({
    Key? key,
    required this.width,
    required this.height,
    required this.child,
    this.color, // Mark the color parameter as optional
    this.boxRadius, // Mark the color parameter as optional
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(boxRadius ?? 30),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: color ?? Colors.white.withOpacity(0.2), // Use Colors.white.withOpacity(0.2) if color is not provided
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}