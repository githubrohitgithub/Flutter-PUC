import 'package:flutter/material.dart';

class OverlappingCirclesWidget extends StatelessWidget {
  final List<Widget> listOfWidgets;

  const OverlappingCirclesWidget({super.key, required this.listOfWidgets});

  @override
  Widget build(BuildContext context) {
    //create a stack of widgets and fill th children from listOfWidgets



    return listOfWidgets.isNotEmpty
        ? SizedBox(
            height: 60,
            width: 110,
            child: Stack(
              children: listOfWidgets
                  .asMap()
                  .entries
                  .toList()
                  .sublist(0, 3)
                  .reversed // Reverses the list to get the latest widgets at the end// Limits the list to only the last 3 widgets
                  .map((entry) {
                final index = entry.key;
                final widget = entry.value;
                final leftOffset =
                    index * 30.0; // Adjust this value as needed for spacing

                return Positioned(
                  left: leftOffset,
                  child: Center(
                    child: widget,
                  ),
                );
              }).toList(),
            ),
          )
        : Container();
  }
}
