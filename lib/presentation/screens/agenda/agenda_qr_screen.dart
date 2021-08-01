import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AgendaQrScreen extends StatefulWidget {
  AgendaQrScreen({Key key}) : super(key: key);

  @override
  _AgendaQrScreenState createState() => _AgendaQrScreenState();
}

class _AgendaQrScreenState extends State<AgendaQrScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode result;
  QRViewController controller;
  bool loading = false;

  @override
  void reassemble() {
    super.reassemble();
    controller.pauseCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildQrView(context));
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print(result.code);
        next();
      });
    });
  }

  next() async {
    await controller.pauseCamera();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AgendaQrScreen(),
      ),
    );
  }

  openCamera() async {
    await controller.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();

    super.dispose();
  }
}
