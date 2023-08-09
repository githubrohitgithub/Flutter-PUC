import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/custom_clock/paints/pendulum_painter.dart';

class PendulumAnimation extends StatefulWidget {
  final double screenHeight;
  final bool isTab;

  const PendulumAnimation(this.screenHeight, {super.key, required this.isTab});

  @override
  PendulumAnimationState createState() => PendulumAnimationState();
}

class PendulumAnimationState extends State<PendulumAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _angleAnimation;
  final double _amplitude = pi / 6; // Maximum angle of oscillation

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _angleAnimation =
        Tween<double>(begin: -_amplitude, end: _amplitude).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var pendulumHeightRatio = widget.isTab ?1.9 : 3.1;

    return AnimatedBuilder(
      animation: _angleAnimation,
      builder: (context, child) {
        var pendulumHeight = widget.screenHeight / pendulumHeightRatio;

        return CustomPaint(
          painter: PendulumPainter(
            length: pendulumHeight,
            angle: _angleAnimation.value,
          ),
        );
      },
    );
  }
}
