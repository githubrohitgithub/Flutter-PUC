import 'package:flutter/material.dart';

class PageViewItem extends StatefulWidget {
  final int index;
  final int selectedIndex;
  final String? itemName;
  final String? itemImage;
  final double? height;
  final double? width;
  final Color? bgColor;

  const PageViewItem(
      {super.key,
      required this.index,
      required this.selectedIndex,
      this.itemName,
      this.itemImage,
      required this.height,
      required this.width,
      this.bgColor});

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            decoration: BoxDecoration(
              color: widget.bgColor,
              borderRadius: BorderRadius.circular(60),
            ),
            child: OverflowBox(
              maxHeight: constraints.maxHeight + 50,
              maxWidth: constraints.maxWidth + 250,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: constraints.maxWidth + 50,
                    height: constraints.maxHeight - 50,
                    child: Image.asset(
                      widget.itemImage ??
                          'assets/food_app/sub_items_images/beef_burger.png',
                      fit: BoxFit.cover,
                      // Choose the appropriate fit option here
                    ),
                  ),
                  Text(
                    widget.itemName ?? 'Beef Burger',
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '124 items',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Text(
// FoodAppConstants.foodCategoriesItems[FoodAppConstants
//     .foodCategoriesItems.keys
//     .toList()[widget.selectedIndex]]![widget.index],
// style: TextStyle(fontSize: 24),
// )