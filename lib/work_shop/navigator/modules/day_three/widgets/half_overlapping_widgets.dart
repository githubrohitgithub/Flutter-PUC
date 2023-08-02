import 'package:flutter/cupertino.dart';

class HalfOverlappingWidgetList extends StatelessWidget {
  final List<Widget> widgets;

  HalfOverlappingWidgetList({required this.widgets});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        widgets.length,
            (index) {
          final alignment = index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight;
          final offset = index % 2 == 0 ? 0.7 : -0.7;

          return Expanded(
            child: Align(
              alignment: alignment,
              child: Transform.translate(
                offset: Offset(offset * 40, 0),
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: widgets[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}