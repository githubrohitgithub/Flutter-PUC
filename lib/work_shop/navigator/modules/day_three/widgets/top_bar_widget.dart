import 'package:flutter/material.dart';

import '../base/animations/animation_left_to_right.dart';
import '../base/animations/animation_top_to_bottom.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({super.key});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        AnimatedTopToBottomWidget(
          duration: Duration(milliseconds: 500),
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //create a grey circle and add an icon
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      height: 40,
                      width: 40,
                      child: Image.asset('assets/food_app/common/ic_more.png')),
                ),

                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    radius: 30, // Adjust the radius as needed
                    backgroundImage:
                        AssetImage('assets/food_app/common/profile.jpg'),
                  ),
                ),
              ],
            ),
          ),
        ),
        AnimatedLeftToRightWidget(
          duration: Duration(milliseconds: 500),
          child: const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Order Your\nfavorite food',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OriginalSurfer'),
                )),
          ),
        )
      ],
    );
  }
}