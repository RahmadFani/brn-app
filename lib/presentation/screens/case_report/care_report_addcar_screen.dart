import 'package:brn/presentation/widgets/custom_addfile.dart';
import 'package:brn/presentation/widgets/custom_button.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/custom_textfield.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class CareReportAddcarScreen extends StatefulWidget {
  CareReportAddcarScreen({Key key}) : super(key: key);

  @override
  _CareReportAddcarScreenState createState() => _CareReportAddcarScreenState();
}

class _CareReportAddcarScreenState extends State<CareReportAddcarScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      appBar: [
        SimpleAppBarTitle(title: 'Tambah Data Kendaraan'),
      ],
      body: Container(
        height: height,
        width: width,
        color: Colors.white,
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
                    label: "Nomor Polisi",
                    hint: "F 1212 GH",
                    height: 40,
                  ),
                  SizedBox(height: 27),
                  CustomTextfield(
                    label: "Merek Kendaraan",
                    hint: "Honda",
                    height: 40,
                  ),
                  SizedBox(height: 27),
                  CustomAddfile(
                    text: "Upload STNK",
                  ),
                  Container(
                    height: 91,
                    width: 151,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.asset(
                      'assets/images/stnk.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 27),
                  CustomAddfile(
                    text: "Upload Foto Kendaraan",
                  ),
                  Container(
                      height: 95,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 90,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset(
                                'assets/images/mobile1.png',
                                fit: BoxFit.cover,
                              ),
                            );
                          })),
                ],
              ),
            ),
            SizedBox(height: 30),
            CustomButton(text: "Lanjutkan")
          ],
        ),
      ),
    );
  }
}
