import 'package:brn/presentation/widgets/custom_scaffold_sync_height.dart';
import 'package:flutter/material.dart';

class DonationTransactionScreen extends StatefulWidget {
  const DonationTransactionScreen({Key key, this.id, this.nominal})
      : super(key: key);

  final int id;
  final String nominal;

  static Route route({@required int id, @required String nominal}) =>
      MaterialPageRoute(
          builder: (_) => DonationTransactionScreen(
                id: id,
                nominal: nominal,
              ));

  @override
  _DonationTransactionScreenState createState() =>
      _DonationTransactionScreenState();
}

class _DonationTransactionScreenState extends State<DonationTransactionScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldSyncHeight(
      appBar: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'Informasi Detail',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Nominal Donasi',
                style: TextStyle(),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
