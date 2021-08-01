import 'package:brn/presentation/widgets/custom_button.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AgendaUploadScreen extends StatefulWidget {
  AgendaUploadScreen({Key key}) : super(key: key);

  @override
  _AgendaUploadScreenState createState() => _AgendaUploadScreenState();
}

class _AgendaUploadScreenState extends State<AgendaUploadScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: ListView(
      children: [
        CustomTextfield(
          label: "Nama Lengkap",
          hint: "Jhone Doe",
        ),
        SizedBox(height: 30),
        CustomButton(text: "Simpan")
      ],
    ));
  }
}
