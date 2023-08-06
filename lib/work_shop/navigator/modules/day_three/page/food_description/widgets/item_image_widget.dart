import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/base/animations/animated_bottom_to_top.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_description/widgets/sub_items_list_widget.dart';
import '../../../base/routes/app_routes.dart';
import '../../../models/food_sub_type.dart';
import '../../../utils/color_convertor.dart';
import 'custom_slider_widget.dart';

class ItemImage extends StatefulWidget {
  final Color? bgColor;
  final String? itemImage;
  final String? itemName;
  final List<FoodSubType>? listOfFoodSubItems;

  const ItemImage(
      {super.key,
      this.bgColor,
      this.itemImage,
      this.listOfFoodSubItems,
      this.itemName});

  @override
  State<ItemImage> createState() => _ItemImageState();
}

class _ItemImageState extends State<ItemImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: widget.bgColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(100), topRight: Radius.circular(100))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              widget.itemImage ??
                  'assets/food_app/sub_items_images/beef_burger.png',
              fit: BoxFit.cover,
              // Choose the appropriate fit option here
            ),
          ),
          Expanded(
              flex: 1,
              child: AnimatedBottomToTopWidget(
                duration: Duration(seconds: 1),
                child: SubItemListWidget(
                  subItemsList: widget.listOfFoodSubItems,
                ),
              )),
          Expanded(
              flex: 1,
              child: AnimatedBottomToTopWidget(
                duration: Duration(seconds: 1),
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
                          buttonColor: ColorConvertor.getColorFromHex('#ebd8c0'));

                      Navigator.pushNamed(
                          context, AppRouteConstants.myOrdersPageRoute,
                          arguments:
                              arguments // Replace `yourData` with the actual data you want to pass.
                          );
                    },
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
