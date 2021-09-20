import 'package:brn/presentation/screens/store/owner/chart.dart';
import 'package:brn/presentation/screens/store/store_header.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreOwnerOmzetScreen extends StatefulWidget {
  const StoreOwnerOmzetScreen({Key key}) : super(key: key);

  @override
  _StoreOwnerOmzetScreenState createState() => _StoreOwnerOmzetScreenState();
}

class _StoreOwnerOmzetScreenState extends State<StoreOwnerOmzetScreen> {
  bool ulasan = false;

  int screen = 0;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      backgroundHeigh: 160,
      appBar: [StoreHeaderComponent()],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              width: width,
              height: 50,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Omzet',
                      textAlign: TextAlign.left,
                      style: primaryTextStyle(
                          size: 14,
                          weight: FontWeight.w600,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Hari Ini',
                          textAlign: TextAlign.left,
                          style: primaryTextStyle(
                              size: 16, weight: FontWeight.w600)),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.25,
                            height: 26,
                            color: Color(0xFF9A9A9A).withOpacity(0.15),
                            alignment: Alignment(0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.black54,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Tanggal',
                                    textAlign: TextAlign.left,
                                    style: primaryTextStyle(
                                        size: 12, weight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.25,
                            height: 26,
                            color: Color(0xFF9A9A9A).withOpacity(0.15),
                            alignment: Alignment(0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.storefront,
                                  color: Colors.black54,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Barang',
                                    textAlign: TextAlign.left,
                                    style: primaryTextStyle(
                                        size: 12, weight: FontWeight.w600)),
                              ],
                            ),
                          ),
                          Container(
                            width: width * 0.25,
                            height: 26,
                            color: Color(0xFF9A9A9A).withOpacity(0.15),
                            alignment: Alignment(0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.attach_money,
                                  color: Colors.black54,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('Total Harga',
                                    textAlign: TextAlign.left,
                                    style: primaryTextStyle(
                                        size: 12, weight: FontWeight.w600)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.25,
                            height: 26,
                            alignment: Alignment(0, 0),
                            child: Text('2021/12/12',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 12, weight: FontWeight.w600)),
                          ),
                          Container(
                            width: width * 0.25,
                            height: 26,
                            alignment: Alignment(0, 0),
                            child: Text('Kijang Inova',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 12, weight: FontWeight.w600)),
                          ),
                          Container(
                            width: width * 0.25,
                            height: 26,
                            alignment: Alignment(0, 0),
                            child: Text('400.000.000',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 12, weight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.25,
                            height: 26,
                            alignment: Alignment(0, 0),
                            child: Text('2021/12/12',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 12, weight: FontWeight.w600)),
                          ),
                          Container(
                            width: width * 0.25,
                            height: 26,
                            alignment: Alignment(0, 0),
                            child: Text('Kijang Inova',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 12, weight: FontWeight.w600)),
                          ),
                          Container(
                            width: width * 0.25,
                            height: 26,
                            alignment: Alignment(0, 0),
                            child: Text('400.000.000',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 12, weight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: width * 0.25,
                            height: 26,
                            alignment: Alignment(0, 0),
                            child: Text('2021/12/12',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 12, weight: FontWeight.w600)),
                          ),
                          Container(
                            width: width * 0.25,
                            height: 26,
                            alignment: Alignment(0, 0),
                            child: Text('Kijang Inova',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 12, weight: FontWeight.w600)),
                          ),
                          Container(
                            width: width * 0.25,
                            height: 26,
                            alignment: Alignment(0, 0),
                            child: Text('400.000.000',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 12, weight: FontWeight.w600)),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Container(
                        width: width,
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              height: 26,
                              alignment: Alignment(0, 0),
                              child: Row(
                                children: [
                                  Text('Total Pendapatan Hari Ini : ',
                                      textAlign: TextAlign.left,
                                      style: primaryTextStyle(
                                          size: 12, weight: FontWeight.w400)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('1.200.000.000',
                                      textAlign: TextAlign.left,
                                      style: primaryTextStyle(
                                          size: 12, weight: FontWeight.w700)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
