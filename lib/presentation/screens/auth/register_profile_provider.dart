import 'package:brn/model/data_state.dart';
import 'package:brn/model/login_auth.dart';
import 'package:flutter/material.dart';

class RegisterProfileProvider with ChangeNotifier {
  DataState _dataState = DataStateIdle();

  DataState get dataState => _dataState;

  LoginAuth _loginAuth = LoginAuth();
  LoginAuth get loginAuth => _loginAuth;

  RegisterProfileProvider() {}
}
