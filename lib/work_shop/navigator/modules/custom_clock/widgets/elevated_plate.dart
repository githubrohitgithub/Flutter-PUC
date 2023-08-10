import 'package:flutter/material.dart';

Widget elevatedPlate(double width, double height,Color color1,Color color2){

  return  Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient:  LinearGradient(
        colors: [
         color1,
          color2
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.white.withOpacity(0.5),
          spreadRadius: 6,
          blurRadius: 18,
          offset: const Offset(15, 10),
        ),
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 3,
          blurRadius: 16,
          offset: const Offset(-10, -5),
        ),
      ],
    ),);
}