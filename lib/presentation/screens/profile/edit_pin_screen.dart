import 'package:brn/config/constants.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/profile/setting_card.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class EditPinScreen extends StatefulWidget {
  @override
  _EditPinScreenState createState() => _EditPinScreenState();
}

class _EditPinScreenState extends State<EditPinScreen> {
  TextEditingController _newPinController = TextEditingController();
  TextEditingController _repeatNewPinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundHeigh: MediaQuery.of(context).size.height * 0.6,
      appBar: [
        SimpleAppBarTitle(title: 'Ubah Pin'),
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
                  controller: _newPinController,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    labelText: "PIN",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                ),
                SizedBox(height: 25),
                TextFormField(
                  controller: _repeatNewPinController,
                  obscureText: true,
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
