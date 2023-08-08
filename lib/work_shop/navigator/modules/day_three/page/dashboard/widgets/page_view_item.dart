import 'package:flutter/material.dart';

import '../../../base/routes/app_routes.dart';


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
      padding: const EdgeInsets.all(28.0),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {

          return Stack(
            children: [
              // The bottom container

              InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRouteConstants.foodItemListPageRoute,
                    arguments:
                        'Burger', // Replace `yourData` with the actual data you want to pass.
                  );
                },
                child: Container(
                    width: widget.width,
                    height: 500,
                    decoration: BoxDecoration(
                      color: widget.bgColor?..withOpacity(0.2),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: overFlowWidget(
                        context,
                        constraints,
                        widget.itemImage ??
                            'assets/food_app/sub_items_images/beef_burger.png')),
              ),

              // Positioned(
              //     bottom: 20,
              //     left: 0,
              //     right: 0,
              //     child: getFoodInfo(widget.itemName!)),
            ],
          );
        },
      ),
    );
  }
}

Widget overFlowWidget(
    BuildContext context, BoxConstraints constraints, String itemImage) {
  return OverflowBox(
    maxHeight: constraints.maxHeight + 100,
    maxWidth: constraints.maxWidth + 220,
    child: Image.asset(
      itemImage,
      fit: BoxFit.cover,
      // Choose the appropriate fit option here
    ),
  );
}

Widget getFoodInfo(String itemName) {
  return Column(children: [
    Text(
      itemName,
      style: const TextStyle(
          shadows: [
            Shadow(
              blurRadius: 2.0,
              color: Colors.black,
              offset: Offset(1.0, 1.0),
            ),
          ],
          fontSize: 34,
          fontFamily: 'OriginalSurfer',
          fontWeight: FontWeight.bold),
    ),
    const Text(
      '124 items',
      style: TextStyle(
          fontSize: 14,
          fontFamily: 'OriginalSurfer',
          fontWeight: FontWeight.normal),
    ),
  ]);
}
