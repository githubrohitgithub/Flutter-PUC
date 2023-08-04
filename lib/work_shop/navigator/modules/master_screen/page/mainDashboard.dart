import 'package:flutter/material.dart';
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
            width: MediaQuery.of(context).size.width * 0.2,
            child: ListView.builder(
              itemCount: foodDataSet.keys.length,
              itemBuilder: (context, index) {
                return DateView(
                  dates: foodDataSet.keys.toList()[index],
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
            child: MasterAppConstant.ProjectsWithDate.values.toList()[_selectedIndex],
          ),
        ],
      ),
    );
  }
}