import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HorizontalIconRepeat extends StatelessWidget {
  final Icon icon;
  final int noOfRepeats;

  const HorizontalIconRepeat({super.key, required this.icon, this.noOfRepeats = 3});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(3, (index) {
        final int repeats = index < noOfRepeats ? noOfRepeats - index : 1;
        final double opacity = index < 3 ? 1.0 - (index * 0.3) : 0.1;
        return Opacity(
          opacity: opacity,
          child: Container(
            margin: EdgeInsets.only(right: index < 1 ? 1 : 0),
            child: SvgPicture.asset(
              'assets/food_app/common/right_arrow.svg',
              color: Colors.black,
              height: 15,
              width: 15,
            )
          ),
        );
      }),
    );
  }
}
