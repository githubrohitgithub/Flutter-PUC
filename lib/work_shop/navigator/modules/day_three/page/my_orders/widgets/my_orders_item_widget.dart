import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyOrdersItemWidget extends StatefulWidget {
  final String image;
  final String name;
  final String subName;
  final String size;
  final String quantity;
  final String price;

  const MyOrdersItemWidget(
      {super.key,
      required this.image,
      required this.name,
      required this.subName,
      required this.size,
      required this.quantity,
      required this.price});

  @override
  State<MyOrdersItemWidget> createState() => _MyOrdersItemWidgetState();
}

class _MyOrdersItemWidgetState extends State<MyOrdersItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
                      color: Colors.grey.withOpacity(0.2)),
                ),
                Positioned(
                  right: 10,
                    bottom: 10,
                    child: Image.asset(
                      widget.image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      // Choose the appropriate fit option here
                    ))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(widget.name,
                        style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OriginalSurfer')),
                    Text(widget.subName,
                        style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OriginalSurfer'))
                  ],
                ),
                Text(widget.size,
                    style: const TextStyle(
                        fontSize: 10,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OriginalSurfer')),
                Text(widget.quantity,
                    style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OriginalSurfer'))
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right:24,bottom: 24),
                child: Text('\$${widget.price}',
                    style: const TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'OriginalSurfer')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
