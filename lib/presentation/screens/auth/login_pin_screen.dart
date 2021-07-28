import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/auth/forgot_pin_screen.dart';
import 'package:brn/presentation/screens/auth/record_touch_id_screen.dart';
import 'package:brn/presentation/screens/dashboard_screen.dart';
import 'package:brn/presentation/widgets/auth/custom_scaffold_auth.dart';
import 'package:brn/presentation/widgets/auth/footer_auth.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/presentation/widgets/divider_text.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

class LoginPinScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _pinPutController = TextEditingController();

    return CustomScaffoldAuth(
      body: Column(
        children: [
          TitleAuth('Masukan PIN'),
          PinPut(
            obscureText: '',
            fieldsCount: 6,
            onSubmit: (e) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => DashBoardScreen(),
                ),
              );
            },
            controller: _pinPutController,
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
          DividerText(text: 'atau'),
          PrimaryButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => RecordTouchIdScreen(),
                ),
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Gunakan Touch ID",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 40,
                  child: Image.asset('assets/images/touch_id.png'),
                ),
              ],
            ),
          ),
          FooterAuth(
            text: 'Lupa PIN?',
            buttonText: 'Reset',
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ForgotPinScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
