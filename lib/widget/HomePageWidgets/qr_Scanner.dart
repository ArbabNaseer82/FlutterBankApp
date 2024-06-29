import 'dart:developer';
import 'dart:io';
import 'package:bankapp/Constants/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerWidget extends StatefulWidget {
  const QRScannerWidget({Key? key}) : super(key: key);

  @override
  State<QRScannerWidget> createState() => _QRScannerWidgetState();
}

class _QRScannerWidgetState extends State<QRScannerWidget> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  void initState() {
    super.initState();
    _handleCameraPermission();
  }

  Future<void> _handleCameraPermission() async {
    // Check if the camera permission is already granted.
    var status = await Permission.camera.status;

    if (status.isGranted) {
      // Permission is already granted, perform necessary actions.
      print('Camera permission is already granted');
      return;
    }

    // We didn't ask for permission yet or the permission has been denied before but not permanently.
    if (status.isDenied) {
      // Request camera permission.
      var permissionStatus = await Permission.camera.request();
      if (permissionStatus.isGranted) {
        // The permission was just granted.

        print('Camera permission granted');
        return;
      }
    }

    // Check if the permission is permanently denied.
    if (status.isPermanentlyDenied) {
      // Show a dialog directing users to app settings to enable the permission.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Permission Required"),
            content: Text(
                'To use this feature, please enable the required permission in your device settings.\n1. Open Settings\n2. Navigate to App Permissions\n3. Find [Your App Name] in the list\n4. Enable the required permission\n\nAfter enabling the permission, please return to the app and try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                  openAppSettings();
                },
                child: const Text("ok"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text("Close"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 400,
            child: Expanded(flex: 1, child: _buildQrView(context))),
        Container(
          color: AppColors.secondaryColor.withOpacity(.1),
          child: Expanded(
            flex: 1,
            child: FittedBox(
              fit: BoxFit.none,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  if (result != null)
                    Text(
                        'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  else
                    Icon(
                      Icons.qr_code_scanner_rounded,
                      color: AppColors.secondaryColor,
                      size: 50,
                    ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: <Widget>[
                  //     Stack(
                  //       alignment: Alignment
                  //           .topLeft, // Adjust the alignment as per your requirement
                  //       children: [
                  //         _buildButton(
                  //           text: 'Flash',
                  //           onPressed: () async {
                  //             await controller?.toggleFlash();
                  //             setState(() {});
                  //           },
                  //           future: controller?.getFlashStatus(),
                  //         ),
                  //         // Add other widgets as required
                  //       ],
                  //     ),
                  //     // _buildButton(
                  //     //   text: 'Flip',
                  //     //   onPressed: () async {
                  //     //     await controller?.flipCamera();
                  //     //     setState(() {});
                  //     //   },
                  //     //   future: controller?.getCameraInfo(),
                  //     //   dataBuilder: (data) => 'Camera facing ${describeEnum(data)}',
                  //     // ),
                  //   ],
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: <Widget>[
                  //     _buildButton(
                  //       text: 'Pause',
                  //       onPressed: () async {
                  //         await controller?.pauseCamera();
                  //       },
                  //     ),
                  //     _buildButton(
                  //       text: 'Resume',
                  //       onPressed: () async {
                  //         await controller?.resumeCamera();
                  //       },
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    Future<dynamic>? future,
    String Function(dynamic)? dataBuilder,
  }) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: ElevatedButton(
        onPressed: onPressed,
        child: future == null
            ? Text(text)
            : FutureBuilder(
                future: future,
                builder: (context, snapshot) {
                  final data = snapshot.data;
                  return Text(dataBuilder != null && data != null
                      ? dataBuilder(data)
                      : text);
                },
              ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400
        ? 150.0
        : 300.0;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.red,
        borderRadius: 10,
        borderLength: 30,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
