import 'package:brn/presentation/screens/auth/login_screen.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:flutter/material.dart';

class UnauthScreen extends StatefulWidget {
  UnauthScreen({Key key}) : super(key: key);

  @override
  _UnauthScreenState createState() => _UnauthScreenState();
}

class _UnauthScreenState extends State<UnauthScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/error.png", height: 230, width: width),
            SizedBox(
              height: 20,
            ),
            TitleAuth(
              'Anda Belum Login',
              description: "Silahkan Login terlebih dahulu",
            ),
            SizedBox(
              height: 20,
            ),
            PrimaryButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => LoginScreen(),
                  ),
                );
              },
              text: 'Masuk',
            ),
          ],
        ),
      ),
    );
  }
}
