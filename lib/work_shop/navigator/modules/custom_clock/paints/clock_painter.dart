import 'dart:math';
import 'package:flutter/material.dart';

import '../model/time_model.dart';
import '../utils/utils.dart';

class ClockPainter extends CustomPainter {
  ///time parameters
  TimeModel? time;
  Orientation orientation;
  BuildContext context;

  ClockPainter({this.time, required this.orientation, required this.context});

  DateTime currentTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    ///calculate the time position


    final screenWidth = AppUtils.getScreenWidth(context);
    //create for secRad
    double secRad = ((pi / 2) -
            (pi / 30) * (time!.seconds! + (time!.milliseconds! / 1000))) %
        (2 * pi);
    double minRad =
        ((pi / 2) - (pi / 30) * (time!.minutes! + (time!.seconds! / 60))) %
            (2 * pi);
    double hourRad =
        ((pi / 2) - (pi / 6) * (time!.hours! + (time!.minutes! / 60))) %
            (2 * pi);

    ///setting the some important pointers coordinates
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    var weekFontSize = 8;
    var numberFontSize = 8;
    var setMinHeight = 2;
    var setSecHeight = 1.8;
    var setHourHeight = 2;

    if (AppUtils.isTablet(screenWidth)) {
      weekFontSize = 18;
      numberFontSize = 18;
    } else {
      weekFontSize = 8;
      numberFontSize = 12;

      setMinHeight = 4;
      setSecHeight = 3;
      setHourHeight = 5;
    }

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

    AppUtils.paintWeeksClock(
        canvas, size, weekFontSize.toDouble(), time?.week!);
    AppUtils.paintNumbersClock(canvas, size, numberFontSize.toDouble());

    var centerDotBrush = Paint()..color = const Color(0xFF030000);

    canvas.drawCircle(
        center, orientation == Orientation.landscape ? 12 : 6, centerDotBrush);

    ///setting the brush for the clock pointers

    var secBrush = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = orientation == Orientation.landscape ? 2 : 1
      ..strokeCap = StrokeCap.round
      ..shader = const RadialGradient(colors: [
        Color(0xFF030000),
        Color(0xFF030000),
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeJoin = StrokeJoin.round;

    var minBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = orientation == Orientation.landscape ? 4 : 2
      ..strokeCap = StrokeCap.round
      ..shader = const RadialGradient(colors: [
        Color(0xFF030000),
        Color(0xFF030000),
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeJoin = StrokeJoin.round;

    var hourBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = orientation == Orientation.landscape ? 8 : 4
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
