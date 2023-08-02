import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/widgets/bottom_wigets_elements.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/widgets/item_selection_widget.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/widgets/top_bar_widget.dart';

import 'base/animations/animated_bottom_to_top.dart';
import 'base/paints/custom_bottom_sheet_paint.dart';

class FoodAppDashboard extends StatefulWidget {
  const FoodAppDashboard({super.key});

  @override
  State<FoodAppDashboard> createState() => _FoodAppDashboardState();
}

class _FoodAppDashboardState extends State<FoodAppDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const Expanded(flex: 1, child: TopBarWidget()),
          Expanded(
              flex: 3,
              child: AnimatedBottomToTopWidget(
                  duration: const Duration(seconds: 1),
                  child: ItemSelectionWidget())),
          AnimatedBottomToTopWidget(
            duration: const Duration(milliseconds: 1),
            child: Container(
              height: 100,
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  Positioned(
                      bottom: 0,
                      child: Container(
                        color: Colors.black.withOpacity(1.0),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                      )),
                  SizedBox(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: CustomPaint(
                      painter: CustomBottomSheetPaint(),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: BottomWidgetElements(),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}