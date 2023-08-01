import 'package:flutter/material.dart';

import '../../base/glass_container.dart';
import '../../paints/circle_drop.dart';

class CustomTopAlertDialog extends StatelessWidget {
  final String resultData;

  const CustomTopAlertDialog({Key? key, required this.resultData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var setCircleDropWidth = 60.0;

    //create a map of string and icons
    Map<String, IconData> iconMap = {
      'Wiki': Icons.heart_broken,
      'Insta': Icons.insert_chart,
    };

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlassContainer(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 4,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const DefaultTextStyle(
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                          child: Text(
                            'Scanned Result',
                            textAlign: TextAlign.left,
                          ),
                        ),
                        GlassContainer(
                          width: 60.0,
                          height: 60.0,
                          child: const Icon(Icons.close, color: Colors.white),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GlassContainer(
                          width: 60.0,
                          height: 80.0,
                          child: const Icon(Icons.location_on,
                              color: Colors.white),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(width: 20),
                        DefaultTextStyle(
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                overflow: TextOverflow.clip,
                                resultData,
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 6,
                width: setCircleDropWidth,
                child: CustomPaint(
                  painter: CircleDropPaint(),
                  child: ListView.builder(
                    itemCount: iconMap.length,
                    itemExtent: setCircleDropWidth,
                    // Set the height of each item to fill the SizedBox equally (150 / 2)
                    itemBuilder: (BuildContext context, int index) {
                      return iconMap.keys.map((String key) {
                        return GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'You clicked on $key',
                                    textAlign: TextAlign.center,
                                  ),
                                  duration: const Duration(seconds: 1),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Icon(iconMap[key], color: Colors.white),
                            ));
                      }).toList()[index];
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}