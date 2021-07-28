import 'package:brn/config/constants.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/profile/setting_card.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class EditPersonalInformationScreen extends StatefulWidget {
  @override
  _EditPersonalInformationScreenState createState() =>
      _EditPersonalInformationScreenState();
}

class _EditPersonalInformationScreenState
    extends State<EditPersonalInformationScreen> {
  TextEditingController _nameController =
      TextEditingController(text: 'Jhon Se Exam');
  TextEditingController _phoneNumberController =
      TextEditingController(text: '+6218123123123123');
  TextEditingController _emailController =
      TextEditingController(text: 'example.dev@gmail.com');

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: [
        SimpleAppBarTitle(title: 'Data Pribadi'),
        Text(
          'Simpan',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
      body: Column(
        children: [
          SettingCard(
            child: Column(
              children: [
                SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
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
                SizedBox(height: 25),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    labelText: "Nomor Telepon",
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
                SizedBox(height: 25),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    labelText: "Email",
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
              ],
            ),
          ),
          SizedBox(height: kPaddingL),
        ],
      ),
    );
  }
}
