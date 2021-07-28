import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/auth/register_detail_screen.dart';
import 'package:brn/presentation/widgets/auth/custom_scaffold_auth.dart';
import 'package:brn/presentation/widgets/auth/footer_auth.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifOtpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _pinPutController = TextEditingController();

    return CustomScaffoldAuth(
      body: Column(
        children: [
          TitleAuth(
            'Verfikasi OTP',
            description:
                'Kami telah mengirimkan kode OTP pada nomor ponsel +6282128282892',
          ),
          PinPut(
            fieldsCount: 6,
            onSubmit: (e) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => RegisterDetailScreen(),
                ),
              );
            },
            controller: _pinPutController,
            textStyle: TextStyle(
              color: Colors.white,
            ),
            submittedFieldDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                color: primaryDarkColor,
              ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor,
                  primaryDarkColor,
                ],
              ),
            ),
            selectedFieldDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                color: primaryDarkColor,
              ),
              color: Colors.grey.withOpacity(0.15),
            ),
            followingFieldDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              border: Border.all(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 5),
          FooterAuth(
            text: 'Kirim ulang kode dalam',
            buttonText: '01:38',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
