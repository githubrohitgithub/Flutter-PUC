import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/master_screen/utils/master_app_constant.dart';

import '../../custom_clock/utils/utils.dart';

class DateView extends StatelessWidget {
  final DateWithProjectName dateWithProjectName;
  final bool isSelected;
  final int position;
  final VoidCallback onTap;

  const DateView({
    super.key,
    required this.dateWithProjectName,
    required this.isSelected,
    required this.onTap,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    var isTab = AppUtils.isTablet(AppUtils.getScreenWidth(context));

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.amber,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0)),
          ),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(8.0), // Set the padding as needed
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  dateWithProjectName.date.toString(),
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: isSelected ? Colors.black : Colors.black,
                      fontSize: isTab ? 32 : 12,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal),
                ),
                Text(
                  dateWithProjectName.projectName.toString(),
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: isSelected ? Colors.black : Colors.black,
                      fontSize: isTab ? 32 : 10,
                      fontWeight:
                          isSelected ? FontWeight.bold : FontWeight.normal),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
