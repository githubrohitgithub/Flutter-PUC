import 'package:flutter/material.dart';

class OverlappingCirclesWidget extends StatelessWidget {
  
  
  final List<Widget> listOfWidgets;
  
  
  const OverlappingCirclesWidget({super.key, required this.listOfWidgets});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 60,
      width: 120,
      child: Stack(
        children: [
          Positioned(
            left:10,
            child: listOfWidgets[0],
          ),
          Positioned(
            left: 35,
            child: listOfWidgets[1],
          ),
          Positioned(
            left: 60,
            child: listOfWidgets[2],)
        ],
      ),
    );
  }
}
