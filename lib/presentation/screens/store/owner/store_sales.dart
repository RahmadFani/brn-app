import 'package:brn/presentation/screens/store/owner/chart.dart';
import 'package:brn/presentation/screens/store/store_header.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreOwnerSalesScreen extends StatefulWidget {
  const StoreOwnerSalesScreen({Key key}) : super(key: key);

  @override
  _StoreOwnerSalesScreenState createState() => _StoreOwnerSalesScreenState();
}

class _StoreOwnerSalesScreenState extends State<StoreOwnerSalesScreen> {
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
                  Text('Item Terjual',
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
                      subtitle: Text('Rp. 200.000',
                          textAlign: TextAlign.left,
                          style: primaryTextStyle(
                              size: 14, weight: FontWeight.w600)),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('10. Januari 2021',
                              textAlign: TextAlign.left,
                              style: primaryTextStyle(
                                  size: 10, weight: FontWeight.w400)),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Pembeli : Bambang',
                              textAlign: TextAlign.left,
                              style: primaryTextStyle(
                                  size: 10, weight: FontWeight.w400)),
                        ],
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
