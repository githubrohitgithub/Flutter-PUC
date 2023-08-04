import 'package:flutter/material.dart';
import '../../models/food_details_model.dart';
import '../../page/dashboard/food_app_dashboard.dart';
import '../../page/food_description/food_item_description.dart';

/*
It contains the routes of foodApp
 */
class AppRouteConstants {
  static const dynamicNavigationWidget = '/DynamicNavigationWidget';

  static const foodDashboardPageRoute = '/FoodDashboardPage';
  static const foodDetailsPageRoute = '/FoodDetailsPage';
}

class AppRoutes {
  static Map<String, StatefulWidget Function(dynamic context)>
      getFoodAppRoutes() {
    return {
      AppRouteConstants.foodDashboardPageRoute: (context) =>
          const FoodAppDashboard(),
      AppRouteConstants.foodDetailsPageRoute: (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as FoodDetailsModel;
        return FoodDescription(
          foodDetailsModel: args,
        );
      },
    };
  }
}
