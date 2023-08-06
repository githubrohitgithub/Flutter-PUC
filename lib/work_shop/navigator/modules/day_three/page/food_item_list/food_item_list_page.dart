import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/base/animations/animated_bottom_to_top.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/base/animations/animated_right_to_left.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/base/animations/animation_top_to_bottom.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/food_item_list/widgets/gridview_food_item.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/utils/food_app_constant.dart';
import '../../utils/color_convertor.dart';
import '../food_description/widgets/top_widget.dart';

class FoodItemListPage extends StatefulWidget {
  final String? foodCategoryName;

  const FoodItemListPage({super.key, this.foodCategoryName = 'Burger'});

  @override
  State<FoodItemListPage> createState() => _FoodItemListPageState();
}

class _FoodItemListPageState extends State<FoodItemListPage> {
  @override
  Widget build(BuildContext context) {
    var listOfBurgerTypes = FoodAppConstants.listOfBurgerTypes;

    return Scaffold(body: Column(
      children: [
         Expanded(
          child: AnimatedTopToBottomWidget(child: TopHeader(
            title: 'Burgers',
          ),duration: Duration(seconds: 1),),
        ),
        Expanded(
            flex: 1,
            child: AnimatedRightToLeftWidget(duration: Duration(seconds: 1),child: Padding(
              padding: const EdgeInsets.only(left: 38, right: 38),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: const Text(
                        '155+ Results founds',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OriginalSurfer',
                            fontSize: 32),
                      )),
                  SvgPicture.asset(
                    'assets/food_app/common/filter_icon.svg',
                    width: 48,
                    height: 48,
                  )
                ],
              ),
            ),)),
        Expanded(
          flex: 6,
          child: AnimatedBottomToTopWidget(duration: const Duration(seconds: 1),child: Padding(
            padding:  const EdgeInsets.all(18.0),
            child: GridViewItem(bgColor: ColorConvertor.getColorFromHex('#ebd8c0').withOpacity(0.2),listOfBurgerTypes: listOfBurgerTypes,),
          ),)
        ),

      ],
    ),);
  }
}
