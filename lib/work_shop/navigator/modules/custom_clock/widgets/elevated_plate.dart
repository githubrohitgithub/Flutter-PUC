import 'package:flutter/material.dart';

Widget elevatedPlate(double width, double height){

  return  Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: const LinearGradient(
        colors: [
          Color(0xFFECF6FF),
          Color(0xFFCADBEB),
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