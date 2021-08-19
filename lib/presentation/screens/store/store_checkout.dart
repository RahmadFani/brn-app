import 'package:brn/presentation/screens/store/store_invoice.dart';
import 'package:brn/presentation/screens/store/store_payment.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreCheckoutScreen extends StatefulWidget {
  const StoreCheckoutScreen({Key key}) : super(key: key);

  @override
  _StoreCheckoutScreenState createState() => _StoreCheckoutScreenState();
}

class _StoreCheckoutScreenState extends State<StoreCheckoutScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      body: ListView(
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
                  Text('Detail Pesanan',
                      textAlign: TextAlign.left,
                      style: primaryTextStyle(
                          size: 14,
                          weight: FontWeight.w600,
                          color: Colors.white)),
                ],
              ),
            ),
          ),
          Container(
            width: width,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            height: height * 0.9,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: Offset(2, 4),
                      blurRadius: 10),
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Alamat Pengiriman',
                    textAlign: TextAlign.left,
                    style: primaryTextStyle(
                      size: 16,
                      weight: FontWeight.w600,
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  color: Color(0xFFF3F3F3),
                  child: Row(
                    children: [
                      Container(
                        width: width - 140,
                        child: Text(
                            'JL.Kelud Raya No 32 Semarang Petampanan, Jawa Tengah 525050',
                            textAlign: TextAlign.left,
                            style: primaryTextStyle(
                              size: 14,
                              weight: FontWeight.w400,
                            )),
                      ),
                      Icon(
                        Icons.pin_drop,
                        color: Colors.black45,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Warna',
                                  textAlign: TextAlign.left,
                                  style: primaryTextStyle(
                                      size: 12, weight: FontWeight.w400)),
                              SizedBox(
                                width: 5,
                              ),
                              Text('Hitam',
                                  textAlign: TextAlign.left,
                                  style: primaryTextStyle(
                                      size: 12, weight: FontWeight.w600)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Ukuran',
                                      textAlign: TextAlign.left,
                                      style: primaryTextStyle(
                                          size: 12, weight: FontWeight.w400)),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text('L',
                                      textAlign: TextAlign.left,
                                      style: primaryTextStyle(
                                          size: 12, weight: FontWeight.w600)),
                                ],
                              ),
                              Text('Rp. 200.000',
                                  textAlign: TextAlign.left,
                                  style: primaryTextStyle(
                                      size: 14, weight: FontWeight.w600)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: width,
                  height: 45,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      color: Color(0xFFF3F3F3),
                      border: Border.all(width: 1, color: Color(0xFFC4C4C4))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Pilih Pengiriman',
                          textAlign: TextAlign.left,
                          style: primaryTextStyle(
                              size: 16,
                              color: Color(0xFF494949),
                              weight: FontWeight.w600)),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xFF494949),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Melalui Kurir',
                    textAlign: TextAlign.left,
                    style: primaryTextStyle(size: 16, weight: FontWeight.w400)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('JNT EXPRESS',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w700)),
                    Text('Rp. 20.000',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w700)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => StorePaymentScreen(),
                      ),
                    );
                  },
                  child: Container(
                    width: width,
                    height: 45,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        color: Color(0xFFF3F3F3),
                        border: Border.all(width: 1, color: Color(0xFFC4C4C4))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Pilih Pembayaran',
                            textAlign: TextAlign.left,
                            style: primaryTextStyle(
                                size: 16,
                                color: Color(0xFF494949),
                                weight: FontWeight.w600)),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color(0xFF494949),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Transfer Bank',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w700)),
                    Image.asset('assets/images/bca.png', height: 70),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  height: 2,
                  color: Color(0xFFC4C4C4),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Jumlah Produk',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w400)),
                    Text('x 10',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w700)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Total Harga',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w400)),
                    Text('Rp. 200.000.000',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w700)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Biaya Admin',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w400)),
                    Text('Rp. 500.000',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w700)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Ongkos Kirim',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w400)),
                    Text('Rp. 200.000',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w700)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Total Pembayaran',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w400)),
                    Text('Rp. 200.000.000',
                        textAlign: TextAlign.left,
                        style: primaryTextStyle(
                            size: 14, weight: FontWeight.w700)),
                  ],
                ),
                SizedBox(
                  height: 30,
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
                    child: Text('BAYAR',
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
        ],
      ),
    );
  }
}
