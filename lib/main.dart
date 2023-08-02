import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/food_app_dashboard.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/master_screen/page/dashboard.dart';
Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Workshop",
      home: FoodAppDashboard(), //ScannerDayOne(),DynamicNavigationWidget()
    );
  }
}