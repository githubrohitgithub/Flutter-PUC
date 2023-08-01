import 'package:flutter/material.dart';

import '../page/burger_screen.dart';

class ChooseBurgerItemsWidget extends StatefulWidget {
  final List<BurgerItem> burgerItems;
  final Function onBurgerItemChanged;

  const ChooseBurgerItemsWidget(
      {super.key,
      required this.burgerItems,
      required this.onBurgerItemChanged});

  @override
  State<ChooseBurgerItemsWidget> createState() =>
      _ChooseBurgerItemsWidgetState();
}

class _ChooseBurgerItemsWidgetState extends State<ChooseBurgerItemsWidget> {
  @override
  Widget build(BuildContext context) {


    //create gridView builder widget

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns in the grid
        crossAxisSpacing: 8.0, // Spacing between columns
        mainAxisSpacing: 8.0, // Spacing between rows
      ),
      itemCount: widget.burgerItems.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(widget.burgerItems[index].name),
            Checkbox(
              checkColor: Colors.black,
              activeColor: Colors.amber,
              value: widget.burgerItems[index].isSelected,
              onChanged: (value) {
                setState(() {
                  widget.burgerItems[index].isSelected = value!;
                  widget.onBurgerItemChanged(index);
                });
              },
            )
          ],
        );
      },
    );


  }
}