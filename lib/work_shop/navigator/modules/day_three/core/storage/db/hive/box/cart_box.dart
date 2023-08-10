import 'dart:convert';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/models/cart_model.dart';
import 'package:hive/hive.dart';
import '../../../../../utils/food_app_constant.dart';
import '../../../../../utils/utils.dart';


class CartModelBox {
  final Box<CartModel> _cartBox;

  CartModelBox(this._cartBox);

  Future<void> saveAdminSettings(CartModel? cartModel) async {
    if (cartModel != null) {
      await _cartBox.put(FoodAppConstants.cartTableName, cartModel);
    }
  }

  Future<void> clearAdminSettings() async {
    await _cartBox.delete(FoodAppConstants.cartTableName);
  }

  Future<CartModel?> getAdminSettings() async {
    return _cartBox.get(FoodAppConstants.cartTableName);
  }

  Future<CartModel?> getSettings() async {
    return catchException(() => getSettingsFromDb());
  }

  CartModel getSettingsFromDb() {
    var jsonString = jsonEncode(
        _cartBox.get(FoodAppConstants.cartTableName)?.toJson() ?? CartModel().toJson());
    final jsonData = jsonDecode(jsonString);
    return CartModel.fromJson(jsonData);
  }
}