import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/dashboard/food_app_dashboard.dart';

import '../../custom_clock/page/analog_clock.dart';
import '../../day_one/page/scanner_day_one.dart';
import '../../day_two/page/burger_screen.dart';

class MasterAppConstant {
  //create list of dates

  static double textScaleFactor = 1;

  static Map<DateWithProjectName, Widget> ProjectsWithDate = {
    // '03-08-2023': Placeholder(),
    DateWithProjectName('02-08-2023','Food App','assets/order.png'): const FoodAppDashboard(),
    DateWithProjectName('01-Aug-2023','Burger stack','assets/burger.png'): const BurgerScreen(),
    DateWithProjectName('31-Jul-2023','Scanner','assets/qr-code.png'): const ScannerDayOne(),
    DateWithProjectName('28-Jul-2023','Analog Clock','assets/clock.png'): const AnalogClock(),
  };



}

class DateWithProjectName{
  String date;
  String projectName;
  String icon;
  DateWithProjectName(this.date, this.projectName,this.icon);
}