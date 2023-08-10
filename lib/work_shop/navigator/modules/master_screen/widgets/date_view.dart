import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/master_screen/utils/master_app_constant.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';

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

    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: NeoPopTiltedButton(
        isFloating: true,
        onTapUp: onTap,
        decoration: const NeoPopTiltedButtonDecoration(
          color: Color.fromRGBO(255, 235, 52, 2),
          plunkColor: Color.fromRGBO(255, 235, 52, 2),
          shadowColor: Color.fromRGBO(36, 36, 36, 2),
          showShimmer: true,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 30,
          ),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0)),
            ),
            width: isTab ? MediaQuery.of(context).size.width : 80,
            padding: const EdgeInsets.all(8.0), // Set the padding as needed
            child: Center(
              child: Row(
                children: [
                  //email icon
                  Expanded(
                      child: Image.asset(dateWithProjectName.icon.toString(),
                          width: isTab ? 62 : 80, height: isTab ? 62 : 80)),

                  isTab ? SizedBox(width: isTab ? 20 : 8) : Container(),

                  isTab
                      ? Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dateWithProjectName.projectName.toString(),
                                textScaleFactor: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.black,
                                        fontSize: isTab ? 32 : 5,
                                        fontFamily: 'Pacifico'),
                              ),
                              Text(
                                dateWithProjectName.date.toString(),
                                textScaleFactor: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        color: isSelected
                                            ? Colors.black
                                            : Colors.black,
                                        fontSize: isTab ? 24 : 12,
                                        fontFamily: 'Chunk Five Print',
                                        fontWeight: isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal),
                              )
                            ],
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
