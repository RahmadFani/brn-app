import 'package:brn/model/data_state.dart';
import 'package:brn/presentation/screens/auth/register_profile_provider.dart';
import 'package:brn/presentation/widgets/auth/custom_scaffold_auth.dart';
import 'package:brn/presentation/widgets/auth/footer_auth.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class RegisterProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterProfileProvider(),
      child: RegisterProfileContent(),
    );
  }
}

class RegisterProfileContent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _hpController = TextEditingController();
  final _namaRentalConttroller = TextEditingController();
  final _ukuranBajuController = TextEditingController();
  final _noKtpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    RegisterProfileProvider provider = context.watch<RegisterProfileProvider>();
    final email = provider.loginAuth.email;
    final nama = provider.loginAuth.nama;

    return ModalProgressHUD(
      inAsyncCall: provider.dataState is DataStateLoading,
      child: CustomScaffoldAuth(
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              TitleAuth('Registrasi'),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _hpController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(14),
                  labelText: "Nomor handphone",
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
                  if (val.length < 10 || val.length > 15) {
                    return "Nomor hp tidak valid";
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
                initialValue: email,
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
                initialValue: "........",
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
                  // register();
                },
                text: 'Lanjutkan',
              ),
              FooterAuth(
                text: 'Sudah punya Akun',
                buttonText: 'Masuk',
                onPressed: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (ctx) => LoginScreen(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
