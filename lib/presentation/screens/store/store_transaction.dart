import 'package:brn/presentation/screens/store/store_header.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreTransactionScreen extends StatefulWidget {
  const StoreTransactionScreen({Key key}) : super(key: key);

  @override
  _StoreTransactionScreenState createState() => _StoreTransactionScreenState();
}

class _StoreTransactionScreenState extends State<StoreTransactionScreen> {
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
                  Text('Transaksi',
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
          Container(
            height: 70,
            width: width,
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      screen = 1;
                    });
                  },
                  child: Container(
                    height: 68,
                    width: 68,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.wallet_travel,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Belum Dibayar",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Monserrat",
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screen = 2;
                    });
                  },
                  child: Container(
                    height: 68,
                    width: 68,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFF46FFDE),
                              Color(0xFF00D2A0),
                            ]),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(2, 4),
                              blurRadius: 10),
                        ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.backpack,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Dikemas",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Monserrat",
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screen = 3;
                    });
                  },
                  child: Container(
                    height: 68,
                    width: 68,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Color(0xFFFB433D),
                              Color(0xFFFBBB3F),
                            ]),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(2, 4),
                              blurRadius: 10),
                        ]),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.delivery_dining,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Dikirim",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Monserrat",
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      screen = 0;
                    });
                  },
                  child: Container(
                    height: 68,
                    width: 68,
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            "Selesai",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Monserrat",
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          screen == 0
              ? Text('Transaksi Terakhir',
                  textAlign: TextAlign.left,
                  style: primaryTextStyle(size: 14, weight: FontWeight.w600))
              : screen == 1
                  ? Text('Belum Dibayar',
                      textAlign: TextAlign.left,
                      style:
                          primaryTextStyle(size: 14, weight: FontWeight.w600))
                  : screen == 2
                      ? Text('Dikemas',
                          textAlign: TextAlign.left,
                          style: primaryTextStyle(
                              size: 14, weight: FontWeight.w600))
                      : screen == 3
                          ? Text('Dikirim',
                              textAlign: TextAlign.left,
                              style: primaryTextStyle(
                                  size: 14, weight: FontWeight.w600))
                          : Container(),
          screen == 0
              ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(20),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        width: width,
                        child: Card(
                          child: ListTile(
                            leading: Container(
                              height: 84,
                              width: 84,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'assets/images/store_produk.png',
                                  height: 84,
                                  width: 84,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            isThreeLine: true,
                            title: Text('Mobil Kijang',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 14, weight: FontWeight.w600)),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('10. Januari 2021',
                                    textAlign: TextAlign.left,
                                    style: primaryTextStyle(
                                        size: 12, weight: FontWeight.w600)),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Rp. 200.000',
                                    textAlign: TextAlign.left,
                                    style: primaryTextStyle(
                                        size: 14, weight: FontWeight.w600)),
                              ],
                            ),
                            trailing: Container(
                              height: 40,
                              width: 60,
                              alignment: Alignment(0, 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF2F3E5B),
                                        Color(0xFF202F3F),
                                      ]),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        offset: Offset(2, 4),
                                        blurRadius: 10),
                                  ]),
                              child: Text(
                                "Beli Lagi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Monserrat",
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : screen == 1
                  ? Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.all(20),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Container(
                            height: 100,
                            width: width,
                            child: Card(
                              child: ListTile(
                                leading: Container(
                                  height: 84,
                                  width: 84,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'assets/images/store_produk.png',
                                      height: 84,
                                      width: 84,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                isThreeLine: true,
                                title: Text('Mobil Kijang',
                                    textAlign: TextAlign.left,
                                    style: primaryTextStyle(
                                        size: 14, weight: FontWeight.w600)),
                                subtitle: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('10. Januari 2021',
                                        textAlign: TextAlign.left,
                                        style: primaryTextStyle(
                                            size: 12, weight: FontWeight.w600)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text('Rp. 200.000',
                                        textAlign: TextAlign.left,
                                        style: primaryTextStyle(
                                            size: 14, weight: FontWeight.w600)),
                                  ],
                                ),
                                trailing: Container(
                                  height: 40,
                                  width: 60,
                                  alignment: Alignment(0, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFF2F3E5B),
                                            Color(0xFF202F3F),
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.15),
                                            offset: Offset(2, 4),
                                            blurRadius: 10),
                                      ]),
                                  child: Text(
                                    "Bayar",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Monserrat",
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : screen == 2
                      ? Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(20),
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 100,
                                width: width,
                                child: Card(
                                  child: ListTile(
                                    leading: Container(
                                      height: 84,
                                      width: 84,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/images/store_produk.png',
                                          height: 84,
                                          width: 84,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    isThreeLine: true,
                                    title: Text('Mobil Kijang',
                                        textAlign: TextAlign.left,
                                        style: primaryTextStyle(
                                            size: 14, weight: FontWeight.w600)),
                                    subtitle: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('10. Januari 2021',
                                            textAlign: TextAlign.left,
                                            style: primaryTextStyle(
                                                size: 12,
                                                weight: FontWeight.w600)),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Rp. 200.000',
                                            textAlign: TextAlign.left,
                                            style: primaryTextStyle(
                                                size: 14,
                                                weight: FontWeight.w600)),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : screen == 3
                          ? Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.all(20),
                                itemCount: 10,
                                itemBuilder: (context, index) {
                                  return Container(
                                    height: 100,
                                    width: width,
                                    child: Card(
                                      child: ListTile(
                                        leading: Container(
                                          height: 84,
                                          width: 84,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              'assets/images/store_produk.png',
                                              height: 84,
                                              width: 84,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        isThreeLine: true,
                                        title: Text('Mobil Kijang',
                                            textAlign: TextAlign.left,
                                            style: primaryTextStyle(
                                                size: 14,
                                                weight: FontWeight.w600)),
                                        subtitle: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('10. Januari 2021',
                                                textAlign: TextAlign.left,
                                                style: primaryTextStyle(
                                                    size: 12,
                                                    weight: FontWeight.w600)),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text('Rp. 200.000',
                                                textAlign: TextAlign.left,
                                                style: primaryTextStyle(
                                                    size: 14,
                                                    weight: FontWeight.w600)),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : Container(),
        ],
      ),
    );
  }
}
