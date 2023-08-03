import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/food_app_dashboard.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/utils/app_font.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/master_screen/page/dashboard.dart';
Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  AppFonts().loadCustomFont().then((_) {
    runApp(const MyApp());
  });

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Workshop",
      home: FoodAppDashboard(), //ScannerDayOne(),DynamicNavigationWidget()
    );
  }
}