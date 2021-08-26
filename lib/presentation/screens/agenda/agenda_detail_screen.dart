import 'dart:convert';
import 'dart:io';

import 'package:brn/config/constants.dart';
import 'package:brn/config/ip.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AgendaDetailScreen extends StatefulWidget {
  final String id;

  const AgendaDetailScreen({Key key, this.id}) : super(key: key);

  @override
  _AgendaDetailScreenState createState() => _AgendaDetailScreenState();
}

class _AgendaDetailScreenState extends State<AgendaDetailScreen> {
  int userId;
  int areaId;
  String image;
  String type;
  String title;
  String description;
  String startDate;
  String endDate;
  String startTime;
  String endTime;
  String latitude;
  String longitude;
  String address;
  String qrPath;
  String createdAt;
  String updatedAt;
  String imageUrl;
  String qrCodeUrl;
  String area;
  String profile;
  String user;
  bool loading = true;

  getData() async {
    Uri url = Uri.parse(IpClass().getip() + '/api/agendas/' + widget.id);
    final response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
    });
    final res = json.decode(response.body);
    if (mounted) {
      setState(() {
        image = res['data']['image'];
        type = res['data']['type'];
        title = res['data']['title'];
        description = res['data']['description'];
        startDate = res['data']['start_date'];
        endDate = res['data']['end_date'];
        startTime = res['data']['start_time'];
        endTime = res['data']['end_time'];
        address = res['data']['address'];
        qrPath = res['data']['qr_path'];
        imageUrl = res['data']['image_url'];
        qrCodeUrl = res['data']['qr_code_url'];
        profile = res['data']['user']['profile_photo_url'];
        user = res['data']['user']['name'];
        area = res['data']['area']['area'];
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
        SimpleAppBarTitle(title: title == null ? "" : title),
      ],
      body: SingleChildScrollView(
        child: loading == true
            ? Container(
                width: width,
                height: height,
                color: Colors.grey.shade200,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 230,
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(28.0),
                      child: image == null
                          ? Container(
                              height: 230,
                              width: width,
                              color: Colors.white,
                            )
                          : Image.network(
                              image,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                  SizedBox(height: 18),
                  Text(
                    title,
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
                            profile,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: kPaddingS + 3,
                      ),
                      Text(
                        user,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kPaddingS,
                  ),
                  Text(description),
                  SizedBox(
                    height: kPaddingL * 1.5,
                  ),
                  buildItem(
                    icon: Icons.date_range,
                    color: Colors.yellow,
                    title: startDate,
                    subTitle: 'Tanggal Acara',
                  ),
                  SizedBox(
                    height: kPaddingS,
                  ),
                  // buildItem(
                  //   icon: Icons.person_outline_rounded,
                  //   color: Colors.blue,
                  //   title: '280 Orang',
                  //   subTitle: 'Partisipan',
                  // ),
                  // SizedBox(
                  //   height: kPaddingS,
                  // ),
                  // buildItem(
                  //   icon: Icons.date_range,
                  //   color: Colors.pink[700],
                  //   title: '0821-1233-1233',
                  //   subTitle: 'Kontak Kami',
                  // ),
                  // SizedBox(
                  //   height: kPaddingS,
                  // ),
                  buildItem(
                    icon: Icons.location_on_outlined,
                    color: Colors.purple,
                    title: address,
                    subTitle: 'Lokasi',
                  ),
                  SizedBox(
                    height: kPaddingS,
                  ),
                ],
              ),
      ),
    );
  }

  Widget buildItem(
      {@required IconData icon,
      @required Color color,
      @required String title,
      @required String subTitle}) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 34,
              color: color,
            ),
            SizedBox(
              width: kPaddingS,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                    title,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                    subTitle,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
