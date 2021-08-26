import 'dart:convert';
import 'dart:io';

import 'package:brn/config/constants.dart';
import 'package:brn/config/ip.dart';
import 'package:brn/model/agenda.dart';
import 'package:brn/presentation/component/shimmer_dark.dart';
import 'package:brn/presentation/screens/agenda/agenda_detail_screen.dart';
import 'package:brn/presentation/screens/agenda/agenda_qr_screen.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class AgendaScreen extends StatefulWidget {
  @override
  _AgendaScreenState createState() => _AgendaScreenState();
}

class _AgendaScreenState extends State<AgendaScreen> {
  final f = new NumberFormat("#,##0", "en_US");

  List<AgendaModel> agenda = [];
  bool loading = true;
  getData() async {
    Uri url = Uri.parse(IpClass().getip() + '/api/agendas');
    final response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
    });
    final res = json.decode(response.body);
    if (mounted) {
      setState(() {
        for (Map data in res['data']) {
          agenda.add(AgendaModel.fromJson(data));
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
        SimpleAppBarTitle(title: 'Agenda'),
      ],
      body: loading == true
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: width,
                  margin: EdgeInsets.only(top: 20),
                  color: Colors.white,
                  child: ShimmerDark(
                    height: 200,
                    width: width,
                  ),
                );
              })
          : ListView.builder(
              itemCount: agenda.length,
              padding: EdgeInsets.only(bottom: 100),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => AgendaDetailScreen(
                          id: agenda[index].id.toString(),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 20),
                    shadowColor: Colors.grey.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(kPaddingM),
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
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: agenda[index].image == null
                                        ? Container(
                                            height: 100,
                                            width: 100,
                                          )
                                        : Image.network(
                                            agenda[index].image,
                                            fit: BoxFit.cover,
                                          )),
                              ),
                              SizedBox(
                                width: kPaddingS + 3,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width - 129,
                                    child: Text(
                                      agenda[index].title,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Text(
                                    agenda[index].startDate,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: kPaddingS,
                          ),
                          Text(
                            agenda[index].description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      floatAction: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => AgendaQrScreen(),
            ),
          );
        },
        child: Container(
          height: 60,
          width: 60,
          color: Color(0xFF303F5E),
          child: Icon(
            Icons.qr_code,
            size: 50,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class AgendaItem extends StatelessWidget {
  const AgendaItem({
    int id,
    int userId,
    int areaId,
    String image,
    String type,
    String title,
    String description,
    String startDate,
    String endDate,
    String startTime,
    String endTime,
    String latitude,
    String longitude,
    String address,
    String qrPath,
    String createdAt,
    String updatedAt,
    String imageUrl,
    String qrCodeUrl,
    Key key,
  }) : super(key: key);

  void agendaDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => AgendaDetailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => agendaDetail(context),
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kPaddingM),
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
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: Image.network(
                          'assets/images/agenda.png',
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: kPaddingS + 3,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Rapat Anggota Member BRN',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '1 December 2021',
                        maxLines: 1,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: kPaddingS,
              ),
              Text(
                'Mengutip Antara, Ahad, 24 Januari 2021, mayoritas kejadian merupakan bencana hidrometeorologi atau bencana yang terjadi sebagai dampak dari fenomena meteorologi (alam). Bencana banjir mendominasi dengan 134 kejadian, disusul tanah longsor 31 kejadian, dan puting beliung sebanyak 24 kejadian.',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
