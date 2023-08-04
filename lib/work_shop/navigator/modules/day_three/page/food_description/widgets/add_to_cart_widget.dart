import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'horizontal_icon_repeat.dart';

class AddToCartWidget extends StatefulWidget {
  final Color bgColor;

  const AddToCartWidget({super.key, required this.bgColor});

  @override
  State<AddToCartWidget> createState() => _AddToCartWidgetState();
}

class _AddToCartWidgetState extends State<AddToCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.startToEnd,
      // This makes the widget slidable to the right
      onDismissed: (direction) {
        // Handle what happens when the widget is dismissed
        if (direction == DismissDirection.startToEnd) {
          // Implement any action you want, such as removing the widget or showing a confirmation dialog.
          // In this example, we are just printing a message.
          print('Widget dismissed!');

          final snackBar = SnackBar(
            content: const Text('Item added from cart'),
            duration: const Duration(seconds: 3),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                setState(() {});
              },
            ),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SvgPicture.asset(
                        'assets/food_app/common/cart_bag_icon.svg',
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              const HorizontalIconRepeat(
                icon: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                  size: 30,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text('Add to Cart',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'OriginalSurfer')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
