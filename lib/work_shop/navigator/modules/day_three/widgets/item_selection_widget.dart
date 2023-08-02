import 'package:flutter/material.dart';

import '../base/glass_effect_container.dart';
import '../utils/food_app_constant.dart';

class ItemSelectionWidget extends StatefulWidget {
  const ItemSelectionWidget({super.key});

  @override
  _ItemSelectionWidgetState createState() => _ItemSelectionWidgetState();
}

class _ItemSelectionWidgetState extends State<ItemSelectionWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount:
                FoodAppConstants.foodCategoriesItems.keys.toList().length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: AspectRatio(
                    aspectRatio: index == 0 ? 1 : 2,
                    child: GlassEffectContainer(
                      color: index == 0
                          ? Colors.black
                          : Colors.grey.withOpacity(0.2),
                      width: 100,
                      height: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            FoodAppConstants.foodCategoriesItems.keys
                                    .toList()[index]
                                    .image ??
                                '',
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: index == 0 ? 0 : 8.0,
                          ),
                          Text(
                            FoodAppConstants.foodCategoriesItems.keys
                                    .toList()[index]
                                    .name ??
                                '',
                            style: TextStyle(
                              color: index == 0 ? Colors.white : Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          child: PageView.builder(
            itemCount: FoodAppConstants
                .foodCategoriesItems[FoodAppConstants.foodCategoriesItems.keys
                    .toList()[selectedIndex]]!
                .length,
            itemBuilder: (context, index) {
              return Center(
                child: Text(
                  FoodAppConstants.foodCategoriesItems[FoodAppConstants
                      .foodCategoriesItems.keys
                      .toList()[selectedIndex]]![index],
                  style: TextStyle(fontSize: 24),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}