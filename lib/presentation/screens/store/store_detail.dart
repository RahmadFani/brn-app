import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/store/helper/api_helper.dart';
import 'package:brn/presentation/screens/store/models/product.dart';
import 'package:brn/presentation/screens/store/store_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreDetailScreen extends StatefulWidget {
  ProductData _productData = new ProductData();
  String token;
  StoreDetailScreen(this._productData, this.token);

  @override
  _StoreDetailScreenState createState() =>
      _StoreDetailScreenState(this._productData, this.token);
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  ProductData _productData = new ProductData();
  String token;
  _StoreDetailScreenState(this._productData, this.token);
  bool ulasan = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
      SingleChildScrollView(
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
                    height: 90,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/store_produk.png',
                        height: 300,
                        width: 300,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(_productData.title,
                      textAlign: TextAlign.left,
                      style:
                          primaryTextStyle(size: 24, weight: FontWeight.bold)),
                  Text(currencyFormat.format(int.parse(_productData.dispPrice)),
                      textAlign: TextAlign.left,
                      style:
                          primaryTextStyle(size: 18, weight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            ulasan = false;
                          });
                        },
                        child: Container(
                          height: 28,
                          width: 100,
                          alignment: Alignment(0, 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: ulasan == true
                                  ? null
                                  : LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                          Color(0xFF334263),
                                          Color(0xFF1D2C3A),
                                        ]),
                              border: ulasan != true
                                  ? null
                                  : Border.all(
                                      width: 1, color: Color(0xFF334263)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    offset: Offset(2, 4),
                                    blurRadius: 10),
                              ]),
                          child: Text(
                            "Deskripsi Produk",
                            style: TextStyle(
                                color: ulasan == true
                                    ? Color(0xFF334263)
                                    : Colors.white,
                                fontFamily: "Monserrat",
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            ulasan = true;
                          });
                        },
                        child: Container(
                          height: 28,
                          width: 100,
                          margin: EdgeInsets.only(left: 10),
                          alignment: Alignment(0, 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: ulasan == true
                                  ? LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                          Color(0xFF334263),
                                          Color(0xFF1D2C3A),
                                        ])
                                  : null,
                              color: Colors.white,
                              border: ulasan == true
                                  ? null
                                  : Border.all(
                                      width: 1, color: Color(0xFF334263)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.15),
                                    offset: Offset(2, 4),
                                    blurRadius: 10),
                              ]),
                          child: Text(
                            "Ulasan",
                            style: TextStyle(
                                color: ulasan != true
                                    ? Color(0xFF334263)
                                    : Colors.white,
                                fontFamily: "Monserrat",
                                fontSize: 11,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      RatingBar.builder(
                        initialRating: 3,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 15,
                        itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 10,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text(
                        "4.0",
                        style: TextStyle(
                            color: Colors.black87,
                            fontFamily: "Monserrat",
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ulasan != true
                      ? Container(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            _productData.description,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.black87,
                                height: 1.5,
                                fontFamily: "Monserrat",
                                fontSize: 12,
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      : Container(
                          width: width,
                          child: ListView.builder(
                              padding: EdgeInsets.all(0),
                              itemCount: 10,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      top: 10, left: 5, right: 5),
                                  width: width,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1,
                                              color: Colors.black54))),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(59),
                                          child: Image.asset(
                                              'assets/images/user_comment.png',
                                              height: 90,
                                              width: 90)),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "John Doe",
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontFamily: "Monserrat",
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          RatingBar.builder(
                                            initialRating: 3,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 15,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 2.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 10,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                            width: width * 0.6,
                                            child: Text(
                                              "👍 barang bagus sesuai di promo tokonya, hanya proses pengiriman terlalu lama, buat pelanggan pemesan hampir lupa pernah order",
                                              textAlign: TextAlign.justify,
                                              maxLines: 4,
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: "Monserrat",
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
      Container(
        height: 90,
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
              SizedBox(
                height: 25,
              ),
              StoreHeaderComponent(),
            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.bottomCenter,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: width,
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 46,
                    width: 46,
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
                    child: Icon(
                      Icons.favorite,
                      color: Colors.white,
                      size: 20,
                    )),
                InkWell(
                  onTap: () {
                    CallStoreAPI()
                        .addToCart(
                            _productData.id,
                            _productData.hasColor,
                            _productData.hasSize,
                            token)
                        .then((value) {
                      if (value) {
                        Fluttertoast.showToast(
                            msg: '${_productData.title} added to cart.');
                      } else {
                        Fluttertoast.showToast(
                            msg: 'Failed add product to cart, try again');
                      }
                    });
                  },
                  child: Container(
                      height: 46,
                      width: 46,
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
                      child: Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                        size: 20,
                      )),
                ),
              ],
            )),
      )
    ]));
  }
}
