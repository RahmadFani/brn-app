import 'dart:convert';
import 'dart:io';

import 'package:brn/config/ip.dart';
import 'package:brn/config/storage.dart';
import 'package:brn/model/data_state.dart';
import 'package:brn/model/login_auth.dart';
import 'package:brn/presentation/screens/auth/login_screen.dart';
import 'package:brn/presentation/screens/dashboard_screen.dart';
import 'package:brn/presentation/widgets/auth/custom_scaffold_auth.dart';
import 'package:brn/presentation/widgets/auth/footer_auth.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _phone = TextEditingController();
  TextEditingController _name = TextEditingController();
  TextEditingController _rentalName = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _ktp = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DataState _dataState = DataStateIdle();
  final _ukuranBaju = ['S', 'M', 'L', 'XL', 'XXL', 'XXXL'];
  String _selectedUkuranBaju = 'S';
  String phoneAuthToken = "dummyphoneverifcation_id";
  String phoneAuthMessage = "";
  String errorTitle = "";
  String errorMessage = "";

  register() async {
    errorTitle = "";
    errorMessage = "";
    if (!_formKey.currentState.validate()) {
      return;
    }

    if (_phone.text.startsWith("0")) {
      setState(() {
        _phone.text = "+62" + _phone.text.substring(1);
      });
    }
    if (_phone.text.startsWith("62")) {
      setState(() {
        _phone.text = "+" + _phone.text;
      });
    }

    if (_phone.text.startsWith("8")) {
      setState(() {
        _phone.text = "+62" + _phone.text;
      });
    }

    if (phoneAuthToken.isEmptyOrNull) {
      authenticatePhoneNumber();
      return;
    }

    setState(() {
      _dataState = DataStateLoading();
    });
    final client = http.Client();
    try {
      //--------------------------------------------------------
      // register with email, name, and password
      //--------------------------------------------------------
      Uri url = Uri.parse(IpClass().getAuth() + '/api/register');
      var response = await http.post(url, headers: {
        HttpHeaders.acceptHeader: "application/json",
      }, body: {
        "name": _name.text,
        "email": _email.text,
        "password": _pass.text,
      });
      print(response.body);
      if (!mounted) return; // mungkin halaman sudah ditutup
      Map<String, dynamic> res = json.decode(response.body);
      if (response.statusCode != 201) {
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
          if (res.containsKey("errors")) {
            Map<String, dynamic> errorMap = res['errors'];
            StringBuffer message = StringBuffer();
            errorMap.keys.forEach((element) {
              message.writeln([
                "$element: ${(errorMap[element] as Iterable<String>).join(", ")}"
              ]);
            });
            errorTitle = res['message'];
            errorMessage = message.toString();
          }
        });

        return;
      }

      LoginAuth auth = LoginAuth(
          nama: _name.text.trim(),
          email: _email.text.trim(),
          token: res['access_token'],
          tokenType: res['token_type']);
      await DataStorage.instance.saveToken(auth.token);
      await DataStorage.instance.saveAuth(auth);
      Fluttertoast.showToast(msg: "Register berhasil. Sedikit lagi...");

      //--------------------------------------------------------
      // kirim phoneAuth token
      //--------------------------------------------------------
      url = Uri.parse(IpClass().getAuth() + '/api/profile/phone-number');
      response = await http.post(url, headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer " + auth.token,
      }, body: {
        "firebase_verify_id_token": phoneAuthToken
      });
      print("Posting phone token: ${response.body}");
      //todo: handle response posting phone token

      //--------------------------------------------------------
      // kirim data profile
      //--------------------------------------------------------
      url =
          Uri.parse(IpClass().getAuth() + '/api/profile/personal-information');
      response = await http.post(url, headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer " + auth.token,
      }, body: {
        "nik_ktp": _ktp.text,
        "company_name": _rentalName.text,
        "clothes_size": _selectedUkuranBaju,
      });
      print("Posting posting profile: ${response.body}");
      //todo: handle response posting data profile

      //--------------------------------------------------------
      // kirim data profile
      //--------------------------------------------------------
      url = Uri.parse(IpClass().getAuth() + '/api/profile/address');
      response = await http.post(url, headers: {
        HttpHeaders.acceptHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer " + auth.token,
      }, body: {
        "label": "Default Address",
        "given_name": _name.text,
        "country_code": "id",
        "location": "-6.949634,107.571979",
      });
      print("Posting Lokasi: ${response.body}");
      //todo handel response posting lokasi

      /*almost done*/

      // await AuthProvider.instance.saveLoginAuth(auth);
      setState(() {
        _dataState = DataStateSuccess();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => DashBoardScreen(),
          ),
        );
      });
    } catch (error) {
      Fluttertoast.showToast(msg: "${error?.toString()}");
    } finally {
      client.close();
    }
// Uri url = Uri.parse(IpClass().getAuth() + '/api/register');
// final response = await http.post(url, headers: {
//   HttpHeaders.acceptHeader: "application/json",
// }, body: {
//   "name": _name.text,
//   "email": _email.text,
//   "password": _pass.text,
// });
// final res = json.decode(response.body);
// print(response.body);
// if (mounted) {
//   if (response.statusCode == 201) {
//     Map<String, dynamic> map = jsonDecode(response.body);
//     LoginAuth auth = LoginAuth(
//         nama: _name.text.trim(),
//         email: _email.text.trim(),
//         token: map['access_token'],
//         tokenType: res['token_type']);
//     //
//     // await AuthProvider.instance.saveLoginAuth(auth);
//     setState(() {
//       _dataState = DataStateSuccess();
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(
//           builder: (ctx) => RegisterProfileScreen(),
//         ),
//       );
//     });
//   } else {
//     setState(() {
//       Fluttertoast.showToast(
//           msg: res['message'],
//           toastLength: Toast.LENGTH_LONG,
//           gravity: ToastGravity.CENTER,
//           timeInSecForIosWeb: 1,
//           backgroundColor: Colors.red,
//           textColor: Colors.white,
//           fontSize: 16.0);
//       _dataState = DataStateError(errorMessage: res['message']);
//     });
//   }
// }

// Fluttertoast.showToast(
//     msg: "Silahkan Masukan Email dan Password dengan lengkap",
//     toastLength: Toast.LENGTH_LONG,
//     gravity: ToastGravity.CENTER,
//     timeInSecForIosWeb: 1,
//     backgroundColor: Colors.red,
//     textColor: Colors.white,
//     fontSize: 16.0);
  }

  void authenticatePhoneNumber() {
    phoneAuthToken = "";
    phoneAuthMessage = "";
    FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: _phone.text,
      verificationCompleted: (phoneAuthCredential) {
        print("""verificationCompleted. token:${phoneAuthCredential.token}, 
            smsCode:${phoneAuthCredential.smsCode}, 
            signMethod:${phoneAuthCredential.signInMethod}""");
        phoneAuthToken = phoneAuthCredential.verificationId;
        register();
      },
      verificationFailed: (error) {
        print("""verificationFailed. error:${error?.stackTrace?.toString()}""");
        if (mounted) {
          Fluttertoast.showToast(msg: "${error?.message}");
        }
      },
      codeSent: (verificationId, forceResendingToken) {
        print("codeSent");
        if (mounted) {
          Fluttertoast.showToast(msg: "Kode SMS terkirim");
        }
      },
      codeAutoRetrievalTimeout: (verificationId) {
        print("codeAutoRetrievalTimeout");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (errorTitle.isNotEmpty && errorMessage.isNotEmpty) {
      Future.microtask(() {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(errorTitle),
              content: Text(errorMessage),
              actions: [
                TextButton(
                  child: Text("OK"),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            );
          },
        );
      });
    }
    return ModalProgressHUD(
      inAsyncCall: _dataState is DataStateLoading,
      child: Expanded(
        child: CustomScaffoldAuth(
          body: Form(
            key: _formKey,
            child: Column(
              children: [
                TitleAuth('Registrasi'),
                _buildPhoneForm(),
                SizedBox(height: 20),
                _buildEmailForm(),
                SizedBox(height: 20),
                _buildNameForm(),
                SizedBox(height: 20),
                _buildRentalNameForm(),
                SizedBox(height: 20),
                _buildUkuranBajuDropdown(),
                SizedBox(height: 20),
                _buildPasswordForm(),
                SizedBox(height: 20),
                _buildNoKtpForm(),
                SizedBox(height: 20),
                _buildLocationButton(),
                SizedBox(height: 20),
                PrimaryButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (ctx) => VerifOtpScreen(),
                    //   ),
                    // );
                    context.requestFocus(FocusNode());
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
      ),
    );
  }

  Widget _buildPhoneForm() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      controller: _phone,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 28, right: 7),
        labelText: "Nomor handphone",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(),
        ),
        // prefixIcon: Padding(
        //   padding: EdgeInsets.only(
        //     left: 15,
        //   ), // add padding to adjust icon
        //   child: Icon(Icons.phone_android_outlined),
        // ),
        //fillColor: Colors.green
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Nomor hp tidak boleh kosong";
        } else if (val.trim().length < 10 || val.trim().length > 15) {
          return "Sepertinya nomor hp tidak valid";
        } else {
          return null;
        }
      },
      style: TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }

  Widget _buildEmailForm() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _email,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 28),
        labelText: "Email",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(),
        ),
        // prefixIcon: Padding(
        //   padding: EdgeInsets.only(
        //     left: 15,
        //   ), // add padding to adjust icon
        //   child: Icon(Icons.email),
        // ),
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
    );
  }

  Widget _buildNameForm() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: _name,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 28),
        labelText: "Nama Calon Anggota",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(),
        ),
        // prefixIcon: Padding(
        //   padding: EdgeInsets.only(
        //     left: 15,
        //   ), // add padding to adjust icon
        //   child: Icon(Icons.phone_android_outlined),
        // ),
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
    );
  }

  Widget _buildRentalNameForm() {
    return TextFormField(
      keyboardType: TextInputType.name,
      controller: _rentalName,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 28),
        labelText: "Nama Rental",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(),
        ),
        // prefixIcon: Padding(
        //   padding: EdgeInsets.only(
        //     left: 15,
        //   ), // add padding to adjust icon
        //   child: Icon(Icons.phone_android_outlined),
        // ),
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
    );
  }

  Widget _buildUkuranBajuDropdown() {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(30)),
      padding: EdgeInsets.only(left: 24, right: 24),
      child: DropdownButton<String>(
        onChanged: (value) => setState(() {
          _selectedUkuranBaju = value;
          Future.microtask(() => context.requestFocus(FocusNode()));
        }),
        value: _selectedUkuranBaju,
        items: _ukuranBaju
            .map<DropdownMenuItem<String>>((s) => DropdownMenuItem(
                  child: Text("Ukuran baju: $s"),
                  value: s,
                ))
            .toList(),
        borderRadius: BorderRadius.circular(20),
        isExpanded: true,
        underline: SizedBox.shrink(),
      ),
    );
  }

  Widget _buildNoKtpForm() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _ktp,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 26),
        labelText: "NO KTP",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(),
        ),
        // prefixIcon: Padding(
        //   padding: EdgeInsets.only(
        //     left: 15,
        //   ), // add padding to adjust icon
        //   child: Icon(Icons.phone_android_outlined),
        // ),
        //fillColor: Colors.green
      ),
      validator: (val) {
        if (val.length == 0) {
          return "Nomor KTP tidak boleh kosong";
        } else if (val.trim().length < 12) {
          return "Sepertinya tidak valid";
        } else {
          return null;
        }
      },
      style: TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }

  Widget _buildPasswordForm() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: _pass,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 28),
        labelText: "Password",
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(),
        ),
        // prefixIcon: Padding(
        //   padding: EdgeInsets.only(
        //     left: 15,
        //   ), // add padding to adjust icon
        //   child: Icon(Icons.vpn_key),
        // ),
        //fillColor: Colors.green
      ),
      validator: (val) {
        if (val.trim().length < 8) {
          return "Password minimal 8 karakter";
        } else if (val.trim().contains(' ')) {
          return "Password tidak boleh ada spasi";
        } else {
          return null;
        }
      },
      style: TextStyle(
        fontFamily: "Poppins",
      ),
    );
  }

  Widget _buildLocationButton() {
    return Material(
      elevation: 0,
      child: InkWell(
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 24),
          alignment: Alignment.centerLeft,
          height: 50,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black38),
              borderRadius: BorderRadius.circular(30)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: Text(
                "Lokasi (dummy -6.949634,107.571979)",
                maxLines: 1,
                style: TextStyle(overflow: TextOverflow.fade),
              )),
              Icon(Icons.arrow_right, size: 20)
            ],
          ),
        ),
        onTap: () {},
      ),
    );
  }
}
