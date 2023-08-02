import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZoomInContainer extends StatefulWidget {
  @override
  _ZoomInContainerState createState() => _ZoomInContainerState();
}

class _ZoomInContainerState extends State<ZoomInContainer> {
  bool isZoomed = false;

  void _toggleZoom() {
    setState(() {
      isZoomed = !isZoomed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: GestureDetector(
      onTap: _toggleZoom,
      child: Stack(
        children: [

        ],
      ),
    ),);
  }
}