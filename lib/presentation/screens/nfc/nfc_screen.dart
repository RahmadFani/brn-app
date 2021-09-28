import 'dart:convert';

import 'package:brn/config/constants.dart';
import 'package:brn/config/message.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';
import 'package:ndef/ndef.dart' as ndef;
import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:shimmer/shimmer.dart';

class NfcScreen extends StatefulWidget {
  NfcScreen({Key key}) : super(key: key);

  @override
  _NfcScreenState createState() => _NfcScreenState();
}

class _NfcScreenState extends State<NfcScreen> {
  String id;
  @override
  void initState() {
    getNFC();
    id = '';
    super.initState();
  }

  getNFC() async {
    var availability = await FlutterNfcKit.nfcAvailability;
    if (availability != NFCAvailability.available) {
      showWarning(msg: 'NFC not available, please activate');
    }

    var tag = await FlutterNfcKit.poll(
        timeout: Duration(seconds: 10),
        iosMultipleTagMessage: "Multiple tags found!",
        iosAlertMessage: "Scan your tag");

    print(jsonEncode(tag));
    if (tag.type == NFCTagType.iso7816) {
      setState(() {
        id = tag.id;
        showSuccess(msg: 'ID Found $id');
      });
      var result = await FlutterNfcKit.transceive(
          "00B0950000"); // timeout is still Android-only, persist until next change
      print(result);

      var tmp = hex.decode('04895D3AAA2D80');
      print(tmp);

      if (tag.standard == "ISO 14443-4 (Type A)") {
        String result1 = await FlutterNfcKit.transceive("00B0950000");
        String result2 =
            await FlutterNfcKit.transceive("00A4040009A00000000386980701");

        print('1: $result1\n2: $result2\n');
      }
    }

    await FlutterNfcKit.setIosAlertMessage("hi there!");

    if (tag.ndefAvailable) {
      for (var record in await FlutterNfcKit.readNDEFRecords(cached: false)) {
        print(record.toString());
      }

      for (var record
          in await FlutterNfcKit.readNDEFRawRecords(cached: false)) {
        print(jsonEncode(record).toString());
      }
    }

    if (tag.ndefWritable) {
      // decoded NDEF records
      await FlutterNfcKit.writeNDEFRecords([
        new ndef.UriRecord.fromString(
            "https://github.com/nfcim/flutter_nfc_kit")
      ]);
    }

    await FlutterNfcKit.finish();
    await FlutterNfcKit.finish(iosAlertMessage: "Success");
    await FlutterNfcKit.finish(iosErrorMessage: "Failed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text('NFC Reader'),
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: id.isEmpty
                  ? Shimmer.fromColors(
                      baseColor: Colors.grey[300],
                      highlightColor: Colors.grey[100],
                      enabled: true,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width - 10,
                        height: 150,
                      ),
                    )
                  : Image.asset(
                      'assets/images/ktp_cover.jpeg',
                      fit: BoxFit.cover,
                    ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(id.isEmpty ? 'Scanning...' : id))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
