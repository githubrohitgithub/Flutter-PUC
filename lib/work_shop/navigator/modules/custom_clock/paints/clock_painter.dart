import 'dart:math';
import 'package:flutter/material.dart';

import '../model/time_model.dart';
import '../utils/utils.dart';

class ClockPainter extends CustomPainter {
  ///time parameters
  TimeModel? time;
  bool isTab;
  BuildContext context;

  ClockPainter({this.time, required this.isTab, required this.context});

  DateTime currentTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    ///calculate the time position

    final screenWidth = AppUtils.getScreenWidth(context);
    //create for secRad
    // double secRad = ((pi / 2) -
    //         (pi / 30) * (time!.seconds! + (time!.milliseconds! / 1000))) %
    //     (2 * pi);
    // double minRad =
    //     ((pi / 2) - (pi / 30) * (time!.minutes! + (time!.seconds! / 60))) %
    //         (2 * pi);
    // double hourRad = ((pi / 2) - (pi / 6) * (time!.hours! + (time!.minutes! / 60))) % (2 * pi);

    //calculate hour needle radians
    double hourRad = ((pi / 2) -
            (pi / 6) *
                (time!.hours! +
                    (time!.minutes! / 60) +
                    (time!.seconds! / 3600))) %
        (2 * pi);

    //calculate minute needle radians
    double minRad = ((pi / 2) -
            (pi / 30) * (time!.minutes! + (time!.seconds! / 60))) %
        (2 * pi);

    //calculate second needle radians
    double secRad = ((pi / 2) -
            (pi / 30) * (time!.seconds! + (time!.milliseconds! / 1000))) %
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
    var setHourHeight = 3;

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
        canvas, size, weekFontSize.toDouble(), time?.week!,isTab);
    AppUtils.paintNumbersClock(canvas, size, numberFontSize.toDouble(),isTab);


    ///setting the brush for the clock pointers

    var secBrush = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = isTab ? 2 : 1
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    var minBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = isTab ? 4 : 2
      ..strokeCap = StrokeCap.round
      ..shader = const RadialGradient(colors: [
        Color(0xFF030000),
        Color(0xFF030000),
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeJoin = StrokeJoin.round;

    var hourBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = isTab ? 8 : 4
      ..strokeCap = StrokeCap.round
      ..shader = const RadialGradient(colors: [
        Color(0xFF030000),
        Color(0xFF030000),
      ]).createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeJoin = StrokeJoin.round;

    ///drawing the clock hands

     canvas.drawLine(center, seconds, secBrush);
     // canvas.drawLine(center, minutes, minBrush);
     // canvas.drawLine(center, hour, hourBrush);


    var secHandleSize = isTab ? const Size(140, 140) : const Size(70, 70);
    var minHandleSize = isTab ? const Size(120, 120) : const Size(50, 50);
    var hourHandleSize = isTab ? const Size(80, 80) : const Size(30, 30);

    //needleHandle(canvas, secHandleSize, secRad, centerX, centerY, Colors.red);
    minNeedleHandle(canvas, minHandleSize, minRad, centerX, centerY, Colors.black);
    minNeedleHandle(canvas, hourHandleSize, hourRad, centerX, centerY, Colors.black);



    var centerDotBrush = Paint()..color = Colors.red;

    canvas.drawCircle(
        center, AppUtils.isTablet(size.width) ? 10 : 4, centerDotBrush);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }


  void minNeedleHandle(Canvas canvas, Size size, double secRad, double centerX,
      double centerY, Color color) {

    Path path_0 = Path();
    path_0.moveTo(0,0);
    path_0.cubicTo(size.width*0.05151515,size.height*0.05151515,size.width*0.1272727,size.height*0.1272727,size.width*0.2666667,size.height*0.1333333);
    path_0.cubicTo(size.width*0.3939394,size.height*0.3939394,size.width*0.7666667,size.height*0.7606061,size.width,size.height);
    path_0.cubicTo(size.width*0.7606061,size.height*0.7666667,size.width*0.3939394,size.height*0.3939394,size.width*0.1363636,size.height*0.2727273);
    path_0.moveTo(size.width*0.1363636,size.height*0.2727273);
    path_0.cubicTo(size.width*0.1272727,size.height*0.1272727,size.width*0.05454545,size.height*0.05454545,0,0);

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = color;


    canvas.save(); // Save the current canvas state
    canvas.translate(centerX, centerY); // Translate the canvas to the desired starting point


    canvas.rotate(-secRad-0.8); // Rotate the canvas by the negative of the desired angle in radians

    canvas.drawPath(path_0, paint_0_fill);

    canvas.restore();
  }

}
