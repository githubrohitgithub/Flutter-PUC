import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'horizontal_icon_repeat.dart';

class CustomSliderWidget extends StatefulWidget {
  final Color sliderBgColor;
  final Color bgColor;
  final Color? msgColor;
  final String msg;
  final Color arrowColor;
  final VoidCallback onSlide;

  const CustomSliderWidget(
      {super.key,
      required this.sliderBgColor,
      required this.bgColor,
      required this.msg,
      required this.arrowColor,
      required this.onSlide,
      this.msgColor = Colors.black});

  @override
  State<CustomSliderWidget> createState() => _CustomSliderWidgetState();
}

class _CustomSliderWidgetState extends State<CustomSliderWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          Dismissible(
            key: UniqueKey(),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {
              if (direction == DismissDirection.startToEnd) {
                widget.onSlide();
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.sliderBgColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SvgPicture.asset(
                      'assets/food_app/common/cart_bag_icon.svg',
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ),
          HorizontalIconRepeat(
            color: widget.arrowColor,
            icon: Icon(
              Icons.keyboard_arrow_right,
              color: widget.arrowColor,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(widget.msg,
                style: TextStyle(
                    fontSize: 20,
                    color: widget.msgColor,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'OriginalSurfer')),
          ),
        ],
      ),
    );
  }
}
