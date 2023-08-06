import 'package:flutter/material.dart';
import '../../../base/routes/app_routes.dart';
import '../../../models/cart_model.dart';
import '../../../utils/color_convertor.dart';
import 'custom_circle_widget.dart';
import 'half_overlapping_widgets.dart';

class BottomWidgetElements extends StatefulWidget {
  final List<CartModel> listOfCartOptions;

  const BottomWidgetElements({super.key, required this.listOfCartOptions});

  @override
  State<BottomWidgetElements> createState() => _BottomWidgetElementsState();
}

class _BottomWidgetElementsState extends State<BottomWidgetElements> {
  @override
  Widget build(BuildContext context) {
    var arguments = FoodOrderedArguments(
        bgColor: Colors.grey.withOpacity(0.2),
        buttonColor: ColorConvertor.getColorFromHex('#ebd8c0'));

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRouteConstants.myOrdersPageRoute,
            arguments:
                arguments // Replace `yourData` with the actual data you want to pass.
            );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          leftInfoForBottomSheet(widget.listOfCartOptions),
          OverlappingCirclesWidget(listOfWidgets: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Image.asset(
                '${widget.listOfCartOptions[0].image}',
                fit: BoxFit.fill,
              ),
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Image.asset(
                '${widget.listOfCartOptions[1].image}',
                fit: BoxFit.fill,
              ),
            ),
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.white,
              child: Image.asset(
                '${widget.listOfCartOptions[2].image}',
                fit: BoxFit.fill,
              ),
            ),
          ])
        ],
      ),
    );
  }
}

Widget leftInfoForBottomSheet(List<CartModel> listOfCartOptions) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      CircleWithText(
        centerWidget: Text(
          '${listOfCartOptions.length}',
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'OriginalSurfer',
              fontSize: 18),
        ),
        textColor: Colors.black,
        radius: 24,
        backgroundColor: Colors.white,
      ),
      const SizedBox(
        width: 16,
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Carts',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontFamily: 'OriginalSurfer'),
          ),
          Text(
            '${listOfCartOptions.length} items',
            style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontFamily: 'OriginalSurfer'),
          )
        ],
      )
    ],
  );
}
