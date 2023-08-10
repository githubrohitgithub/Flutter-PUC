import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/custom_clock/paints/smartq_logo_paint.dart';

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
    //calculate hour needle radians
    double hourRad = ((pi / 2) -
            (pi / 6) *
                (time!.hours! +
                    (time!.minutes! / 60) +
                    (time!.seconds! / 3600))) %
        (2 * pi);

    //calculate minute needle radians
    double minRad =
        ((pi / 2) - (pi / 30) * (time!.minutes! + (time!.seconds! / 60))) %
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
      numberFontSize = 28;
    } else {
      weekFontSize = 8;
      numberFontSize = 14;

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
        canvas, size, weekFontSize.toDouble(), time?.week!, isTab);
    AppUtils.paintNumbersClock(canvas, size, numberFontSize.toDouble(), isTab);


    AppUtils.paintMonthsClock(canvas, size, weekFontSize.toDouble(),time?.month, isTab);


    ///setting the brush for the clock pointers

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

    var secBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = isTab ? 2 : 1
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
    canvas.drawLine(center, seconds, secBrush);
    // canvas.drawLine(center, minutes, minBrush);
    // canvas.drawLine(center, hour, hourBrush);

    var secHandleSize = isTab ? const Size(140, 140) : const Size(70, 80);
    var minHandleSize = isTab ? const Size(100, 110) : const Size(45, 55);
    var hourHandleSize = isTab ? const Size(70, 80) : const Size(30, 40);

    //needleHandle(canvas, secHandleSize, secRad, centerX, centerY, Colors.red);
    // commonNeedleHandle(
    //     canvas, minHandleSize, minRad, centerX, centerY, Colors.black);
    // commonNeedleHandle(
    //     canvas, hourHandleSize, hourRad, centerX, centerY, Colors.black);

    customNeedleHandle(
        canvas, minHandleSize, minRad + 0.8, centerX, centerY, Colors.black);
    customNeedleHandle(
        canvas, hourHandleSize, hourRad + 0.8, centerX, centerY, Colors.black);

    var centerDotBrush = Paint()..color = Colors.black;

    canvas.drawCircle(
        center, AppUtils.isTablet(size.width) ? 8 : 3, centerDotBrush);


  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void commonNeedleHandle(Canvas canvas, Size size, double secRad,
      double centerX, double centerY, Color color) {
    Path path_0 = Path();
    path_0.moveTo(0, 0);
    path_0.cubicTo(
        size.width * 0.05151515,
        size.height * 0.05151515,
        size.width * 0.1272727,
        size.height * 0.1272727,
        size.width * 0.2666667,
        size.height * 0.1333333);
    path_0.cubicTo(
        size.width * 0.3939394,
        size.height * 0.3939394,
        size.width * 0.7666667,
        size.height * 0.7606061,
        size.width,
        size.height);
    path_0.cubicTo(
        size.width * 0.7606061,
        size.height * 0.7666667,
        size.width * 0.3939394,
        size.height * 0.3939394,
        size.width * 0.1363636,
        size.height * 0.2727273);
    path_0.moveTo(size.width * 0.1363636, size.height * 0.2727273);
    path_0.cubicTo(size.width * 0.1272727, size.height * 0.1272727,
        size.width * 0.05454545, size.height * 0.05454545, 0, 0);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color;

    canvas.save(); // Save the current canvas state
    canvas.translate(
        centerX, centerY); // Translate the canvas to the desired starting point

    canvas.rotate(-secRad -
        0.8); // Rotate the canvas by the negative of the desired angle in radians

    canvas.drawPath(path_0, paint_0_fill);

    canvas.restore();
  }

  void customNeedleHandle(Canvas canvas, Size size, double radAngle,
      double centerX, double centerY, Color color) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.9919203, size.height * 0.9857015);
    path_0.cubicTo(
        size.width * 0.9962717,
        size.height * 0.9900765,
        size.width * 0.9996630,
        size.height * 0.9946505,
        size.width * 0.9993514,
        size.height * 0.9958903);
    path_0.cubicTo(
        size.width * 0.9977754,
        size.height * 1.001286,
        size.width * 0.9905761,
        size.height * 0.9983138,
        size.width * 0.9761558,
        size.height * 0.9861403);
    path_0.cubicTo(
        size.width * 0.9470580,
        size.height * 0.9619235,
        size.width * 0.9130145,
        size.height * 0.9447577,
        size.width * 0.8751667,
        size.height * 0.9346276);
    path_0.cubicTo(
        size.width * 0.8657971,
        size.height * 0.9321862,
        size.width * 0.8381993,
        size.height * 0.9273214,
        size.width * 0.8137101,
        size.height * 0.9236429);
    path_0.cubicTo(
        size.width * 0.7564493,
        size.height * 0.9149362,
        size.width * 0.7431449,
        size.height * 0.9100893,
        size.width * 0.7237536,
        size.height * 0.8905918);
    path_0.cubicTo(
        size.width * 0.7045399,
        size.height * 0.8712730,
        size.width * 0.6999312,
        size.height * 0.8615969,
        size.width * 0.7032174,
        size.height * 0.8466684);
    path_0.cubicTo(
        size.width * 0.7053877,
        size.height * 0.8352781,
        size.width * 0.7066558,
        size.height * 0.8338367,
        size.width * 0.7214601,
        size.height * 0.8254515);
    path_0.cubicTo(
        size.width * 0.7391920,
        size.height * 0.8153546,
        size.width * 0.7503478,
        size.height * 0.8133852,
        size.width * 0.7693732,
        size.height * 0.8162245);
    path_0.cubicTo(
        size.width * 0.7794167,
        size.height * 0.8177908,
        size.width * 0.7821884,
        size.height * 0.8194133,
        size.width * 0.7945109,
        size.height * 0.8318061);
    path_0.cubicTo(
        size.width * 0.8018659,
        size.height * 0.8395867,
        size.width * 0.8121196,
        size.height * 0.8502857,
        size.width * 0.8164928,
        size.height * 0.8554617);
    path_0.cubicTo(
        size.width * 0.8210507,
        size.height * 0.8608189,
        size.width * 0.8302681,
        size.height * 0.8693112,
        size.width * 0.8371014,
        size.height * 0.8746327);
    path_0.cubicTo(
        size.width * 0.8469928,
        size.height * 0.8822500,
        size.width * 0.8487283,
        size.height * 0.8843827,
        size.width * 0.8456196,
        size.height * 0.8859133);
    path_0.cubicTo(
        size.width * 0.8435507,
        size.height * 0.8869337,
        size.width * 0.8384493,
        size.height * 0.8864592,
        size.width * 0.8345435,
        size.height * 0.8848571);
    path_0.cubicTo(
        size.width * 0.8218297,
        size.height * 0.8794439,
        size.width * 0.7969275,
        size.height * 0.8765128,
        size.width * 0.7820978,
        size.height * 0.8786658);
    path_0.cubicTo(
        size.width * 0.7743297,
        size.height * 0.8797781,
        size.width * 0.7670580,
        size.height * 0.8798342,
        size.width * 0.7661522,
        size.height * 0.8789209);
    path_0.cubicTo(
        size.width * 0.7652428,
        size.height * 0.8780102,
        size.width * 0.7671594,
        size.height * 0.8721786,
        size.width * 0.7704710,
        size.height * 0.8661990);
    path_0.cubicTo(
        size.width * 0.7774819,
        size.height * 0.8526939,
        size.width * 0.7767826,
        size.height * 0.8500510,
        size.width * 0.7646957,
        size.height * 0.8448776);
    path_0.cubicTo(
        size.width * 0.7518804,
        size.height * 0.8389719,
        size.width * 0.7396123,
        size.height * 0.8444770,
        size.width * 0.7372065,
        size.height * 0.8567985);
    path_0.cubicTo(
        size.width * 0.7364312,
        size.height * 0.8626122,
        size.width * 0.7382174,
        size.height * 0.8663495,
        size.width * 0.7465543,
        size.height * 0.8747321);
    path_0.cubicTo(
        size.width * 0.7596051,
        size.height * 0.8878520,
        size.width * 0.7730652,
        size.height * 0.8920791,
        size.width * 0.8258225,
        size.height * 0.8997474);
    path_0.cubicTo(
        size.width * 0.8470471,
        size.height * 0.9028622,
        size.width * 0.8701377,
        size.height * 0.9066888,
        size.width * 0.8777246,
        size.height * 0.9081097);
    path_0.lineTo(size.width * 0.8911341, size.height * 0.9107321);
    path_0.lineTo(size.width * 0.8263297, size.height * 0.8478954);
    path_0.cubicTo(
        size.width * 0.7361014,
        size.height * 0.7606582,
        size.width * 0.6747391,
        size.height * 0.7040000,
        size.width * 0.5838659,
        size.height * 0.6238724);
    path_0.cubicTo(
        size.width * 0.5409130,
        size.height * 0.5861122,
        size.width * 0.4855580,
        size.height * 0.5362704,
        size.width * 0.4606268,
        size.height * 0.5135281);
    path_0.cubicTo(
        size.width * 0.3525601,
        size.height * 0.4141709,
        size.width * 0.1567453,
        size.height * 0.2095158,
        size.width * 0.01926112,
        size.height * 0.05187755);
    path_0.lineTo(size.width * 0.002043123, size.height * 0.03184923);
    path_0.lineTo(size.width * 0.008169420, size.height * 0.002041508);
    path_0.lineTo(size.width * 0.04671739, size.height * 0.009281480);
    path_0.lineTo(size.width * 0.06792138, size.height * 0.02788776);
    path_0.cubicTo(
        size.width * 0.2314703,
        size.height * 0.1729480,
        size.width * 0.4361884,
        size.height * 0.3710408,
        size.width * 0.5340072,
        size.height * 0.4787092);
    path_0.cubicTo(
        size.width * 0.5563768,
        size.height * 0.5035306,
        size.width * 0.6043261,
        size.height * 0.5575638,
        size.width * 0.6400326,
        size.height * 0.5988980);
    path_0.cubicTo(
        size.width * 0.7115181,
        size.height * 0.6812526,
        size.width * 0.7693333,
        size.height * 0.7448163,
        size.width * 0.8579855,
        size.height * 0.8374490);
    path_0.lineTo(size.width * 0.9158007, size.height * 0.8982985);
    path_0.lineTo(size.width * 0.9172717, size.height * 0.8869821);
    path_0.cubicTo(
        size.width * 0.9183841,
        size.height * 0.8807296,
        size.width * 0.9214891,
        size.height * 0.8629056,
        size.width * 0.9246703,
        size.height * 0.8474847);
    path_0.cubicTo(
        size.width * 0.9275906,
        size.height * 0.8321939,
        size.width * 0.9292174,
        size.height * 0.8148240,
        size.width * 0.9277174,
        size.height * 0.8090459);
    path_0.cubicTo(
        size.width * 0.9243478,
        size.height * 0.7944133,
        size.width * 0.9103152,
        size.height * 0.7806888,
        size.width * 0.8960254,
        size.height * 0.7779566);
    path_0.cubicTo(
        size.width * 0.8758333,
        size.height * 0.7743316,
        size.width * 0.8634384,
        size.height * 0.7866913,
        size.width * 0.8750362,
        size.height * 0.7983546);
    path_0.cubicTo(
        size.width * 0.8790217,
        size.height * 0.8023622,
        size.width * 0.8839674,
        size.height * 0.8034566,
        size.width * 0.8973768,
        size.height * 0.8033648);
    path_0.cubicTo(
        size.width * 0.9069275,
        size.height * 0.8032704,
        size.width * 0.9153659,
        size.height * 0.8040000,
        size.width * 0.9162717,
        size.height * 0.8049107);
    path_0.cubicTo(
        size.width * 0.9171812,
        size.height * 0.8058214,
        size.width * 0.9146159,
        size.height * 0.8106148,
        size.width * 0.9102174,
        size.height * 0.8155000);
    path_0.cubicTo(
        size.width * 0.9025326,
        size.height * 0.8244490,
        size.width * 0.8979275,
        size.height * 0.8419286,
        size.width * 0.9008043,
        size.height * 0.8521888);
    path_0.cubicTo(
        size.width * 0.9016051,
        size.height * 0.8553240,
        size.width * 0.9004928,
        size.height * 0.8588597,
        size.width * 0.8984239,
        size.height * 0.8598801);
    path_0.cubicTo(
        size.width * 0.8953188,
        size.height * 0.8614133,
        size.width * 0.8932464,
        size.height * 0.8597168,
        size.width * 0.8865399,
        size.height * 0.8502602);
    path_0.cubicTo(
        size.width * 0.8817754,
        size.height * 0.8439184,
        size.width * 0.8730507,
        size.height * 0.8343673,
        size.width * 0.8670942,
        size.height * 0.8291556);
    path_0.cubicTo(
        size.width * 0.8608804,
        size.height * 0.8240714,
        size.width * 0.8500326,
        size.height * 0.8139388,
        size.width * 0.8427826,
        size.height * 0.8066505);
    path_0.cubicTo(
        size.width * 0.8313659,
        size.height * 0.7951684,
        size.width * 0.8299674,
        size.height * 0.7925995,
        size.width * 0.8314928,
        size.height * 0.7855995);
    path_0.cubicTo(
        size.width * 0.8342101,
        size.height * 0.7720408,
        size.width * 0.8406522,
        size.height * 0.7653316,
        size.width * 0.8601957,
        size.height * 0.7570561);
    path_0.cubicTo(
        size.width * 0.8764493,
        size.height * 0.7501276,
        size.width * 0.8788043,
        size.height * 0.7497832,
        size.width * 0.8947536,
        size.height * 0.7522398);
    path_0.cubicTo(
        size.width * 0.9157971,
        size.height * 0.7551735,
        size.width * 0.9271377,
        size.height * 0.7615332,
        size.width * 0.9463478,
        size.height * 0.7808495);
    path_0.cubicTo(
        size.width * 0.9657391,
        size.height * 0.8003495,
        size.width * 0.9675543,
        size.height * 0.8103189,
        size.width * 0.9590978,
        size.height * 0.8549541);
    path_0.cubicTo(
        size.width * 0.9521413,
        size.height * 0.8917883,
        size.width * 0.9523804,
        size.height * 0.9098699,
        size.width * 0.9597609,
        size.height * 0.9320306);
    path_0.cubicTo(
        size.width * 0.9650181,
        size.height * 0.9481786,
        size.width * 0.9808659,
        size.height * 0.9745867,
        size.width * 0.9919203,
        size.height * 0.9857015);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = color;

    canvas.save(); // Save the current canvas state
    canvas.translate(
        centerX, centerY); // Translate the canvas to the desired starting point

    canvas.rotate(
        -radAngle); // Rotate the canvas by the negative of the desired angle in radians

    canvas.drawPath(path_0, paint_0_fill);

    canvas.restore();
  }
}
