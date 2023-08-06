import 'package:flutter/material.dart';
import '../widgets/burger_maker.dart';
import '../widgets/choose_burgerIng_radients.dart';

class BurgerScreen extends StatefulWidget {
  const BurgerScreen({super.key});

  @override
  BurgerScreenState createState() => BurgerScreenState();
}

class BurgerScreenState extends State<BurgerScreen> {
  //listen to the changes in the burger Item
  // List<String> burgerItems = ['lettuce', 'tomato', 'onion'];
  final ScrollController _scrollController = ScrollController();
  List<BurgerItem> burgerItems = [
    BurgerItem('lettuce', false),
    BurgerItem('tomato', false),
    BurgerItem('onion', false),
    BurgerItem('avacado', false),
    BurgerItem('mushroom', false),
    BurgerItem('patty', false),
    BurgerItem('zucchini', false),
  ];

  BurgerItem burgerItem = BurgerItem('lettuce', false);

  // set state for selected item in the burger
  void onBurgerItemChanged(int index) {
    setState(() {
      burgerItems[index].isSelected = burgerItems[index].isSelected;
      burgerItem = burgerItems[index];

      _scrollToBottom();
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void _scrollToBottom() {
    // Scroll to the bottom with animation
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                //move the widget bottom left side

                Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  direction: orientation == Orientation.portrait
                      ? Axis.vertical
                      : Axis.horizontal,
                  children: [
                    Expanded(
                        flex: 30,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20,left: 10),
                          child: ChooseBurgerItemsWidget(
                              burgerItems: burgerItems,
                              onBurgerItemChanged: onBurgerItemChanged),
                        )),
                    Expanded(
                        flex: 70,
                        child: SingleChildScrollView(
                            controller: _scrollController,
                            child: BurgerBuilderWidget(burgerItem: burgerItem)))
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

// Object for the burger item
class BurgerItem {
  final String name;
  bool isSelected;

  BurgerItem(this.name, this.isSelected);
}