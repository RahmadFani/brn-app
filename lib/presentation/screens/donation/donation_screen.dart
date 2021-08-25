import 'dart:convert';
import 'dart:io';

import 'package:brn/config/constants.dart';
import 'package:brn/config/ip.dart';
import 'package:brn/model/donation.dart';
import 'package:brn/presentation/component/shimmer_dark.dart';
import 'package:brn/presentation/screens/donation/donation_screen_detail.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final f = new NumberFormat("#,##0", "en_US");

  List<DonationModel> donation = [];
  bool loading = true;
  getData() async {
    Uri url = Uri.parse(IpClass().getip() + '/api/donations');
    final response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
    });
    final res = json.decode(response.body);
    if (mounted) {
      setState(() {
        for (Map data in res['data']) {
          donation.add(DonationModel.fromJson(data));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CustomScaffold(
        appBar: [
          SimpleAppBarTitle(title: 'Donasi'),
        ],
        body: loading == true
            ? ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 300,
                    width: width,
                    child: ShimmerDark(
                      height: 300,
                      width: width,
                    ),
                  );
                })
            : ListView.builder(
                itemCount: donation.length,
                itemBuilder: (context, index) {
                  // return DonationItem(
                  //   id: donation[index].id,
                  //   title: donation[index].title,
                  //   description: donation[index].description,
                  //   valueTarget: donation[index].valueTarget,
                  //   image: donation[index].image,
                  //   imageUrl: donation[index].imageUrl,
                  //   donatedAt: donation[index].donatedAt,
                  //   donationUserCount: donation[index].donationUserCount,
                  //   donationUserSumNominal:
                  //       donation[index].donationUserSumNominal,
                  //   createdAt: donation[index].createdAt,
                  // );

                  return GestureDetector(
                    onTap: () {},
                    child: Card(
                      margin: const EdgeInsets.only(bottom: 20),
                      shadowColor: Colors.grey.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 210,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                              child: donation[index].image != null
                                  ? Image.network(
                                      donation[index].image,
                                      fit: BoxFit.cover,
                                    )
                                  : Container(
                                      color: Colors.blueGrey.shade300,
                                    ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              kPaddingM,
                              kPaddingM - 6,
                              kPaddingM,
                              kPaddingM,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
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
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          donation[index].imageUrl,
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
                                Text(
                                  donation[index].title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(
                                  height: kPaddingM,
                                ),
                                LinearProgressIndicator(
                                  value: 0.6,
                                  valueColor:
                                      AlwaysStoppedAnimation(accentColor),
                                  backgroundColor: Colors.grey[300],
                                  semanticsLabel: 'Linear progress indicator',
                                ),
                                SizedBox(
                                  height: kPaddingM,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          FittedBox(
                                            child: Text(
                                              'Rp. ' +
                                                  f
                                                      .format(int.parse(donation[
                                                              index]
                                                          .donationUserSumNominal))
                                                      .toString(),
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          FittedBox(
                                            child: Text(
                                              'Target : Rp. ' +
                                                  f
                                                      .format(donation[index]
                                                          .valueTarget)
                                                      .toString(),
                                              style: TextStyle(
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: kPaddingL,
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        height: 38,
                                        child: PrimaryButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (ctx) =>
                                                    DonationDetailScreen(
                                                  id: donation[index].id,
                                                  title: donation[index].title,
                                                  description: donation[index]
                                                      .description,
                                                  valueTarget: donation[index]
                                                      .valueTarget,
                                                  image: donation[index].image,
                                                  imageUrl:
                                                      donation[index].imageUrl,
                                                  donatedAt:
                                                      donation[index].donatedAt,
                                                  donationUserCount:
                                                      donation[index]
                                                          .donationUserCount,
                                                  donationUserSumNominal:
                                                      donation[index]
                                                          .donationUserSumNominal,
                                                  createdAt:
                                                      donation[index].createdAt,
                                                ),
                                              ),
                                            );
                                          },
                                          text: 'Donasi',
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
  }
}

class DonationItem extends StatefulWidget {
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

  const DonationItem(
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
  _DonationItemState createState() => _DonationItemState();
}

class _DonationItemState extends State<DonationItem> {
  void donationDetail(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => donationDetail(context),
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 210,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: widget.image != null
                    ? Image.network(
                        widget.image,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        color: Colors.blueGrey.shade300,
                      ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                kPaddingM,
                kPaddingM - 6,
                kPaddingM,
                kPaddingM,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                    height: kPaddingM,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // FittedBox(
                            //   child: Text(
                            //     'Rp. ' +
                            //         f
                            //             .format(int.parse(
                            //                 widget.donationUserSumNominal))
                            //             .toString(),
                            //     style: TextStyle(
                            //       fontSize: 13,
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //     maxLines: 1,
                            //     overflow: TextOverflow.ellipsis,
                            //   ),
                            // ),
                            // FittedBox(
                            //   child: Text(
                            //     'Target : Rp. ' +
                            //         f.format(widget.valueTarget).toString(),
                            //     style: TextStyle(
                            //       fontSize: 13,
                            //       fontWeight: FontWeight.w500,
                            //     ),
                            //     maxLines: 1,
                            //     overflow: TextOverflow.ellipsis,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: kPaddingL,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 38,
                          child: PrimaryButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => DonationDetailScreen(
                                    id: widget.id,
                                    title: widget.title,
                                    description: widget.description,
                                    valueTarget: widget.valueTarget,
                                    image: widget.image,
                                    imageUrl: widget.imageUrl,
                                    donatedAt: widget.donatedAt,
                                    donationUserCount: widget.donationUserCount,
                                    donationUserSumNominal:
                                        widget.donationUserSumNominal,
                                    createdAt: widget.createdAt,
                                  ),
                                ),
                              );
                            },
                            text: 'Donasi',
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
