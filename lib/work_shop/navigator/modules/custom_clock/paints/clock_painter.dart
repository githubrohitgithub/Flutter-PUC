import 'dart:math';
import 'package:flutter/material.dart';

import '../model/time_model.dart';
import '../utils/utils.dart';


class ClockPainter extends CustomPainter {
  ///time parameters
  TimeModel? time;
  Orientation orientation;

  ClockPainter({this.time,required this.orientation});

  DateTime currentTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    ///calculate the time position

    double secRad = ((pi / 2) - (pi / 30) * time!.seconds!) % (2 * pi);
    double minRad = ((pi / 2) - (pi / 30) * time!.minutes!) % (2 * pi);
    double hourRad = ((pi / 2) - (pi / 6) * time!.hours!) % (2 * pi);

    ///setting the some important pointers coordinates
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);


    var setMinHeight = orientation==Orientation.landscape?2:4;
    var setSecHeight = orientation==Orientation.landscape?1.8:3.6;
    var setHourHeight = orientation==Orientation.landscape?2:4;

    ///setting the clock coordinates
    var secHeight = radius / setSecHeight;
    var minHeight = radius / setMinHeight;
    var hourHeight = radius / setHourHeight;

    var seconds = Offset(
        centerX + secHeight * cos(secRad), centerY - secHeight * sin(secRad));
    var minutes = Offset(
        centerX + minHeight * cos(minRad), centerY - minHeight * sin(minRad));
    var hour = Offset(centerX + hourHeight * cos(hourRad),
        centerY - hourHeight * sin(hourRad));

    AppUtils.paintWeeksClock(canvas, size, orientation==Orientation.landscape?15:7, time?.week!);
    AppUtils.paintNumbersClock(canvas, size, orientation==Orientation.landscape?20:10);

    var centerDotBrush = Paint()..color = const Color(0xFF030000);

    canvas.drawCircle(center, orientation==Orientation.landscape?12:6, centerDotBrush);

    ///setting the brush for the clock pointers

    var secBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = orientation==Orientation.landscape?2:1
      ..strokeCap = StrokeCap.round
      ..shader = const RadialGradient(colors: [
        Color(0xFF030000),
        Color(0xFF030000),
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeJoin = StrokeJoin.round;

    var minBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = orientation==Orientation.landscape?4:2
      ..strokeCap = StrokeCap.round
      ..shader = const RadialGradient(colors: [
        Color(0xFF030000),
        Color(0xFF030000),
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeJoin = StrokeJoin.round;

    var hourBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = orientation==Orientation.landscape?8:4
      ..strokeCap = StrokeCap.round
      ..shader = const RadialGradient(colors: [
        Color(0xFF030000),
        Color(0xFF030000),
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeJoin = StrokeJoin.round;

    ///drawing the clock hands

    canvas.drawLine(center, seconds, secBrush);
    canvas.drawLine(center, minutes, minBrush);
    canvas.drawLine(center, hour, hourBrush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}