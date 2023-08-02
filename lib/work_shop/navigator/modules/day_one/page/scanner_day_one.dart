import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_one/page/widgets/custom_bottom_alert.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_one/page/widgets/custom_cross_cancel.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_one/page/widgets/custom_switch.dart';
import 'package:flutter_work_shop/work_shop/navigator/modules/day_one/page/widgets/custom_top_alert_dialog.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScannerDayOne extends StatefulWidget {
  const ScannerDayOne({super.key});

  @override
  State<ScannerDayOne> createState() => _ScannerDayOneState();
}

class _ScannerDayOneState extends State<ScannerDayOne> {
  Barcode? result;
  String? previousScannerData;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR Scanner');

  @override
  void deactivate() {
    controller?.dispose();
    super.deactivate();
  }

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var switchValue = true;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 0, top: 20),
        child: Stack(
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomSwitchButton(
                        initialValue: switchValue,
                        onChanged: (value) {
                          // Handle the state change here
                          switchValue = !value;

                          controller?.flipCamera();

                          controller?.getCameraInfo();
                        },
                        activeIcon: Icons.person,
                        inactiveIcon: Icons.camera_alt,
                      ),
                      CustomCancelButton(
                        backgroundColor: Colors.grey,
                        crossColor: Colors.white,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _showCustomBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true, // Allows the bottom sheet to take full height
      builder: (BuildContext context) {
        return Container(
          color: Colors.transparent,
          padding: const EdgeInsets.all(20),
          child: const CustomBottomAlertDialog(),
        );
      },
    );
  }

  void _showCustomTopDialog(BuildContext context, String resultData) {
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return SlideTransition(
          position: Tween<Offset>(
                  begin: const Offset(0.0, -0.5), end: const Offset(0.0, 0.0))
              .animate(animation), // Change the end value
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Column(
              children: [
                Container(
                    height: MediaQuery.of(context).size.height / 2,
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    child: CustomTopAlertDialog(
                      resultData: resultData,
                    ))
              ],
            ),
          ),
        );
      },
      barrierColor: Colors.black.withOpacity(0.5),
      barrierDismissible: true,
      barrierLabel: 'Dismiss',
      transitionDuration: const Duration(milliseconds: 500),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;

      setState(() {
        if (result!.code != previousScannerData) {
          _showCustomBottomSheet(context);

          Navigator.of(context).pop();

          _showCustomTopDialog(context, result!.code ?? '');
          previousScannerData = result!.code;
        }
      });
    });
  }

  void showSnackBar(String data) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(data),
        duration: const Duration(seconds: 10),
        action: SnackBarAction(
          label: 'Expand result',
          onPressed: () {
            // Perform any action when the "Close" button is pressed
            // Navigator.pop(context);
          },
        ),
      ),
    );
  }
}