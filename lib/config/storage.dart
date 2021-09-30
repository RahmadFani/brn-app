import 'dart:convert';

import 'package:brn/model/login_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  SharedPreferences prefs;

  DataStorage._();

  static DataStorage _instance;

  static DataStorage get instance => _instance ??= DataStorage._();

  Future<SharedPreferences> init() async {
    return this.prefs ??= await SharedPreferences.getInstance();
  }

  setSplashScreenStatus() async {
    print('simpan');
    await init();
    await prefs.setBool('splash', true);
  }

  getSplashScreenStatus() async {
    bool res = false;
    try {
      await init();
      res = prefs.getBool('splash');
    } catch (e) {
      print('catch error: $e');
    }
    return res;
  }

  removeSplashScreenStatus() async {
    await init();
    await prefs.remove('splash');
  }

  //UserData
  Future<String> getToken() async {
    await init();
    return prefs.getString('token') ?? '';
  }

  Future<void> saveToken(String token) async {
    await init();
    await prefs.setString("token", token);
  }

  Future<void> deleteToken() async {
    await init();
    await prefs.remove('token');
  }

  Future<String> getName() async {
    await init();
    return prefs.getString('name') ?? '';
  }

  Future<void> saveString(String key, String value) async {
    await init();
    await prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    await init();
    return prefs.getString(key);
  }

  Future<void> saveAuth(LoginAuth auth) async {
    await init();
    await prefs.setString('auth', auth.toString());
  }

  Future<LoginAuth> getAuth(String key) async {
    await init();
    LoginAuth result;
    String s = prefs.getString('auth') ?? '';
    if (s.startsWith("{")) {
      result = LoginAuth.fromJson(jsonDecode(s));
    }
    return result;
  }
}
