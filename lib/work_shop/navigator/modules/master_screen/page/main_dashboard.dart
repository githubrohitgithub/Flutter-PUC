import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/custom_clock/page/analog_clock.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/base/routes/app_routes.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_three/page/dashboard/food_app_dashboard.dart';
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
                        )),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 6 / 2,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary:
                            Colors.amberAccent, // Set the background color here
                      ),
                      onPressed: () {
                        var selectedPage = MasterAppConstant
                            .ProjectsWithDate.values
                            .toList()[_selectedIndex];

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => selectedPage),
                        );

                        //navigate to widget page
                      },
                      child: Text(
                        'Launch the ${foodDataSet.keys.toList()[_selectedIndex].projectName}',
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
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
