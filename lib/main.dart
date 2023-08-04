import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/base/routes/app_routes.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/models/food_details_model.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/models/food_sub_type.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/dashboard/food_app_dashboard.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/food_item_description.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/utils/app_font.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/master_screen/page/mainDashboard.dart';

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

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Workshop",
      routes: AppRoutes.getFoodAppRoutes(),
      initialRoute: AppRouteConstants.foodDashboardPageRoute,
    );
  }
}
