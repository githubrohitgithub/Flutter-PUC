import 'dart:math';
import 'package:flutter/material.dart';

class AppUtils {



  static String fontOriginalSurfer = 'OriginalSurfer';
  static String fontPacifico = 'Pacifico';
  static String fontChunkFivePrint = 'Chunk Five Print';


  static bool isTablet(double width) {
    // Define a threshold to distinguish between tablets and phones
    const double tabletThreshold = 600.0;
    return width >= tabletThreshold;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static void paintNumbersClock(
      Canvas canvas, Size size, double fontSize, bool isTab) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    const int numHours = 12;

    final double finalFontSize = fontSize;

    const double angleIncrement = 360 / numHours;
    var textStyle = TextStyle(
      color: Colors.black,
      fontSize: finalFontSize,
      fontWeight: FontWeight.normal,
        fontFamily: fontOriginalSurfer
    );

    double radius = min(centerX, centerY) - (isTab ? 120 : 70);
    double outerRadius = radius - (radius / 15);

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

    Paint hourDotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    var radiusFactor = 0.75;
    var dotSize = isTab ? 2.0 : 1.0;

    for (int i = 0; i < 360; i += 6) {
      double x = centerX - outerRadius * radiusFactor * cos(i * pi / 180);
      double y = centerY - outerRadius * radiusFactor * sin(i * pi / 180);
      canvas.drawCircle(Offset(x, y), dotSize, hourDotPaint);
    }
  }

  static void paintWeeksClock(
      Canvas canvas, Size size, double fontSize, int? week, bool isTab) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    List<String> listOfWeeks = [
      'MON',
      'TUE',
      'WED',
      'THU',
      'FRI',
      'SAT',
      'SUN',
    ];

    final double finalFontSize = fontSize;

    double angleIncrement = 360 / listOfWeeks.length;


    var radFactor = isTab ? 6 : 6;

    double radius = min(centerX, centerY);
    double outerRadius = radius - (radius / radFactor);
    double innerRadius = radius - (radius / 5);

    // Draw transparent circle
    final double circleRadius = (outerRadius + innerRadius) / 2;
    final Paint transparentPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX, centerY), circleRadius, transparentPaint);

    for (int i = 0; i < listOfWeeks.length; i++) {
      final double angle = (-90 + i * angleIncrement) * pi / 180;
      final double x = centerX + (outerRadius - 10 - fontSize) * cos(angle);
      final double y = centerY + (outerRadius - 10 - fontSize) * sin(angle);

      var textStyle = TextStyle(
        color: i + 1 == week ? Colors.red : Colors.black,
        fontSize: i + 1 == week?finalFontSize+5:finalFontSize,
        fontWeight: i + 1 == week?FontWeight.bold:FontWeight.normal,
          fontFamily: i +1==week?fontOriginalSurfer:''
      );

      final TextPainter textPainter = TextPainter(
        text: TextSpan(text: listOfWeeks.elementAt(i), style: textStyle),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      final Offset textOffset =
          Offset(x - textPainter.width / 2, y - textPainter.height / 2);

      textPainter.paint(canvas, textOffset);
    }
  }

  static void paintMonthsClock(
      Canvas canvas, Size size, double fontSize, int? month, bool isTab) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    List<String> listOfWeeks = [
      'JAN',
      'FEB',
      'MAR',
      'APR',
      'MAY',
      'JUN',
      'JUL',
      'AUG',
      'SEP',
      'OCT',
      'NOV',
      'DEC'
    ];

    final double finalFontSize = fontSize;

    double angleIncrement = 360 / listOfWeeks.length;

    double radius = min(centerX, centerY);

    var radFactor = isTab ? 80 : 200;

    double outerRadius = radius - (radius / radFactor);
    double innerRadius = radius - (radius );

    // Draw transparent circle
    final double circleRadius = (outerRadius + innerRadius) / 2;
    final Paint transparentPaint = Paint()
      ..color = Colors.transparent
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(centerX, centerY), circleRadius, transparentPaint);

    for (int i = 0; i < listOfWeeks.length; i++) {
      final double angle = (-90 + i * angleIncrement) * pi / 180;
      final double x = centerX + (outerRadius - 10 - fontSize) * cos(angle);
      final double y = centerY + (outerRadius - 10 - fontSize) * sin(angle);

      var textStyle = TextStyle(
        color: i + 1 == month ? Colors.red : Colors.black,
        fontSize: i + 1 == month?finalFontSize+5:finalFontSize,
          fontWeight: i + 1 == month?FontWeight.bold:FontWeight.normal,
          fontFamily: i +1==month?fontOriginalSurfer:''
      );

      final TextPainter textPainter = TextPainter(
        text: TextSpan(text: listOfWeeks.elementAt(i), style: textStyle),
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      final Offset textOffset =
          Offset(x - textPainter.width / 2, y - textPainter.height / 2);

      textPainter.paint(canvas, textOffset);
    }
  }
}
