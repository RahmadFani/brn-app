import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/donation/start_donation.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/presentation/widgets/custom_modal_bottom_sheet.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DonationDetailScreen extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final int valueTarget;
  final String image;
  final String imageUrl;
  final String donatedAt;
  final int donationUserCount;
  final String donationUserSumNominal;
  final String createdAt;

  const DonationDetailScreen(
      {Key key,
      this.id,
      this.title,
      this.description,
      this.valueTarget,
      this.image,
      this.imageUrl,
      this.donatedAt,
      this.donationUserCount,
      this.donationUserSumNominal,
      this.createdAt})
      : super(key: key);
  @override
  _DonationDetailScreenState createState() => _DonationDetailScreenState();
}

class _DonationDetailScreenState extends State<DonationDetailScreen> {
  final f = new NumberFormat("#,##0", "en_US");
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
                child: widget.image != null
                    ? Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 230,
                        width: double.infinity,
                        color: Colors.grey.shade100,
                      ),
              ),
            ),
            SizedBox(height: 18),
            Text(
              widget.title,
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
                  'Rp. ' +
                      f
                          .format(int.parse(widget.donationUserSumNominal))
                          .toString(),
                ),
                targetItem(
                  'Target: Rp. ' +
                      f
                          .format(int.parse(widget.donationUserSumNominal))
                          .toString(),
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
                    child: Image.network(
                      widget.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: kPaddingS + 3,
                ),
                // Text(
                //   'Buser Rencar Nasional',
                //   style: TextStyle(
                //     fontSize: 15,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: kPaddingS,
            ),
            Text(widget.description != null ? widget.description : ""),
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
