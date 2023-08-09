import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/custom_clock/widgets/pendulam_widget.dart';

import '../model/time_model.dart';
import '../paints/clock_painter.dart';
import '../paints/smartq_logo_paint.dart';
import '../utils/utils.dart';
import 'elevated_plate.dart';
import 'dart:ui' as ui;
class ClockWidget extends StatefulWidget {
  final TimeModel time;

  const ClockWidget({super.key, required this.time});

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    var isTab = AppUtils.isTablet(AppUtils.getScreenWidth(context));

    var innerRad = isTab?2.4:1.4;

    var customWidth = screenWidth / 1.1;
    var customHeight = screenHeight / 1.1;



    var logoSize = isTab? 50.0: 25.0;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        width: customWidth,
        height: customHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            PendulumAnimation(
              screenHeight,
              isTab: isTab,
            ),
             elevatedPlate(customWidth , customHeight ),
             elevatedPlate(customWidth / innerRad, customHeight),


             elevatedPlate(customWidth / (innerRad*(isTab?1.7:2.0)), customHeight),
            Container(
              constraints: const BoxConstraints.expand(),
              child: CustomPaint(
                painter: ClockPainter(
                    context: context, time: widget.time, isTab: isTab),
              ),
            ),


            CustomPaint(
              size: Size(logoSize, logoSize),
              painter: SmartqLogoPaint(),
            ),
          ],
        ),
      ),
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
