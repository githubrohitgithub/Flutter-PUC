import 'package:flutter/material.dart';

class TopHeader extends StatefulWidget {

  final String title;

  const TopHeader({super.key, required this.title});

  @override
  State<TopHeader> createState() => _TopHeaderState();
}

class _TopHeaderState extends State<TopHeader> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
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
           Text(widget.title,
              style: const TextStyle(
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
      ),
    );
  }
}
