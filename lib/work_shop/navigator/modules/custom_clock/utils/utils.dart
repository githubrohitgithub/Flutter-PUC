import 'dart:math';
import 'package:flutter/material.dart';

class AppUtils {



 static bool isTablet(double width) {
    // Define a threshold to distinguish between tablets and phones
    const double tabletThreshold = 600.0;
    return width >= tabletThreshold;
  }

 static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }



  static void paintNumbersClock(Canvas canvas, Size size, double fontSize,bool isTab) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    const int numHours = 12;

    final double finalFontSize = fontSize;

    const double angleIncrement = 360 / numHours;
    var textStyle = TextStyle(
      color: Colors.black,
      fontSize: finalFontSize,
      fontWeight: FontWeight.bold,
    );

    double radius = min(centerX, centerY)-(isTab?120:70);
    double outerRadius = radius - (radius / 15);
    double innerRadius = radius - (radius / 5);
    Paint hourDashPaint = Paint()
      ..color =  Colors.black
      ..strokeWidth = isTab?2:1
      ..strokeCap = StrokeCap.round;

    for (int i = 1; i <= numHours; i++) {
      final double angle = (-90 + i * angleIncrement) *
          pi /
          180; // Rotate numbers 90 degrees clockwise
      final double x = centerX + (outerRadius + 15 - fontSize) * cos(angle);
      final double y = centerY + (outerRadius + 15 - fontSize) * sin(angle);

      final TextSpan span = TextSpan(text: i.toString(), style: textStyle);

      final TextPainter textPainter = TextPainter(
        text: span,
        textDirection:
            TextDirection.ltr, // Use TextDirection.ltr for left-to-right text
      );

      textPainter.layout();
      final Offset textOffset =
          Offset(x - textPainter.width / 2, y - textPainter.height / 2);

      textPainter.paint(canvas, textOffset);
    }

    for (int i = 0; i < 360; i += 6) {
      double x1 = centerX - outerRadius * .85 * cos(i * pi / 180);
      double y1 = centerY - outerRadius * .85 * sin(i * pi / 180);
      double x2 = centerX - innerRadius * cos(i * pi / 180);
      double y2 = centerY - innerRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), hourDashPaint);
    }
  }


  static void paintWeeksClock(Canvas canvas, Size size, double fontSize,int? week,bool isTab) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    List<String> listOfWeeks = ['MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY','FRIDAY', 'SATURDAY', 'SUNDAY', ];

    final double finalFontSize = fontSize;

    double angleIncrement = 360 / listOfWeeks.length;


    double radius = min(centerX, centerY);
    double outerRadius = radius - (radius / 15);
    double innerRadius = radius - (radius / 5);

    // Draw transparent circle
    final double circleRadius = (outerRadius + innerRadius) / 2;
    final Paint transparentPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX, centerY), circleRadius, transparentPaint);

    for (int i = 0; i < listOfWeeks.length; i++) {
      final double angle = (-90 + i * angleIncrement) * pi / 180;
      final double x = centerX + (outerRadius-10 - fontSize) * cos(angle);
      final double y = centerY + (outerRadius-10 - fontSize) * sin(angle);


     var textStyle= TextStyle(
        color: i+1==week?Colors.red:Colors.black,
        fontSize: finalFontSize,
        fontWeight: FontWeight.bold,
      );

      final TextPainter textPainter = TextPainter(
        text: TextSpan(text: listOfWeeks.elementAt(i), style: textStyle),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      final Offset textOffset = Offset(x - textPainter.width / 2, y - textPainter.height / 2);

      textPainter.paint(canvas, textOffset);
    }
  }
}