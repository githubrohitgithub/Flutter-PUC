import 'package:flutter/material.dart';

import '../../base/glass_container.dart';

class CustomSwitchButton extends StatefulWidget {
  final bool initialValue;
  final Function(bool) onChanged;
  final IconData activeIcon;
  final IconData inactiveIcon;

  const CustomSwitchButton({super.key,
    required this.initialValue,
    required this.onChanged,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  @override
  CustomSwitchButtonState createState() => CustomSwitchButtonState();
}

class CustomSwitchButtonState extends State<CustomSwitchButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  bool _isSwitched = false;

  @override
  void initState() {
    super.initState();
    _isSwitched = widget.initialValue;

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    if (_isSwitched) _animationController.forward();
  }

  void _toggleSwitch(bool newValue) {
    setState(() {
      _isSwitched = newValue;
      _isSwitched
          ? _animationController.forward()
          : _animationController.reverse();
      widget.onChanged(_isSwitched);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _toggleSwitch(!_isSwitched),
      child: GlassContainer(
        width: 110,
        height: 60,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: _isSwitched ? 50 : 0,
              right: _isSwitched ? 0 : 50,
              child: SizedBox(
                width: 60,
                height: 60,
                child: Icon(
                    _isSwitched ? widget.activeIcon : widget.inactiveIcon,
                    color: Colors.grey),
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              left: _isSwitched ? 0 : 50,
              right: _isSwitched ? 50 : 0,
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white38,
                ),
                child: Icon(
                    _isSwitched ? widget.inactiveIcon : widget.activeIcon,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}