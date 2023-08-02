import 'package:flutter/material.dart';

import '../page/burger_screen.dart';

class BurgerBuilderWidget extends StatefulWidget {
  final BurgerItem burgerItem;

  const BurgerBuilderWidget({super.key, required this.burgerItem});

  @override
  State<BurgerBuilderWidget> createState() => _BurgerBuilderWidgetState();
}

class _BurgerBuilderWidgetState extends State<BurgerBuilderWidget> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  /// This holds the item count
  int counter = 0;

  List<BurgerItem> burgerItems = [];

  // insert item at the position on list
  void _insertItem(BurgerItem burgerItem) {
    burgerItems.add(burgerItem);

    if (listKey.currentState != null) {
      listKey.currentState!.insertItem(burgerItems.length - 1);
    }
  }

  // remove item at the position on list
  void _removeItem(BurgerItem burgerItem) {
    if (burgerItems.isEmpty) return;
    var index = burgerItems.indexOf(burgerItem);
    burgerItems.removeAt(index);
    listKey.currentState!.removeItem(
      index,
      (context, animation) => _buildItem(burgerItem, context, animation),
    );
  }

  _buildItem(BurgerItem burgerItem, BuildContext context,
      Animation<double> animation) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
          reverseCurve: Curves.easeInOutBack)),
      child: Image.asset('assets/stack_burger_app/images/${burgerItem.name}.png',
          width: 80, height: 44, fit: BoxFit.fill),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.burgerItem.isSelected) {
      _insertItem(widget.burgerItem);
    } else {
      _removeItem(widget.burgerItem);
    }

    var bunSizeAdjust = 120;

    return Container(
        width: MediaQuery.of(this.context).size.width - bunSizeAdjust,
        color: Colors.transparent,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(this.context).size.width - bunSizeAdjust,
                  child: Image.asset('assets/stack_burger_app/images/topbun.png'),
                ),
                AnimatedList(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  initialItemCount: burgerItems.length,
                  key: listKey,
                  reverse: true,
                  itemBuilder: (context, index, animation) {
                    // Slid animation transition
                    return _buildItem(burgerItems[index], context, animation);
                  },
                ),
                Stack(
                  children: [
                    Positioned.fill(
                        child: SizedBox(
                      height: 150,
                      child: Image.asset(
                        'assets/stack_burger_app/icons/plate.png',
                        fit: BoxFit.cover,
                        // Use BoxFit.cover to fill the SizedBox
                        width: MediaQuery.of(context).size.width,
                      ),
                    )),
                    Positioned(
                      child: SizedBox(
                        width: MediaQuery.of(this.context).size.width -
                            bunSizeAdjust,
                        child: Image.asset('assets/stack_burger_app/images/bottombun.png'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}