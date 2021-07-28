import 'package:brn/presentation/screens/auth/login_screen.dart';
import 'package:brn/presentation/widgets/auth/custom_scaffold_auth.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:flutter/material.dart';

class ResetPinSuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldAuth(
      body: Column(
        children: [
          TitleAuth(
            'Berhasil',
            description:
                'Pin Baru Anda telah berhasil diganti Silahkan lakukan login',
          ),
          PrimaryButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => LoginScreen(),
                ),
              );
            },
            text: 'Oke',
          ),
        ],
      ),
    );
  }
}
