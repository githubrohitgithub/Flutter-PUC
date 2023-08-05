import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_item_list/food_item_list_page.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/my_orders/page/my_orders_page.dart';
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
}

class AppRoutes {
  static Map<String, StatefulWidget Function(dynamic context)>
      getFoodAppRoutes() {
    return {
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
        final args = ModalRoute.of(context)!.settings.arguments as Color;
        return  MyOrdersPage(bgColor: args,

        );
      },
    };
  }
}


class FoodDetailsArguments {
  final FoodDetailsModel foodDetailsModel;
  final Color? bgColor;

  FoodDetailsArguments({required this.foodDetailsModel, this.bgColor});
}
