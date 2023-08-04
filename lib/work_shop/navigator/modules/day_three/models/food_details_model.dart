

import 'food_sub_type.dart';

class FoodDetailsModel {
  String? name;
  String? image;
  int? price;
  int? quantity;
  List<FoodSubType>? listFoodSubType;

  FoodDetailsModel(
      {this.name, this.image, this.price, this.quantity, this.listFoodSubType});
}
