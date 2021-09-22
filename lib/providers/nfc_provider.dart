import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

enum StateNFC { Initial, Loading, Loaded, Null, Error }

class NFCProvider extends ChangeNotifier {
  initialNFC() async {
    _availableNFC = false;
    _detectionKTP = false;
    await checkNFC();
  }

  bool _availableNFC = false;
  bool get isAvailableNFC => _availableNFC;
  set setAvailableNFC(val) {
    _availableNFC = val;
    notifyListeners();
  }

  bool _detectionKTP = false;
  bool get isDetectionKTP => _detectionKTP;
  set setDetectionKTP(val) {
    _detectionKTP = val;
    notifyListeners();
  }

  checkNFC() async {
    _availableNFC = await NfcManager.instance.isAvailable();

    setAvailableNFC = _availableNFC;
    print('status NFC: $isAvailableNFC');
    if (isAvailableNFC) {
      await NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
        setDetectionKTP = true;

        var ndef = Ndef.from(tag);
        if (ndef == null) {
          print('Tag is not compatible with NDEF');
          return;
        }
        var record = ndef.cachedMessage.records.first;
        var decodedPayload = ascii.decode(record.payload);
        var tmp = decodedPayload.substring(decodedPayload.indexOf('myprefix'));
        print('data $tmp');
      });
    }
    // Stop Session
    NfcManager.instance.stopSession();
  }
}
