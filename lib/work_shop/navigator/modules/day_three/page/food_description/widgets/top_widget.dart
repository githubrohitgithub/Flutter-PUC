import 'package:flutter/material.dart';

class TopHeader extends StatefulWidget {
  const TopHeader({super.key});

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              height: 40,
              width: 40,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/food_app/common/back.png'),
              )),
        ),
        const Text('Food Details',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'OriginalSurfer',
                fontSize: 16)),
        InkWell(
          onTap: () {},
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              height: 40,
              width: 40,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Image.asset('assets/food_app/common/save.png'),
              )),
        ),
      ],
    );
  }
}
