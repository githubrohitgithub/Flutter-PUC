import 'package:flutter/material.dart';

import '../utils/app_constant.dart';



class DateView extends StatelessWidget {
  final String dates;
  final bool isSelected;
  final VoidCallback onTap;

  const DateView({
    super.key,
    required this.dates,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            return Container(
              decoration: BoxDecoration(
                color: isSelected ? Colors.white : Colors.amber,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0)),
              ),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(8.0), // Set the padding as needed
              child: Center(
                child: Text(
                  dates,
                  textScaleFactor: AppConstant.textScaleFactor,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: isSelected
                          ? Colors.black
                          : Colors.black,
                      fontSize: orientation == Orientation.portrait
                          ? 12
                          : 30,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}