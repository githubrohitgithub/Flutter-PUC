import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_item_list/food_item_list_page.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/my_orders/page/my_orders_page.dart';
import '../../../custom_clock/page/analog_clock.dart';
import '../../../day_one/page/scanner_day_one.dart';
import '../../../day_two/page/burger_screen.dart';
import '../../../master_screen/page/main_dashboard.dart';
import '../../models/food_details_model.dart';
import '../../page/dashboard/food_app_dashboard.dart';
import '../../page/food_description/food_item_description.dart';
import '../../utils/color_convertor.dart';

/*
It contains the routes of foodApp
 */
class AppRouteConstants {
  static const dynamicNavigationWidget = '/DynamicNavigationWidget';

  static const foodDashboardPageRoute = '/FoodDashboardPage';
  static const foodDetailsPageRoute = '/FoodDetailsPage';
  static const foodItemListPageRoute = '/FoodItemListPage';
  static const myOrdersPageRoute = '/MyOrdersPage';






  static const analogClockPageRoute = '/AnalogClockPage';
  static const scannerPageRoute = '/ScannerPage';
  static const burgerPageRoute = '/BurgerPage';
}

class AppRoutes {
  static Map<String, StatefulWidget Function(dynamic context)>
      getFoodAppRoutes() {
    return {

      AppRouteConstants.dynamicNavigationWidget: (context) =>
      const DynamicNavigationWidget(),

      AppRouteConstants.foodDashboardPageRoute: (context) =>
          const FoodAppDashboard(),
      AppRouteConstants.foodDetailsPageRoute: (context) {
        final argsList =
            ModalRoute.of(context)!.settings.arguments as FoodDetailsArguments;
        
        return FoodDescription(
          foodDetailsModel: argsList.foodDetailsModel, bgColor: argsList.bgColor,
        );
      },
      AppRouteConstants.foodItemListPageRoute: (context) {
        final args = ModalRoute.of(context)!.settings.arguments as String;
        return FoodItemListPage(
          foodCategoryName: args,
        );
      },

      AppRouteConstants.myOrdersPageRoute: (context) {
        final args = ModalRoute.of(context)!.settings.arguments as FoodOrderedArguments;
        return  MyOrdersPage(bgColor: args.bgColor,buttonColor: args.buttonColor??Colors.amberAccent,

        );
      },



      AppRouteConstants.analogClockPageRoute: (context) =>
      const AnalogClock(),


      AppRouteConstants.scannerPageRoute: (context) =>
      const ScannerDayOne(),


      AppRouteConstants.burgerPageRoute: (context) =>
      const BurgerScreen(),


    };
  }
}


class FoodOrderedArguments {
  final Color bgColor;
  final Color? buttonColor;

  FoodOrderedArguments({required this.bgColor, this.buttonColor});
}

class FoodDetailsArguments {
  final FoodDetailsModel foodDetailsModel;
  final Color? bgColor;

  FoodDetailsArguments({required this.foodDetailsModel, this.bgColor});
}
