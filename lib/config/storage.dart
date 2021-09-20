import 'package:shared_preferences/shared_preferences.dart';

class DataStorage {
  SharedPreferences prefs;

  setSplashScreenStatus() async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('splash', true);
  }

  getSplashScreenStatus() async {
    bool res = prefs.getBool('splash') ?? false;
    print('response: $res');
    return res;
  }

  removeSplashScreenStatus() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('splash');
  }
}
