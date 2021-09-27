import 'dart:convert';
import 'dart:io';

import 'package:brn/config/constants.dart';
import 'package:brn/config/ip.dart';
import 'package:brn/config/message.dart';
import 'package:brn/config/storage.dart';
import 'package:brn/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client, Response;

// Maps and Markers
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class PetaIndukProvider extends ChangeNotifier {
  Client client = Client();
  Response response;
  String statePetaInduk;
  initialPetaInduk() async {
    statePetaInduk = sInitial;
    addMarkers(latLngList);
    await doGetProfile();
  }

  setStatePetaInduk(val) {
    statePetaInduk = val;
    notifyListeners();
  }

  ProfileModel _profileModel;
  ProfileModel get dataProfile => _profileModel;
  setProfileModel(val) {
    _profileModel = val;
    notifyListeners();
  }

  List<LatLng> latLngList = [
    LatLng(-6.949634, 107.571979),
    LatLng(-6.952616, 107.583144),
    LatLng(-6.963266, 107.592334),
    LatLng(-6.964281, 107.604449),
    LatLng(-6.913167, 107.596917),
    LatLng(-6.912182, 107.619959),
  ];

  /// MARKER
  List<Marker> _markers = [];
  List<Marker> get markers => _markers;

  addMarkers(List<LatLng> val) {
    _markers = val
        .map((point) => Marker(
              point: point,
              width: 60,
              height: 60,
              builder: (context) => Icon(
                Icons.pin_drop,
                size: 60,
                color: Colors.blueAccent,
              ),
            ))
        .toList();
  }

  ///HTTP CONNECTION
  doGetProfile() async {
    setStatePetaInduk(sLoading);
    await httpGetProfile();
  }

  httpGetProfile() async {
    try {
      var token = await DataStorage().getToken();
      var url = Uri.parse(IpClass().getAuth() +
          '/api/profile?include=addresses%2Cpersonal-information');
      final header = {
        'Content-Type': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      };
      response = await client.get(url, headers: header);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var item = json.decode(response.body);
        setProfileModel(ProfileModel.fromJson(item));
        if (dataProfile.data.addresses.length != 0) {
          ///add latlong to _latlngList
          latLngList.clear();

          dataProfile.data.addresses.forEach((val) {
            latLngList.add(LatLng(val.latitude, val.longitude));
          });

          latLngList.forEach((v) {
            print(v.latitude);
            print(v.longitude);
          });

          ///add marker
          addMarkers(latLngList);
          setStatePetaInduk(sLoaded);
          notifyListeners();
        } else {
          showWarning(msg: 'Location not found');
          setStatePetaInduk(sNull);
        }
      } else if (response.statusCode == 401) {
        showWarning(msg: 'Unauthenticated');
      } else {
        showError;
      }
    } catch (e) {
      print(e.toString());
      showError;
    }
  }
}
