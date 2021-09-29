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
    prefs.setBool('splash', true);
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
    prefs.remove('splash');
  }

  //UserData
  getToken() async {
    await init();
    return prefs.getString('token') ?? '';
  }

  getName() async {
    await init();
    return prefs.getString('name') ?? '';
  }

  Future<void> saveString(String key, String value) async {
    await init();
    prefs.setString(key, value);
  }

  Future<String> getString(String key) async {
    await init();
    return prefs.getString(key);
  }
}
