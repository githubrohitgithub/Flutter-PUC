import 'package:flutter/material.dart';

class AnimatedRightToLeftWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;

  AnimatedRightToLeftWidget({required this.child, required this.duration});

  @override
  _AnimatedRightToLeftWidgetState createState() => _AnimatedRightToLeftWidgetState();
}

class _AnimatedRightToLeftWidgetState extends State<AnimatedRightToLeftWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _offsetAnimation = Tween<Offset>(
      begin: Offset(1.0, 0), // Start from the right of the screen
      end: Offset.zero, // End at the original position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: widget.child,
    );
  }
}