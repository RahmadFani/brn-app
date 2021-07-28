import 'package:brn/presentation/screens/auth/login_screen.dart';
import 'package:brn/presentation/screens/auth/verif_otp_screen.dart';
import 'package:brn/presentation/widgets/auth/custom_scaffold_auth.dart';
import 'package:brn/presentation/widgets/auth/footer_auth.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldAuth(
      body: Column(
        children: [
          TitleAuth('Registrasi'),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14),
              labelText: "Nomor handphone atau email",
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
                return "Nomor handphone atau email tidak boleh kosong";
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => VerifOtpScreen(),
                ),
              );
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
    );
  }
}
