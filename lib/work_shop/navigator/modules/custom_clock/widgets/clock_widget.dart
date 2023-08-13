import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/custom_clock/widgets/pendulam_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:timer_builder/timer_builder.dart';

import '../model/time_model.dart';
import '../paints/clock_painter.dart';
import '../paints/smartq_logo_paint.dart';
import '../utils/utils.dart';
import 'elevated_plate.dart';
import 'dart:ui' as ui;

class ClockWidget extends StatefulWidget {
  const ClockWidget({
    super.key,
  });

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

    var innerRad = isTab ? 2 : 1.6;
    var customWidth = screenWidth / 1.2;
    var customHeight = screenHeight / 1.2;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: customWidth,
        height: customHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            isTab
                ? Positioned(
                    bottom: 100,
                    left: 350,
                    child: Lottie.asset(
                      'assets/analog_clock_app/lottie/gear_new.json',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  )
                : Container(),
            isTab
                ? Positioned(
                    top: 100,
                    right: 350,
                    child: Lottie.asset(
                      'assets/analog_clock_app/lottie/gear_new.json',
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  )
                : Container(),
            elevatedPlate(
              customWidth * 1.8,
              customHeight * 1.8,
              const Color(0xFFECF6FF),
              const Color(0xFFB1BECA),
            ),
            elevatedPlate(
              customWidth / (isTab ? 1 : 1.1),
              customHeight / (isTab ? 1 : 1.1),
              const Color(0xFFECF6FF),
              const Color(0xFFB1BECA),
            ),
            elevatedPlate(
              customWidth / (innerRad),
              customHeight,
              const Color(0xFFECF6FF),
              const Color(0xFFB1BECA),
            ),
            elevatedPlate(
              customWidth / (innerRad * 1.6),
              customHeight,
              const Color(0xFFECF6FF),
              const Color(0xFFCADBEB),
            ),
            Center(
              child: TimerBuilder.periodic(const Duration(milliseconds: 50),
                  builder: (context) {
                var currentTime = DateTime.now();

                return Container(
                  constraints: const BoxConstraints.expand(),
                  child: CustomPaint(
                    painter: ClockPainter(
                        context: context,
                        time: TimeModel(
                            hours: currentTime.hour,
                            minutes: currentTime.minute,
                            seconds: currentTime.second,
                            milliseconds: currentTime.millisecond,
                            week: currentTime.weekday,
                            month: currentTime.month),
                        isTab: isTab),
                  ),
                );
              }),
            ),
            PendulumAnimation(
              (customWidth / (innerRad * (isTab ? 1.7 : 2.0))) / 1.5,
              isTab: isTab,
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
