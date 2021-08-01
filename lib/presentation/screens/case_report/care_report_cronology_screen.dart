import 'package:brn/presentation/widgets/custom_button.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/custom_textfield.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class CareReportCronologyScreen extends StatefulWidget {
  CareReportCronologyScreen({Key key}) : super(key: key);

  @override
  _CareReportCronologyScreenState createState() =>
      _CareReportCronologyScreenState();
}

class _CareReportCronologyScreenState extends State<CareReportCronologyScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return CustomScaffold(
      appBar: [
        SimpleAppBarTitle(title: 'Kronolgi Kejadian'),
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
                    label: "Tanggal Lapor",
                    hint: "2021-01-01",
                    height: 40,
                  ),
                  SizedBox(height: 27),
                  CustomTextfield(
                    label: "Lokasi GPR Terakhir",
                    hint: "-6.9255827,107.5662422",
                    height: 40,
                  ),
                  SizedBox(height: 27),
                  CustomTextfield(
                    label: "Kronologi",
                    hint:
                        "Satreskrim Jakarta Barat berhasil mengungkap kelompok penggelapan mobil rental yang diawaki oleh dua orang wanita yang menggunakan identitas palsu, ujar Kasatreskrim Polres Jakarta Barat, Kompol Teuku Arsya dalam konferensi pers Kamis (19/11/2020).",
                    height: 40,
                  ),
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
