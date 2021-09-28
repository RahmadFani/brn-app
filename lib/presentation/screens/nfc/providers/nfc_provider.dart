import 'dart:convert';

import 'package:flutter/material.dart';

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

  checkNFC() async {}
}
