import 'package:flutter/material.dart';

class TopBarWidget extends StatefulWidget {
  const TopBarWidget({super.key});

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //create a grey circle and add an icon
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey.withOpacity(0.2),
                    ),
                    height: 40,
                    width: 40,
                    child: const Icon(
                      Icons.menu,
                      size: 20, // Adjust the size as needed
                      color: Colors.black, // Adjust the color as needed
                    )),
              ),

              const Padding(
                padding: EdgeInsets.only(right: 20),
                child: CircleAvatar(
                  radius: 30, // Adjust the radius as needed
                  backgroundImage: AssetImage('assets/food_app/common/profile.jpg'),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Order Your\nfavorite food',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              )),
        )
      ],
    );
  }
}