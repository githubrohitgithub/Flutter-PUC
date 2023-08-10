import 'package:flutter/material.dart';
import '../../../base/routes/app_routes.dart';
import '../../../models/cart_model.dart';
import '../../../utils/color_convertor.dart';
import '../../../utils/utils.dart';
import 'custom_circle_widget.dart';
import 'half_overlapping_widgets.dart';

class BottomWidgetElements extends StatefulWidget {
  const BottomWidgetElements({
    super.key,
  });

  @override
  State<BottomWidgetElements> createState() => _BottomWidgetElementsState();
}

class _BottomWidgetElementsState extends State<BottomWidgetElements> {
  @override
  Widget build(BuildContext context) {
    var arguments = FoodOrderedArguments(
        bgColor: Colors.grey.withOpacity(0.2),
        buttonColor: ColorConvertor.getColorFromHex('#ebd8c0'));

    List<Widget> circleAvatarWidgets = [];


    if(foodItemCartTemp.isNotEmpty ){
      for (int i = 0; i < foodItemCartTemp.length-1; i++) {
        circleAvatarWidgets.add(
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.white,
            child: Image.asset(
              foodItemCartTemp[i].image ?? '',
              fit: BoxFit.fill,
            ),
          ),
        );
      }
    }


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
          leftInfoForBottomSheet(foodItemCartTemp),

          //create a list of CircleAvatar widget and pass it to the OverlappingCirclesWidget based on dat  in foodItemCartTemp

          OverlappingCirclesWidget(listOfWidgets: circleAvatarWidgets)
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
      const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Carts',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                color: Colors.white,
                fontFamily: 'OriginalSurfer'),
          ),
          Text(
            'items',
            style: TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.white,
                fontFamily: 'OriginalSurfer'),
          )
        ],
      )
    ],
  );
}
