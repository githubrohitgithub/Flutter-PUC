import 'package:flutter/material.dart';

import 'custom_circle_widget.dart';

class BottomWidgetElements extends StatefulWidget {
  const BottomWidgetElements({super.key});

  @override
  State<BottomWidgetElements> createState() => _BottomWidgetElementsState();
}

class _BottomWidgetElementsState extends State<BottomWidgetElements> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleWithText(
              centerWidget: Text(
                '3',
                style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'OriginalSurfer',fontSize: 18),
              ),
              textColor: Colors.black,
              radius: 24,
              backgroundColor: Colors.white,
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Carts',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,fontStyle: FontStyle.italic, color: Colors.white,fontFamily: 'OriginalSurfer'),
                ),
                Text(
                  '3 items',
                  style: TextStyle(
                      fontWeight: FontWeight.normal, color: Colors.white,fontFamily: 'OriginalSurfer'),
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}