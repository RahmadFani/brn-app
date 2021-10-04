import 'package:brn/presentation/screens/store/store_checkout.dart';
import 'package:brn/presentation/screens/store/store_header.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class StorePaymentScreen extends StatefulWidget {
  const StorePaymentScreen({Key key}) : super(key: key);

  @override
  _StorePaymentScreenState createState() => _StorePaymentScreenState();
}

class _StorePaymentScreenState extends State<StorePaymentScreen> {
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
                  Text('Pilih Metode Pembayaran',
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: Offset(2, 4),
                      blurRadius: 10),
                ]),
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1, color: Color(0xFFE5E5E5)))),
                    child: ListTile(
                      leading: Image.asset('assets/images/bca.png', height: 52),
                      title: Text('BCA VIRTUAL ACCOUNT',
                          textAlign: TextAlign.left,
                          style: primaryTextStyle(
                            size: 14,
                            weight: FontWeight.w600,
                          )),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
