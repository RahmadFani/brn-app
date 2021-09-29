import 'dart:convert';
import 'dart:io';

import 'package:brn/config/ip.dart';
import 'package:brn/model/data_state.dart';
import 'package:brn/model/login_auth.dart';
import 'package:brn/presentation/screens/auth/login_screen.dart';
import 'package:brn/presentation/screens/auth/register_profile_screen.dart';
import 'package:brn/presentation/widgets/auth/custom_scaffold_auth.dart';
import 'package:brn/presentation/widgets/auth/footer_auth.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/providers/auth_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DataState _dataState = DataStateIdle();

  register() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    setState(() {
      _dataState = DataStateLoading();
    });
    Uri url = Uri.parse(IpClass().getAuth() + '/api/register');
    final response = await http.post(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
    }, body: {
      "name": _name.text,
      "email": _email.text,
      "password": _pass.text,
    });
    final res = json.decode(response.body);
    print(response.body);
    if (mounted) {
      if (response.statusCode == 201) {
        Map<String, dynamic> map = jsonDecode(response.body);
        LoginAuth auth = LoginAuth(
            nama: _name.text.trim(),
            email: _email.text.trim(),
            token: map['access_token'],
            tokenType: res['token_type']);
        //
        await AuthProvider.instance.saveLoginAuth(auth);
        setState(() {
          _dataState = DataStateSuccess();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (ctx) => RegisterProfileScreen(),
            ),
          );
        });
      } else {
        setState(() {
          Fluttertoast.showToast(
              msg: res['message'],
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
          _dataState = DataStateError(errorMessage: res['message']);
        });
      }
    }

    // Fluttertoast.showToast(
    //     msg: "Silahkan Masukan Email dan Password dengan lengkap",
    //     toastLength: Toast.LENGTH_LONG,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _dataState is DataStateLoading,
      child: CustomScaffoldAuth(
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TitleAuth('Registrasi'),
              TextFormField(
                keyboardType: TextInputType.name,
                controller: _name,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(14),
                  labelText: "Nama",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ), // add padding to adjust icon
                    child: Icon(Icons.phone_android_outlined),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.length == 0) {
                    return "Nama tidak boleh kosong";
                  } else if (val.trim().length < 3) {
                    return "Sepertinya nama tidak valid";
                  } else {
                    return null;
                  }
                },
                style: TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _email,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(14),
                  labelText: "Email",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ), // add padding to adjust icon
                    child: Icon(Icons.email),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.trim().length == 0) {
                    return "email tidak boleh kosong";
                  } else if (!val.contains('@') || !val.contains('.')) {
                    return "email tidak valid";
                  } else {
                    return null;
                  }
                },
                style: TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                controller: _pass,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(14),
                  labelText: "Password",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ), // add padding to adjust icon
                    child: Icon(Icons.vpn_key),
                  ),
                  //fillColor: Colors.green
                ),
                validator: (val) {
                  if (val.trim().length < 8) {
                    return "Password minimal 4 karakter";
                  } else if (val.trim().contains(' ')) {
                    return "Password tidak boleh ada spasi";
                  } else {
                    return null;
                  }
                },
                style: TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
              SizedBox(height: 20),
              PrimaryButton(
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (ctx) => VerifOtpScreen(),
                  //   ),
                  // );
                  register();
                },
                text: 'Lanjutkan',
              ),
              FooterAuth(
                text: 'Sudah punya Akun',
                buttonText: 'Masuk',
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
