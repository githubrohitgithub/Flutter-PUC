import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/dashboard/food_app_dashboard.dart';

import '../../custom_clock/page/analog_clock.dart';
import '../../day_one/page/scanner_day_one.dart';
import '../../day_two/page/burger_screen.dart';

class MasterAppConstant {
  //create list of dates

  static double textScaleFactor = 1;

  static Map<String, Widget> ProjectsWithDate = {
    // '03-08-2023': Placeholder(),
    '02-08-2023': const FoodAppDashboard(),
    '01-Aug-2023': const BurgerScreen(),
    '31-Jul-2023': const ScannerDayOne(),
    '28-Jul-2023': const AnalogClock(),
  };
}