import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemDetails extends StatelessWidget {
  final String itemName;
  final String itemPrice;

  const ItemDetails({super.key, required this.itemName, required this.itemPrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 28,right: 28),
      child: SizedBox(
        height: 120,
        width: MediaQuery.of(context).size.width,
        child:  Stack(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width/1.5,
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    itemName,
                    style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OriginalSurfer'),
                  ),
                ),
              ),
            ),
             Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '\$$itemPrice',
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'OriginalSurfer'),
                ),
              ),
            ),
          ],
        ),
      ),);
  }
}
