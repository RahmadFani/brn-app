import 'package:brn/presentation/screens/store/store_payment.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreInvoiceScreen extends StatefulWidget {
  const StoreInvoiceScreen({Key key}) : super(key: key);

  @override
  _StoreInvoiceScreenState createState() => _StoreInvoiceScreenState();
}

class _StoreInvoiceScreenState extends State<StoreInvoiceScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      backgroundHeigh: 200,
      body: Column(
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
                  Text('Lakukan Pembayaran',
                      textAlign: TextAlign.left,
                      style: primaryTextStyle(
                          size: 14,
                          weight: FontWeight.w600,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
          Expanded(
              child: SingleChildScrollView(
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              width: width,
              margin: EdgeInsets.all(20),
              // padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.15),
                        offset: Offset(0, 4),
                        blurRadius: 10),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 78,
                    width: width,
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0, 2),
                              blurRadius: 2),
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/invoice_screen.png',
                            height: 58, width: 58),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Segera Lakukan Pembayaran Sebelum',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 10, weight: FontWeight.w700)),
                            Text('Senin, 29 Maret 2021, 12.34 WIB',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 10, weight: FontWeight.w400)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 230,
                    width: width,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(0, 4),
                              blurRadius: 10),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Pembayaran',
                            textAlign: TextAlign.left,
                            style: primaryTextStyle(
                                size: 12, weight: FontWeight.w400)),
                        Text('Bring back our car',
                            textAlign: TextAlign.left,
                            style: primaryTextStyle(
                                size: 14, weight: FontWeight.w400)),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Pembayaran melalui transfer Bank BCA',
                            textAlign: TextAlign.left,
                            style: primaryTextStyle(
                                size: 12, weight: FontWeight.w400)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/bca.png', height: 52),
                            Image.asset('assets/images/barcode.png',
                                height: 55),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Nomor Rekening',
                                    textAlign: TextAlign.left,
                                    style: primaryTextStyle(
                                        size: 12, weight: FontWeight.w400)),
                                Text('166542168215151',
                                    textAlign: TextAlign.left,
                                    style: primaryTextStyle(
                                        size: 12, weight: FontWeight.w700)),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          height: 2,
                        ),
                        Text('Jumlah yang Harus Dibayarkan',
                            textAlign: TextAlign.left,
                            style: primaryTextStyle(
                                size: 12, weight: FontWeight.w400)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Rp. 200.000.000',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 16, weight: FontWeight.w700)),
                            Text('Salin',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    color: Color(0xFF1E95A8),
                                    size: 16,
                                    weight: FontWeight.w400)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  IntrinsicHeight(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text('Paduan Pembayaran',
                              textAlign: TextAlign.left,
                              style: primaryTextStyle(
                                  size: 14, weight: FontWeight.w600)),
                          SizedBox(
                            height: 20,
                          ),
                          ExpansionTile(
                            title: Text('Transfer ATM',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 14, weight: FontWeight.w600)),
                            children: [
                              Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                                  textAlign: TextAlign.left,
                                  style: primaryTextStyle(
                                      size: 12, weight: FontWeight.w400)),
                            ],
                          ),
                          ExpansionTile(
                            title: Text('Mobile Banking',
                                textAlign: TextAlign.left,
                                style: primaryTextStyle(
                                    size: 14, weight: FontWeight.w600)),
                            children: [
                              Text(
                                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
                                  textAlign: TextAlign.left,
                                  style: primaryTextStyle(
                                      size: 12, weight: FontWeight.w400)),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => StoreInvoiceScreen(),
                                ),
                              );
                            },
                            child: Container(
                              height: 46,
                              width: width,
                              margin: EdgeInsets.only(left: 10),
                              alignment: Alignment(0, 0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(46),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xFF334263),
                                        Color(0xFF1D2C3A),
                                      ]),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.15),
                                        offset: Offset(2, 4),
                                        blurRadius: 10),
                                  ]),
                              child: Text('Selesai',
                                  textAlign: TextAlign.left,
                                  style: primaryTextStyle(
                                      size: 18,
                                      color: Colors.white,
                                      weight: FontWeight.w600)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
