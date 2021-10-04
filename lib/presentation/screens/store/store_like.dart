import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/store/store_header.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreLikeScreen extends StatefulWidget {
  const StoreLikeScreen({Key key}) : super(key: key);

  @override
  _StoreLikeScreenState createState() => _StoreLikeScreenState();
}

class _StoreLikeScreenState extends State<StoreLikeScreen> {
  bool ulasan = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                    height: 130,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(0),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 100,
                        margin: EdgeInsets.only(bottom: 5),
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
                                            size: 12, weight: FontWeight.w600)),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFF22D6C4)),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFF3491D2)),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: Color(0xFFFB433D)),
                                    ),
                                  ],
                                ),
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
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xFFFB433D)),
                              child: Icon(
                                Icons.remove,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
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
                      Text('Favorite',
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
    ]));
  }
}
