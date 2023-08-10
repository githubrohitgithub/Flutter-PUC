import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/custom_clock/utils/utils.dart';
import 'package:neopop/widgets/buttons/neopop_tilted_button/neopop_tilted_button.dart';
import '../utils/master_app_constant.dart';
import '../widgets/date_view.dart';

class DynamicNavigationWidget extends StatefulWidget {
  const DynamicNavigationWidget({super.key});

  @override
  DynamicNavigationWidgetState createState() => DynamicNavigationWidgetState();
}

class DynamicNavigationWidgetState extends State<DynamicNavigationWidget> {
  int _selectedIndex = 0;

  late FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    focusScopeNode = FocusScopeNode();
  }

  @override
  void dispose() {
    focusScopeNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var foodDataSet = MasterAppConstant.ProjectsWithDate;

    var isTab = AppUtils.isTablet(MediaQuery.of(context).size.width);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Semantics(
              header: true,
              child: Center(
                child: Text('Flutter Work Shop',
                    textScaleFactor: 0.8,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OriginalSurfer')),
              ),
            ),
          ],
        ),
      ),
      body: Row(
        children: [
          // Left List
          Container(
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(32.0)),
            ),
            width: MediaQuery.of(context).size.width * 0.3,
            child: ListView.builder(
              itemCount: foodDataSet.keys.length,
              itemBuilder: (context, index) {
                return DateView(
                  position: index,
                  dateWithProjectName: foodDataSet.keys.toList()[index],
                  isSelected: _selectedIndex == index,
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                );
              },
            ),
          ),
          // Right Data
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/flutter-birds.png',
                  width: 600,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 8 / 2,
                    child: launchAppButton(
                        Text(
                          'Launch the ${foodDataSet.keys.toList()[_selectedIndex].projectName}',
                          style: TextStyle(
                              fontSize: isTab ? 32 : 10,
                              fontFamily: 'Chunk Five Print'),
                        ), () {
                      buttonClicked(context, _selectedIndex);
                    }, isTab),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void buttonClicked(BuildContext context, int selectedIndex) {
  var selectedPage =
      MasterAppConstant.ProjectsWithDate.values.toList()[selectedIndex];

  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => selectedPage),
  );
}

Widget launchAppButton(Widget btnText, Function callback, bool isTab) {
  return NeoPopTiltedButton(
    isFloating: true,
    onTapUp: () {
      callback.call();
    },
    decoration: const NeoPopTiltedButtonDecoration(
      color: Color.fromRGBO(255, 235, 52, 2),
      plunkColor: Color.fromRGBO(255, 235, 52, 2),
      shadowColor: Color.fromRGBO(36, 36, 36, 2),
      showShimmer: true,
    ),
    child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: isTab ? 70.0 : 30.0, vertical: isTab ? 15 : 10.0),
      child: Center(child: btnText),
    ),
  );
}
