import 'package:brn/presentation/screens/store/store_header.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({Key key}) : super(key: key);

  @override
  _StoreDetailScreenState createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  bool ulasan = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      appBar: [StoreHeaderComponent()],
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(
            height: 21,
          ),
          Container(
            height: 262,
            width: 231,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/store_produk.png',
                height: 262,
                width: 231,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text('Mobil Kijang',
              textAlign: TextAlign.left,
              style: primaryTextStyle(size: 24, weight: FontWeight.w600)),
          Text('Rp. 200.000.000',
              textAlign: TextAlign.left,
              style: primaryTextStyle(size: 18, weight: FontWeight.w600)),
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
                          : Border.all(width: 1, color: Color(0xFF334263)),
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
                        color:
                            ulasan == true ? Color(0xFF334263) : Colors.white,
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
                          : Border.all(width: 1, color: Color(0xFF334263)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            offset: Offset(2, 4),
                            blurRadius: 10),
                      ]),
                  child: Text(
                    "Ulasan",
                    style: TextStyle(
                        color:
                            ulasan != true ? Color(0xFF334263) : Colors.white,
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
            height: 20,
          ),
          ulasan != true
              ? Container(
                  child: Text(
                    "kijang inova (E/J), etios valco, grand avega, new saga, link, new galant, waja, familia, odyssey, new laser, grandis, yaris, new vios, previa, new lancer, wish, laser sonic, gala, champ, new crv, hrv, new civic, accent, verna, cakra, excel, matrix, mazda2, mazda3, mazda 5 dll Note : (pengiriman hanya bisa lewat grab / gojek )",
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
                  height: height * 0.6,
                  child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(top: 10),
                          width: width,
                          height: 100,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1, color: Colors.black54))),
                          child: Row(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(59),
                                  child: Image.asset(
                                      'assets/images/user_comment.png',
                                      height: 59,
                                      width: 59)),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "John Doe",
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "Monserrat",
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(width: 5),
                                  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 15,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 10,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  ),
                                  SizedBox(width: 5),
                                  Container(
                                    width: width * 0.64,
                                    child: Text(
                                      "👍barang bagus sesuai di promo tokonya, hanya proses pengiriman terlalu lama, buat pelanggan pemesan hampir lupa pernah order",
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
      bottomNav: Container(
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
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 20,
                )),
          ],
        ),
      ),
    );
  }
}
