import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/dashboard/widgets/page_view_item.dart';

import '../../../base/animations/animated_right_to_left.dart';
import '../../../base/glass_effect_container.dart';
import '../../../utils/food_app_constant.dart';

class ItemSelectionWidget extends StatefulWidget {
  const ItemSelectionWidget({super.key});

  @override
  _ItemSelectionWidgetState createState() => _ItemSelectionWidgetState();
}

class _ItemSelectionWidgetState extends State<ItemSelectionWidget> {
  int selectedIndex = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedRightToLeftWidget(
          duration: const Duration(seconds: 1),
          child: SizedBox(
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

                      _pageController.animateToPage(0,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInOut);
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: AspectRatio(
                      aspectRatio: index == 0 ? 1 : 2,
                      child: GlassEffectContainer(
                        color: index == 0
                            ? Colors.black
                            : Colors.grey.withOpacity(0.1),
                        width: 100,
                        height: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            index != 0
                                ? Row(
                                    children: [
                                      Image.asset(
                                        FoodAppConstants
                                                .foodCategoriesItems.keys
                                                .toList()[index]
                                                .image ??
                                            '',
                                        width: 30,
                                        height: 30,
                                      ),
                                      SizedBox(
                                        width: index == 0 ? 0 : 8.0,
                                      )
                                    ],
                                  )
                                : Container(),
                            Text(
                              FoodAppConstants.foodCategoriesItems.keys
                                      .toList()[index]
                                      .name ??
                                  '',
                              style: TextStyle(
                                color: index == 0
                                    ? Colors.white
                                    : FoodAppConstants.foodCategoriesItems.keys
                                        .toList()[index]
                                        .color,
                                fontSize: 12,
                                fontFamily: 'OriginalSurfer',
                                fontWeight: FontWeight.w800,
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
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemCount: FoodAppConstants
                .foodCategoriesItems[FoodAppConstants.foodCategoriesItems.keys
                    .toList()[selectedIndex]]!
                .length,
            itemBuilder: (context, index) {
              var getBgColor = generateRandomColor().withOpacity(0.2);

              return PageViewItem(
                index: index,
                selectedIndex: selectedIndex,
                height: 300,
                itemName: FoodAppConstants.foodCategoriesItems.values
                        .toList()[selectedIndex][index]
                        .name ??
                    '',
                itemImage: FoodAppConstants.foodCategoriesItems.values
                        .toList()[selectedIndex][index]
                        .image ??
                    '',
                width: MediaQuery.of(context).size.width,
                bgColor: getBgColor,
              );
            },
          ),
        )
      ],
    );
  }
}

Color generateRandomColor() {
  Random random = Random();
  int r = random.nextInt(256); // Random value between 0 and 255
  int g = random.nextInt(256);
  int b = random.nextInt(256);
  return Color.fromARGB(255, r, g, b); // 255 for alpha (fully opaque)
}
