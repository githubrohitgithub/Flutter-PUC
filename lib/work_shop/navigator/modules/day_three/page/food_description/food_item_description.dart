import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/item_detail_widget.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/item_image_widget.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/top_widget.dart';


class FoodDescription extends StatefulWidget {
  final dynamic foodDetailsModel;
  final Color? bgColor;

  const FoodDescription({super.key, required this.foodDetailsModel, required this.bgColor});

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
          const Expanded(
              child: TopHeader(title: 'Food Details',)),
          Expanded(
              child: ItemDetails(
                itemName: '${widget.foodDetailsModel?.name}',
                itemPrice: '${widget.foodDetailsModel?.price}',
              )),
          const SizedBox(
            height: 16,
          ),
          Expanded(
              flex: 4,
              child: ItemImage(
                bgColor: widget.bgColor,
                itemImage: widget.foodDetailsModel?.image,
                listOfFoodSubItems: widget.foodDetailsModel?.listFoodSubType,
              )),
        ],
      ),
    );
  }
}