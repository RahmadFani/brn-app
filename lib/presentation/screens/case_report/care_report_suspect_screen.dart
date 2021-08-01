import 'package:brn/presentation/widgets/custom_addfile.dart';
import 'package:brn/presentation/widgets/custom_button.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/custom_textfield.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class CareReportSuspectScreen extends StatefulWidget {
  CareReportSuspectScreen({Key key}) : super(key: key);

  @override
  _CareReportSuspectScreenState createState() =>
      _CareReportSuspectScreenState();
}

class _CareReportSuspectScreenState extends State<CareReportSuspectScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      appBar: [
        SimpleAppBarTitle(title: 'Tambah Data Pelaku'),
      ],
      body: Container(
        height: height,
        width: width,
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextfield(
                    label: "Nomor Pelaku",
                    hint: "Jhon Doe",
                    height: 40,
                  ),
                  SizedBox(height: 27),
                  CustomTextfield(
                    label: "Alamat",
                    hint: "jl.Sultan Agung No. 900 Madura",
                    height: 80,
                  ),
                  SizedBox(height: 27),
                  CustomTextfield(
                    label: "Nomor Telepon",
                    hint: "08126738362",
                    height: 40,
                  ),
                  SizedBox(height: 27),
                  CustomAddfile(
                    text: "Upload KTP",
                  ),
                  SizedBox(height: 27),
                  CustomAddfile(
                    text: "Upload Barang Bukti",
                  ),
                  SizedBox(height: 27),
                  CustomAddfile(
                    text: "Foto Pelaku",
                  ),
                  SizedBox(height: 27),
                  CustomTextfield(
                    label: "Keterangan",
                    hint:
                        "Pelaku berpakaian Hitam, tinggi 180cm, kulit sawo matang",
                    height: 80,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            CustomButton(text: "Kirim")
          ],
        ),
      ),
    );
  }
}
