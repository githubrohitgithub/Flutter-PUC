import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import '../model/time_model.dart';
import '../utils/utils.dart';
import '../widgets/clock_widget.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock({super.key});

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  @override
  Widget build(BuildContext context) {

    var isTab = AppUtils.isTablet(AppUtils.getScreenWidth(context));

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/analog_clock_app/wall.jpg', // Replace with your image URL
            fit: BoxFit.cover,
          ),
          Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/analog_clock_app/couple.png',
                width: 200,
              )),


          Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                'assets/analog_clock_app/lamp.png',
                width: isTab ? 200 : 100,
              )),
          Center(
            child: TimerBuilder.periodic(const Duration(milliseconds: 50),
                builder: (context) {
              var currentTime = DateTime.now();

              return ClockWidget(
                time: TimeModel(
                    hours: currentTime.hour,
                    minutes: currentTime.minute,
                    seconds: currentTime.second,
                    milliseconds: currentTime.millisecond,
                    week: currentTime.weekday,
                    month: currentTime.month),
              );
            }),
          )
        ],
      ),
    );
  }
}
