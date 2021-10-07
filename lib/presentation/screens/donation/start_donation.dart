import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/donation/donation_screen_transaction.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/presentation/widgets/divider_text.dart';
import 'package:flutter/material.dart';

class StartDonation extends StatefulWidget {
  const StartDonation({Key key, this.id}) : super(key: key);

  final int id;

  @override
  _StartDonationState createState() => _StartDonationState();
}

class _StartDonationState extends State<StartDonation> {
  TextEditingController _donationController = TextEditingController();

  void changeValueDonation(int value) {
    setState(() {
      _donationController.text = value.toString();
    });
  }

  GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _form,
      child: Column(
        children: [
          TitleAuth('Mau Donasi Berapa?'),
          Row(
            children: [
              Expanded(
                child: choicheDonationItem(
                  '50.000',
                  onTap: () => changeValueDonation(50000),
                ),
              ),
              SizedBox(width: kPaddingM),
              Expanded(
                child: choicheDonationItem(
                  '100.000',
                  onTap: () => changeValueDonation(100000),
                ),
              ),
            ],
          ),
          SizedBox(height: kPaddingM),
          Row(
            children: [
              Expanded(
                child: choicheDonationItem(
                  '200.000',
                  onTap: () => changeValueDonation(200000),
                ),
              ),
              SizedBox(width: kPaddingM),
              Expanded(
                child: choicheDonationItem(
                  '500.000',
                  onTap: () => changeValueDonation(500000),
                ),
              ),
            ],
          ),
          DividerText(text: 'atau'),
          TextFormField(
            controller: _donationController,
            keyboardType: TextInputType.number,
            validator: (text) {
              if (text.isEmpty) return 'Harap masukan nominal donasi';
              return null;
            },
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(14),
              labelText: "Masukan Nominal",
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.0),
                borderSide: BorderSide(),
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                ), // add padding to adjust icon
                child: Icon(Icons.phone_android_outlined),
              ),
              //fillColor: Colors.green
            ),
            style: TextStyle(
              fontFamily: "Poppins",
            ),
          ),
          SizedBox(height: 20),
          PrimaryButton(
            onPressed: () {
              if (!_form.currentState.validate()) return;
              Navigator.push(
                  context,
                  DonationTransactionScreen.route(
                      id: widget.id, nominal: _donationController.text));
            },
            text: 'Lanjutkan',
          ),
          // SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget choicheDonationItem(String text, {@required Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}
