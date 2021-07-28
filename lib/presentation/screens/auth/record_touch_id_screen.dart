import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/auth/login_touch_id_screen.dart';
import 'package:brn/presentation/widgets/auth/custom_scaffold_auth.dart';
import 'package:brn/presentation/widgets/auth/sub_title_auth.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:flutter/material.dart';

class RecordTouchIdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldAuth(
      body: Column(
        children: [
          TitleAuth('Masuk Dengan Touch ID'),
          Center(
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    primaryColor,
                    primaryDarkColor,
                  ],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Image.asset('assets/images/touch_id_rounded.png'),
            ),
          ),
          SizedBox(height: 30),
          SubTitleAuth(
              'Sesuaikan jari Anda pada lokasi fingerprint hingga sidik jari Anda terekam'),
          SizedBox(height: 40),
          PrimaryButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => LoginTouchIdScreen(),
                ),
              );
            },
            text: 'Gunakan Touch ID',
          ),
        ],
      ),
    );
  }
}
