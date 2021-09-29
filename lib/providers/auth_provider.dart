import 'dart:convert';

import 'package:brn/model/login_auth.dart';
import 'package:nb_utils/nb_utils.dart';

/*-----------------------------------------------------------------
Author Supriyadi

Static class untuk management auth
*
* */

class AuthProvider {
  AuthProvider._();

  static AuthProvider _internalInstance = null;

  static AuthProvider get instance => _internalInstance ??= AuthProvider._();

  Future<void> saveLoginAuth(LoginAuth loginAuth) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString('login', loginAuth.toString());
  }

  Future<LoginAuth> getLoginAuth() async {
    LoginAuth auth;
    final pref = await SharedPreferences.getInstance();
    String s = pref.getString('login');
    if (s.startsWith('{') && s.endsWith('}')) {
      Map<String, dynamic> json = jsonDecode(s);
      if (json != null) {
        auth = LoginAuth.fromJson(json);
      }
    }

    return auth;
  }

  Future<void> clearLoginAuth() async {
    final pref = await SharedPreferences.getInstance();
    pref.remove('login');
  }
}
