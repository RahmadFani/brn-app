import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/store/store_checkout.dart';
import 'package:brn/presentation/screens/store/store_header.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreCartScreen extends StatefulWidget {
  const StoreCartScreen({Key key}) : super(key: key);

  @override
  _StoreCartScreenState createState() => _StoreCartScreenState();
}

class _StoreCartScreenState extends State<StoreCartScreen> {
  bool ulasan = false;
  List<bool> _isChecked;
  List<int> qty;
  int _count = 0;

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(10, false);
    qty = List<int>.filled(10, 1);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(children: [
      Scrollbar(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                      primaryDarkColor,
                      primaryColor,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                    bottomRight: Radius.circular(55),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 130,
                    ),
                    Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        padding: EdgeInsets.all(0),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 150,
                            width: width,
                            margin: EdgeInsets.only(bottom: 10),
                            child: Card(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
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
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text('Warna',
                                                textAlign: TextAlign.left,
                                                style: primaryTextStyle(
                                                    size: 12,
                                                    weight: FontWeight.w400)),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text('Hitam',
                                                textAlign: TextAlign.left,
                                                style: primaryTextStyle(
                                                    size: 12,
                                                    weight: FontWeight.w600)),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Text('Ukuran',
                                                    textAlign: TextAlign.left,
                                                    style: primaryTextStyle(
                                                        size: 12,
                                                        weight: FontWeight.w400)),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text('L',
                                                    textAlign: TextAlign.left,
                                                    style: primaryTextStyle(
                                                        size: 12,
                                                        weight: FontWeight.w600)),
                                              ],
                                            ),
                                            Text('Rp. 200.000',
                                                textAlign: TextAlign.left,
                                                style: primaryTextStyle(
                                                    size: 14,
                                                    weight: FontWeight.w600)),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Checkbox(
                                        checkColor:
                                            Colors.white, // color of tick Mark
                                        activeColor: Color(0xFF14B4F9),
                                        value: _isChecked[index],
                                        onChanged: (val) {
                                          setState(
                                            () {
                                              _isChecked[index] = val;
                                            },
                                          );
                                        },
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: Color(0xFFA1A1A1)),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.delete_forever,
                                                  color: Color(0xFFA1A1A1),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text('Delete',
                                                    textAlign: TextAlign.left,
                                                    style: primaryTextStyle(
                                                        color: Color(0xFFA1A1A1),
                                                        size: 10,
                                                        weight: FontWeight.w600)),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 2,
                                                  color: Color(0xFFA1A1A1)),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      right: BorderSide(
                                                          width: 2,
                                                          color:
                                                              Color(0xFFA1A1A1)),
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    child: Icon(Icons.remove),
                                                    onTap: () => setState(() {
                                                      final newValue =
                                                          qty[index] - 1;
                                                      qty[index] =
                                                          newValue.clamp(0, 100);
                                                    }),
                                                  ),
                                                ),
                                                Container(
                                                    width: 30,
                                                    alignment: Alignment(0, 0),
                                                    child: Text(
                                                        qty[index].toString())),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                      left: BorderSide(
                                                          width: 2,
                                                          color:
                                                              Color(0xFFA1A1A1)),
                                                    ),
                                                  ),
                                                  child: InkWell(
                                                    child: Icon(Icons.add),
                                                    onTap: () => setState(() {
                                                      final newValue =
                                                          qty[index] + 1;
                                                      qty[index] =
                                                          newValue.clamp(0, 100);
                                                    }),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(height: 150,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      Container(
        height: 130,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [
              primaryDarkColor,
              primaryColor,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Keranjang',
                          textAlign: TextAlign.left,
                          style: primaryTextStyle(
                              weight: FontWeight.bold, color: Colors.white)),
                    ],
                  ),
                ),
              ),
              StoreHeaderComponent(),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          child: Container(
              height: 140,
              width: width,
              decoration: BoxDecoration(color: Colors.white, 
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: Offset(0, -2))
              ]),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => StoreCheckoutScreen(),
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
                      child: Text('CHECKOUT',
                          textAlign: TextAlign.left,
                          style: primaryTextStyle(
                              size: 18,
                              color: Colors.white,
                              weight: FontWeight.w600)),
                    ),
                  ),
                ],
              )),
        ),
      )
    ]));
  }
}
