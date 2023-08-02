import 'package:flutter/material.dart';

class CustomBottomSheetPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.3000000);
    path_0.cubicTo(0,size.height*0.1343144,size.width*0.03685906,0,size.width*0.08232711,0);
    path_0.lineTo(size.width*0.3092086,0);
    path_0.cubicTo(size.width*0.3306301,0,size.width*0.3498924,size.height*0.04752400,size.width*0.3578485,size.height*0.1200000);
    path_0.cubicTo(size.width*0.3658046,size.height*0.1924760,size.width*0.3850670,size.height*0.2400000,size.width*0.4064885,size.height*0.2400000);
    path_0.lineTo(size.width*0.5071350,size.height*0.2400000);
    path_0.lineTo(size.width*0.6056663,size.height*0.2400000);
    path_0.cubicTo(size.width*0.6288474,size.height*0.2400000,size.width*0.6501899,size.height*0.1940152,size.width*0.6613611,size.height*0.1200000);
    path_0.cubicTo(size.width*0.6725324,size.height*0.04598480,size.width*0.6938749,0,size.width*0.7170560,0);
    path_0.lineTo(size.width*0.9176729,0);
    path_0.cubicTo(size.width*0.9631405,0,size.width,size.height*0.1343144,size.width,size.height*0.3000000);
    path_0.lineTo(size.width,size.height*0.7000000);
    path_0.cubicTo(size.width,size.height*0.8656840,size.width*0.9631405,size.height,size.width*0.9176729,size.height);
    path_0.lineTo(size.width*0.08232711,size.height);
    path_0.cubicTo(size.width*0.03685917,size.height,0,size.height*0.8656840,0,size.height*0.7000000);
    path_0.lineTo(0,size.height*0.3000000);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Colors.black.withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(size.width*0.6174226,0);
    path_1.lineTo(size.width*0.4078244,0);
    path_1.cubicTo(size.width*0.4050790,0,size.width*0.4028540,size.height*0.01074516,size.width*0.4028540,size.height*0.02400000);
    path_1.cubicTo(size.width*0.4028540,size.height*0.03725484,size.width*0.4050790,size.height*0.04800000,size.width*0.4078244,size.height*0.04800000);
    path_1.lineTo(size.width*0.6174226,size.height*0.04800000);
    path_1.cubicTo(size.width*0.6201679,size.height*0.04800000,size.width*0.6223930,size.height*0.03725484,size.width*0.6223930,size.height*0.02400000);
    path_1.cubicTo(size.width*0.6223930,size.height*0.01074516,size.width*0.6201679,0,size.width*0.6174226,0);
    path_1.close();

    Paint paint_1_fill = Paint()..style=PaintingStyle.fill;
    paint_1_fill.color = Color(0xffBDB7B7).withOpacity(1.0);
    canvas.drawPath(path_1,paint_1_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}