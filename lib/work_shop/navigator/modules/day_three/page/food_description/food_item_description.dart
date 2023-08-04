import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/add_to_cart_widget.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/item_detail_widget.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/item_image_widget.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/top_widget.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/utils/color_convertor.dart';


class FoodDescription extends StatefulWidget {
  final dynamic foodDetailsModel;

  const FoodDescription({super.key, required this.foodDetailsModel});

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


    var screenBgColor = ColorConvertor.getColorFromHex('#fffcdc');

    return Scaffold(
      body: Column(
        children: [
          const Expanded(
              child: Padding(
            padding: EdgeInsets.all(32.0),
            child: TopHeader(),
          )),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ItemDetails(
              itemName: '${widget.foodDetailsModel?.name}',
              itemPrice: '${widget.foodDetailsModel?.price}',
            ),
          )),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              flex: 4,
              child: ItemImage(
                bgColor: screenBgColor,
                itemImage: widget.foodDetailsModel?.image,
                listOfFoodSubItems: widget.foodDetailsModel?.listFoodSubType,
              )),
        ],
      ),
    );
  }
}
