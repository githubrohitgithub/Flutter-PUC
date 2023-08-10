import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/base/animations/animated_right_to_left.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/base/animations/animation_top_to_bottom.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/custom_slider_widget.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/item_detail_widget.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/item_image_widget.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/top_widget.dart';

import '../../base/animations/animated_bottom_to_top.dart';
import '../../base/routes/app_routes.dart';
import '../../models/cart_model.dart';
import '../../models/food_details_model.dart';
import '../../utils/color_convertor.dart';
import '../../utils/utils.dart';

class FoodDescription extends StatefulWidget {
  final dynamic foodDetailsModel;
  final Color? bgColor;

  const FoodDescription(
      {super.key, required this.foodDetailsModel, required this.bgColor});

  @override
  State<FoodDescription> createState() => _FoodDescriptionState();
}

class _FoodDescriptionState extends State<FoodDescription> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: AnimatedTopToBottomWidget(
            duration: const Duration(seconds: 1),
            child: const TopHeader(
              title: 'Food Details',
            ),
          )),
          Expanded(
              child: AnimatedRightToLeftWidget(
            duration: const Duration(seconds: 1),
            child: ItemDetails(
              itemName: '${widget.foodDetailsModel?.name}',
              itemPrice: '${widget.foodDetailsModel?.price}',
            ),
          )),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              flex: 3,
              child: ItemImage(
                bgColor: widget.bgColor,
                itemName: widget.foodDetailsModel?.name,
                itemImage: widget.foodDetailsModel?.image,
                listOfFoodSubItems: widget.foodDetailsModel?.listFoodSubType,
              )),
          Expanded(
              flex: 1,
              child: AnimatedBottomToTopWidget(
                duration: const Duration(seconds: 1),
                child: Container(
                  color: widget.bgColor,
                  child: Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: CustomSliderWidget(
                      sliderBgColor: ColorConvertor.getColorFromHex('#ebd8c0'),
                      bgColor: Colors.white,
                      arrowColor: Colors.black,
                      msgColor: Colors.black,
                      msg: 'Add to cart',
                      onSlide: () {
                        var arguments = FoodOrderedArguments(
                            bgColor:
                                widget.bgColor ?? Colors.grey.withOpacity(0.2),
                            buttonColor:
                                ColorConvertor.getColorFromHex('#ebd8c0'));

                        var carts = widget.foodDetailsModel as FoodDetailsModel;

                        var selectedCartItem = CartModel(
                            id: '1', name: carts.name, image: carts.image, price: carts.price, quantity: '1', size: '1.5', subName: 'burger');


                        foodItemCartTemp.add(selectedCartItem);

                        Navigator.pushNamed(
                            context, AppRouteConstants.foodDashboardPageRoute,
                            arguments:
                                arguments // Replace `yourData` with the actual data you want to pass.
                            );
                      },
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
