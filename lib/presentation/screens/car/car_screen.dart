import 'dart:convert';
import 'dart:io';

import 'package:brn/config/constants.dart';
import 'package:brn/config/ip.dart';
import 'package:brn/model/mobil.dart';
import 'package:brn/presentation/component/shimmer_dark.dart';
import 'package:brn/presentation/screens/car/add_car_screen.dart';
import 'package:brn/presentation/screens/car/edit_car-screen.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/presentation/widgets/custom_modal_bottom_sheet.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  bool loading = true;

  List<MobilModel> mobil = [];
  getData() async {
    Uri url = Uri.parse(IpClass().getip2() + '/api/cars');
    final response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
      HttpHeaders.authorizationHeader:
          "Bearer 52|TZGwG1B0tyyApzo1Qh3S1htSEq8GsTxLIjAJ1M1X",
    });
    final res = json.decode(response.body);
    if (mounted) {
      setState(() {
        for (Map data in res['data']) {
          mobil.add(MobilModel.fromJson(data));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return CustomScaffold(
      appBar: [
        SimpleAppBarTitle(title: 'Data Kendaraan'),
        Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(width: kPaddingS),
            GestureDetector(
              onTap: () {
                showCustomModalBottomSheet(
                  context,
                  expanded: false,
                  body: filter(),
                );
              },
              child: Icon(
                Icons.subject,
                color: Colors.white,
              ),
            ),
            SizedBox(width: kPaddingS),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CarScreenAdd(),
                  ),
                );
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        )
      ],
      body: loading == true
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: width,
                  color: Colors.white,
                  child: ShimmerDark(
                    height: 200,
                    width: width,
                  ),
                );
              })
          : ListView.builder(
              itemCount: mobil.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    shadowColor: Colors.grey.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 210,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: 
                                
                                Image.asset(
                                  'assets/images/audi.jpeg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: kPaddingS,
                              right: kPaddingS,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    height: 38,
                                    width: 38,
                                    child: PrimaryButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (ctx) => CarScreenEdit(),
                                          ),
                                        );
                                      },
                                      color: Color(0xff0A4788),
                                      child:
                                          Icon(Icons.edit, color: Colors.white),
                                    ),
                                  ),
                                  SizedBox(
                                    width: kPaddingXS,
                                  ),
                                  SizedBox(
                                    height: 38,
                                    width: 38,
                                    child: PrimaryButton(
                                      onPressed: () {},
                                      color: Color(0xffFB433D),
                                      child: Icon(Icons.delete,
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                            kPaddingM,
                            kPaddingM - 6,
                            kPaddingM,
                            kPaddingM,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'AUDI - 118D',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'G 5557 TH',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              FittedBox(
                                child: Text(
                                  'Thn. 2018',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
    );
  }

  Widget filter() {
    return Column(
      children: [
        TitleAuth('Filter'),
        Row(
          children: [
            Expanded(
              child: choicheDonationItem(
                'Semua',
                onTap: () {},
              ),
            ),
            SizedBox(width: kPaddingM),
            Expanded(
              child: choicheDonationItem(
                'Lapor',
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: kPaddingM),
        Row(
          children: [
            Expanded(
              child: choicheDonationItem(
                'Proses',
                onTap: () {},
              ),
            ),
            SizedBox(width: kPaddingM),
            Expanded(
              child: choicheDonationItem(
                'Tidak ditemukan',
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: kPaddingM),
        Row(
          children: [
            Expanded(
              child: choicheDonationItem(
                'Selesai',
                onTap: () {},
              ),
            ),
            SizedBox(width: kPaddingM),
            Expanded(
              child: choicheDonationItem(
                'Terbaru',
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: kPaddingM * 2),
        PrimaryButton(
          onPressed: () {},
          text: 'Terapkan',
        ),
        SizedBox(height: 40),
      ],
    );
  }

  Widget choicheDonationItem(String text, {@required Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}

class CarItem extends StatelessWidget {
  const CarItem({
    Key key,
  }) : super(key: key);

  void donationDetail(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => donationDetail(context),
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 210,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/audi.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: kPaddingS,
                  right: kPaddingS,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: PrimaryButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => CarScreenEdit(),
                              ),
                            );
                          },
                          color: Color(0xff0A4788),
                          child: Icon(Icons.edit, color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        width: kPaddingXS,
                      ),
                      SizedBox(
                        height: 38,
                        width: 38,
                        child: PrimaryButton(
                          onPressed: () {},
                          color: Color(0xffFB433D),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                kPaddingM,
                kPaddingM - 6,
                kPaddingM,
                kPaddingM,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'AUDI - 118D',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'G 5557 TH',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  FittedBox(
                    child: Text(
                      'Thn. 2018',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
