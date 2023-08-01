
import 'package:flutter/material.dart';

import '../../base/glass_container.dart';


class CustomCancelButton extends StatelessWidget {
  final Color backgroundColor;
  final Color crossColor;
  final VoidCallback onPressed;

  const CustomCancelButton({super.key,
    required this.backgroundColor,
    required this.crossColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(25.0),
      child: GlassContainer(
        width: 50.0,
        height: 50.0,
        child: Icon(Icons.close, color: crossColor),

      ),
    );
  }
}