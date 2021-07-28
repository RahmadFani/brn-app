import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/donation/start_donation.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/presentation/widgets/custom_modal_bottom_sheet.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class DonationDetailScreen extends StatefulWidget {
  @override
  _DonationDetailScreenState createState() => _DonationDetailScreenState();
}

class _DonationDetailScreenState extends State<DonationDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
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
                'Kembali',
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
        Icon(
          Icons.share,
          color: Colors.white,
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 230,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28.0),
                child: Image.asset(
                  'assets/images/donation.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 18),
            Text(
              'Tanah Longsor! Bantu Selamatkan Warga',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: kPaddingM,
            ),
            LinearProgressIndicator(
              value: 0.6,
              valueColor: AlwaysStoppedAnimation(accentColor),
              backgroundColor: Colors.grey[300],
              semanticsLabel: 'Linear progress indicator',
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                targetItem(
                  'Rp. 250.000',
                ),
                targetItem(
                  'Target: Rp. 400.0000',
                ),
              ],
            ),
            SizedBox(
              height: kPaddingL,
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      end: Alignment.topCenter,
                      begin: Alignment.bottomRight,
                      colors: [
                        primaryColor,
                        primaryDarkColor,
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/person.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: kPaddingS + 3,
                ),
                Text(
                  'Buser Rencar Nasional',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: kPaddingS,
            ),
            Text(
                'Mengutip Antara, Ahad, 24 Januari 2021, mayoritas kejadian merupakan bencana hidrometeorologi atau bencana yang terjadi sebagai dampak dari fenomena meteorologi (alam). Bencana banjir mendominasi dengan 134 kejadian, disusul tanah longsor 31 kejadian, dan puting beliung sebanyak 24 kejadian.'),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: kPaddingL * 3,
              ),
              child: PrimaryButton(
                onPressed: () {
                  showCustomModalBottomSheet(
                    context,
                    expanded: false,
                    body: StartDonation(),
                  );
                },
                text: 'Donasi Sekarang',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row targetItem(String text) {
    return Row(
      children: [
        Text(
          text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
