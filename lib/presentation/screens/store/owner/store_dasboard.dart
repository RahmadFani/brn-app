import 'package:brn/presentation/screens/store/owner/chart.dart';
import 'package:brn/presentation/screens/store/owner/store_omzet.dart';
import 'package:brn/presentation/screens/store/owner/store_product.dart';
import 'package:brn/presentation/screens/store/owner/store_sales.dart';
import 'package:brn/presentation/screens/store/store_header.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreOwnerDashboardScreen extends StatefulWidget {
  const StoreOwnerDashboardScreen({Key key}) : super(key: key);

  @override
  _StoreOwnerDashboardScreenState createState() =>
      _StoreOwnerDashboardScreenState();
}

class _StoreOwnerDashboardScreenState extends State<StoreOwnerDashboardScreen> {
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
                  Text('Dashboard',
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
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => StoreOwnerSalesScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 91,
                    width: width * 0.4,
                    padding: EdgeInsets.all(17),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF22D6C4),
                              Color(0xFF3491D2),
                            ]),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(2, 4),
                              blurRadius: 10),
                        ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.bookmark,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "875 Pcs",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Monserrat",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Item Terjual",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Monserrat",
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  ),
                ),
                Container(
                  height: 91,
                  width: width * 0.4,
                  padding: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF54D234),
                            Color(0xFF007CEF),
                          ]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: Offset(2, 4),
                            blurRadius: 10),
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.money,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "871.000.000",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Monserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Omzet Hari Ini",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Monserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => StoreOwnerOmzetScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 91,
                    width: width * 0.4,
                    padding: EdgeInsets.all(17),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFEFBA00),
                              Color(0xFFEFBA00),
                            ]),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(2, 4),
                              blurRadius: 10),
                        ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.trending_up,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                "1.280.7293.894",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Monserrat",
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Akm. Omzet",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Monserrat",
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        ]),
                  ),
                ),
                Container(
                  height: 91,
                  width: width * 0.4,
                  padding: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF14B4F9),
                            Color(0xFF3491D2),
                          ]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: Offset(2, 4),
                            blurRadius: 10),
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.people,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Text(
                              "2.300.000",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Monserrat",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "Total Pelanggan",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: "Monserrat",
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                      ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text('Statistik Laporan Penjualan',
              textAlign: TextAlign.left,
              style: primaryTextStyle(size: 14, weight: FontWeight.w600)),
          SizedBox(
            height: 15,
          ),
          LineChartSample1(),
        ],
      ),
      bottomNav: Container(
        height: 100,
        width: width,
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => StoreOwnerProductScreen(),
                  ),
                );
              },
              child: Container(
                height: 47,
                width: 47,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(47),
                    color: Color(0xFF1C2B38)),
                alignment: Alignment(0, 0),
                child: Icon(
                  Icons.add_box,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
