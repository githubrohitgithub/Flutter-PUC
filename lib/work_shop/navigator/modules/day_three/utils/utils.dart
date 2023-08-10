import 'dart:developer';

import '../models/cart_model.dart';
import 'food_app_constant.dart';

T? catchException<T>(T? Function() function) {
  try {
    return function();
  } catch (e) {
    log('Exception: $T  $e');
    return null;
  }
}


List<CartModel> foodItemCartTemp =FoodAppConstants.listOfCartModel;