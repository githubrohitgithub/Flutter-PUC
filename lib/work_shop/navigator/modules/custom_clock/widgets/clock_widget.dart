import 'dart:math';

import 'package:flutter/material.dart';

import '../model/time_model.dart';
import '../paints/clock_painter.dart';
import '../utils/utils.dart';

class ClockWidget extends StatefulWidget {
  final TimeModel time;

  const ClockWidget({super.key, required this.time});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

   var isTab = AppUtils.isTablet(AppUtils.getScreenWidth(context));

   var innerRad = isTab ? 4 : 2;

    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return SizedBox(
          width: screenWidth / 1.2,
          height: screenHeight / 1.2,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: screenWidth / 0.5,
                height: screenHeight / 0.5,
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
                      blurRadius: 16,
                      offset: const Offset(10, 5),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 16,
                      offset: const Offset(-10, -5),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth / innerRad,
                height: screenHeight / 1,
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
                      blurRadius: 16,
                      offset: const Offset(10, 5),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 3,
                      blurRadius: 16,
                      offset: const Offset(-10, -5),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth / 5,
                height: screenHeight / 3,
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
                      spreadRadius: 3,
                      blurRadius: 16,
                      offset: const Offset(10, 5),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 16,
                      offset: const Offset(-10, -5),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: const BoxConstraints.expand(),
                child: CustomPaint(
                  painter: ClockPainter(context: context,time: widget.time, orientation: orientation),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

void paintDashes(Canvas canvas, int centerX, int centerY, int outerRadius,
    int innerRadius, Paint hourDashPaint) {
  for (int i = 0; i < 360; i += 30) {
    double x1 = centerX + outerRadius * cos(i * pi / 180);
    double y1 = centerY + outerRadius * sin(i * pi / 180);

    double x2 = centerX + innerRadius * cos(i * pi / 180);
    double y2 = centerY + innerRadius * sin(i * pi / 180);

    canvas.drawLine(Offset(x1, y1), Offset(x2, y2), hourDashPaint);
  }
}