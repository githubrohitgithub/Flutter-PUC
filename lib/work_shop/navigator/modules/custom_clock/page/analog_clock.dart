import 'package:flutter/material.dart';
import 'package:timer_builder/timer_builder.dart';
import '../model/time_model.dart';
import '../paints/hour_handle_paint.dart';
import '../widgets/pendulam_widget.dart';
import '../widgets/clock_widget.dart';

class AnalogClock extends StatefulWidget {
  const AnalogClock({super.key});

  @override
  State<AnalogClock> createState() => _AnalogClockState();
}

class _AnalogClockState extends State<AnalogClock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/images/masale2.jpg'),
            //   fit: BoxFit.fill,
            // ),
            ),
        child: Center(
          child: TimerBuilder.periodic(const Duration(seconds: 1),
              builder: (context) {
            var currentTime = DateTime.now();



            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClockWidget(
                  time: TimeModel(
                      hours: currentTime.hour,
                      minutes: currentTime.minute,
                      seconds: currentTime.second,
                      milliseconds: currentTime.millisecond,
                      week: currentTime.weekday),
                )


              ],
            );
          }),
        ),
      ),
    );
  }
}
