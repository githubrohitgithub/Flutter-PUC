import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/widgets/item_selection_widget.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/widgets/top_bar_widget.dart';

class FoodAppDashboard extends StatefulWidget {
  const FoodAppDashboard({super.key});

  @override
  State<FoodAppDashboard> createState() => _FoodAppDashboardState();
}

class _FoodAppDashboardState extends State<FoodAppDashboard> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(flex: 1, child: TopBarWidget()),
          SizedBox(
            height: 40,
          ),
          SizedBox(
            height: 20,
          ),
         Expanded(flex: 2,child: ItemSelectionWidget())
        ],
      ),
    );
  }
}