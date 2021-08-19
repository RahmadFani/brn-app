import 'package:brn/presentation/screens/auth/register_success.dart';
import 'package:brn/presentation/widgets/auth/custom_scaffold_auth.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:flutter/material.dart';

class RegisterDetailScreen extends StatelessWidget {
  TextEditingController nama = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScaffoldAuth(
        body: Column(
          children: [
            TitleAuth('Registrasi'),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14),
                labelText: "Nama Lengkap",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              style: TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14),
                labelText: "Masukan PIN baru 6 digit",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              style: TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(14),
                labelText: "Ulangi PIN",
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(),
                ),
                //fillColor: Colors.green
              ),
              style: TextStyle(
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(height: 20),
            PrimaryButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => RegisterSuccessScreen(),
                  ),
                );
              },
              text: 'Daftar Sekarang',
            ),
          ],
        ),
      ),
    );
  }
}
