import 'dart:convert';

import 'package:brn/config/ip.dart';
import 'package:brn/presentation/screens/auth/login_pin_screen.dart';
import 'package:brn/presentation/screens/auth/register_screen.dart';
import 'package:brn/presentation/widgets/auth/custom_scaffold_auth.dart';
import 'package:brn/presentation/widgets/auth/footer_auth.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/presentation/widgets/divider_text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();

  bool loading = true;
  login() async {
    Uri url = Uri.parse(IpClass().getAuth() + '/api/login');
    var HttpHeaders;
    final response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
    });
    final res = json.decode(response.body);
    if (mounted) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffoldAuth(
      body: Column(
        children: [
          TitleAuth('Masuk'),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14),
              labelText: "Masukan Email",
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
                return "Nomor handphone tidak boleh kosong";
              } else {
                return null;
              }
            },
            style: TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14),
              labelText: "Masukan Password",
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
                return "Password tidak boleh kosong";
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
              //     builder: (ctx) => LoginPinScreen(),
              //   ),
              // );
              login();
            },
            text: 'Masuk',
          ),
          DividerText(text: 'Atau Melalui'),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  color: Color(0xff3B5998),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset('assets/images/facebook.png'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Facebook",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: PrimaryButton(
                  color: Color(0xffF3F3FA),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Image.asset('assets/images/google.png'),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Google",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          FooterAuth(
            text: 'Belum punya Akun? ',
            buttonText: 'Registrasi',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => RegisterScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
