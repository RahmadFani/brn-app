import 'package:brn/config/constants.dart';
import 'package:brn/presentation/widgets/custom_addfile.dart';
import 'package:brn/presentation/widgets/custom_button.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/custom_textfield.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class CarScreenAdd extends StatefulWidget {
  CarScreenAdd({Key key}) : super(key: key);

  @override
  _CarScreenAddState createState() => _CarScreenAddState();
}

class _CarScreenAddState extends State<CarScreenAdd> {
  bool activeDetail = true;
  bool activeKelengkapan = false;
  bool activeFoto = false;

  changeMenu(String menu) {
    if (menu == "detail") {
      setState(() {
        activeDetail = true;
        activeKelengkapan = false;
        activeFoto = false;
      });
    } else if (menu == "kelengkapan") {
      setState(() {
        activeDetail = false;
        activeKelengkapan = true;
        activeFoto = false;
      });
    } else {
      setState(() {
        activeDetail = false;
        activeKelengkapan = false;
        activeFoto = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return CustomScaffold(
      appBar: [
        SimpleAppBarTitle(title: 'Detail Kendaraan'),
      ],
      body: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white,
        ),
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 28.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  InkWell(
                    onTap: () {
                      changeMenu('detail');
                    },
                    child: filter(
                      label: 'Detail',
                      active: activeDetail,
                    ),
                  ),
                  InkWell(
                      onTap: () {
                        changeMenu('kelengkapan');
                      },
                      child: filter(
                          label: 'Kelengkapan Data',
                          active: activeKelengkapan)),
                  InkWell(
                      onTap: () {
                        changeMenu('foto');
                      },
                      child: filter(label: 'Foto', active: activeFoto)),
                ],
              ),
            ),
            SizedBox(height: 27),
            activeDetail == true
                ? Container(
                    height: height,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextfield(
                          label: "Nomor Polisi",
                          hint: "Contoh : B 124G GH",
                        ),
                        SizedBox(height: 27),
                        CustomTextfield(
                          label: "Merek Kendaraan",
                          hint: "Contoh : Honda",
                        ),
                      ],
                    ),
                  )
                : Container(),
            activeKelengkapan == true
                ? Container(
                    height: height,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAddfile(
                            text: "Foto Tampak depan STNK",
                            icon: Icons.add_a_photo),
                        SizedBox(height: 27),
                        CustomAddfile(
                            text: "Foto Belakang depan STNK",
                            icon: Icons.add_a_photo),
                      ],
                    ),
                  )
                : Container(),
            activeFoto == true
                ? Container(
                    height: height,
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAddfile(
                            text: "Foto Tampak depan Mobil",
                            icon: Icons.add_a_photo),
                        SizedBox(height: 27),
                        CustomAddfile(
                            text: "Foto Tampak Belakang Mobil",
                            icon: Icons.add_a_photo),
                        SizedBox(height: 27),
                        CustomAddfile(
                            text: "Foto Tampak Dalam Depan Mobil",
                            icon: Icons.add_a_photo),
                        SizedBox(height: 27),
                        CustomAddfile(
                            text: "Foto Tampak Dalam Belakang Mobil",
                            icon: Icons.add_a_photo),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(height: 30),
            CustomButton(text: "Simpan")
          ],
        ),
      ),
    );
  }

  Container filter({@required String label, bool active = false}) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: const EdgeInsets.only(right: 20),
      decoration: active
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff334263),
                  Color(0xff334263).withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(4),
            )
          : BoxDecoration(),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : Color(0xff9A9A9A),
          ),
        ),
      ),
    );
  }
}
