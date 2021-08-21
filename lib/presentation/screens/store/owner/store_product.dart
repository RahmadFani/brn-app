import 'package:brn/presentation/screens/store/owner/chart.dart';
import 'package:brn/presentation/screens/store/owner/store_product_add.dart';
import 'package:brn/presentation/screens/store/store_header.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreOwnerProductScreen extends StatefulWidget {
  const StoreOwnerProductScreen({Key key}) : super(key: key);

  @override
  _StoreOwnerProductScreenState createState() =>
      _StoreOwnerProductScreenState();
}

class _StoreOwnerProductScreenState extends State<StoreOwnerProductScreen> {
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
              padding: EdgeInsets.only(right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Daftar Product (21)',
                          textAlign: TextAlign.left,
                          style: primaryTextStyle(
                              size: 14,
                              weight: FontWeight.w600,
                              color: Colors.white)),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => StoreOwnerProductAddScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 42,
                      // width: 42,
                      alignment: Alignment(0, 0),
                      padding: EdgeInsets.only(right: 10, left: 10),

                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: Text('Tambah Produk',
                          textAlign: TextAlign.left,
                          style: primaryTextStyle(
                              size: 14, weight: FontWeight.w600)),
                    ),
                  ),
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
                  height: 100,
                  width: width,
                  child: Card(
                    child: ListTile(
                      leading: Container(
                        height: 70,
                        width: 70,
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
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFF22D6C4)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Color(0xFF3491D2)),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                height: 14,
                                width: 14,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
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
          )
        ],
      ),
    );
  }
}
