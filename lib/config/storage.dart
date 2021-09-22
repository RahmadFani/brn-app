import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  SharedPreferences prefs;

  setSplashScreenStatus() async {
    print('simpan');
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('splash', true);
  }

  getSplashScreenStatus() async {
    bool res = false;
    try {
      prefs = await SharedPreferences.getInstance();
      res = prefs.getBool('splash');
    } catch (e) {
      print('catch error: $e');
    }
    return res;
  }

  removeSplashScreenStatus() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('splash');
  }

  //UserData
  getToken() async {
    String res = prefs.getString('token');
    return res;
  }

  getName() async {
    String res = await prefs.getString('name');
    return res;
  }
}
