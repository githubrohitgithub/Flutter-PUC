import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/food_sub_type.dart';

class SubItemListWidget extends StatefulWidget {
  final List<FoodSubType>? subItemsList;

  const SubItemListWidget({super.key, this.subItemsList});

  @override
  State<SubItemListWidget> createState() => _SubItemListWidgetState();
}

class _SubItemListWidgetState extends State<SubItemListWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.subItemsList!.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.white..withOpacity(0.5),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        '${widget.subItemsList![index].image}',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text('${widget.subItemsList![index].name}',
                      style: const TextStyle(
                          fontFamily: 'OriginalSurfer',
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black)),
                  Text('${widget.subItemsList![index].calories} cal',
                      style: const TextStyle(
                          fontFamily: 'OriginalSurfer',
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                          color: Colors.black)),
                ],
              ),
            );
          }),
    );
  }
}
