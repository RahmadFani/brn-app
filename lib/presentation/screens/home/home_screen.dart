import 'dart:convert';
import 'dart:io';

import 'package:brn/config/custom_icons_icons.dart';
import 'package:brn/config/ip.dart';
import 'package:brn/model/artikel.dart';
import 'package:brn/model/kategori_artikel.dart';
import 'package:brn/presentation/component/shimmer_dark.dart';
import 'package:brn/presentation/screens/agenda/agenda_screen.dart';
import 'package:brn/presentation/screens/auth/register_screen.dart';
import 'package:brn/presentation/screens/blacklist/blacklist_screen.dart';
import 'package:brn/presentation/screens/car/car_screen.dart';
import 'package:brn/presentation/screens/case_report/care_report_screen.dart';
import 'package:brn/presentation/screens/courses/courses_screen.dart';
import 'package:brn/presentation/screens/donation/donation_screen.dart';
import 'package:brn/presentation/screens/member/member_screen.dart';
import 'package:brn/presentation/screens/news/news_detail_screen.dart';
import 'package:brn/presentation/screens/nfc/nfc_screen.dart';
import 'package:brn/presentation/screens/notification/notification_screen.dart';
import 'package:brn/presentation/screens/peta_induk/peta_induk_screen.dart';
import 'package:brn/presentation/screens/profile/about_screen.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<KategoriArtikelModel> kategoriArtikel = [];
  List<ArtikelModel> artikel = [];

  bool loadingKategoriArtikel = true;
  bool loadingArtikel = true;
  bool login = false;
  getDataKategoriArtikel() async {
    Uri url = Uri.parse(IpClass().getip() + '/api/categories?sort=name');
    final response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
    });
    final res = json.decode(response.body);

    Uri url2 = Uri.parse(IpClass().getip() + '/api/articles?sort=created_at');
    final response2 = await http.get(url2, headers: {
      HttpHeaders.acceptHeader: "application/json",
    });
    final res2 = json.decode(response2.body);

    if (mounted) {
      setState(() {
        for (Map data in res['data']) {
          kategoriArtikel.add(KategoriArtikelModel.fromJson(data));
        }
        for (Map data2 in res2['data']) {
          artikel.add(ArtikelModel.fromJson(data2));
        }
        loadingKategoriArtikel = false;
        loadingArtikel = false;
      });
    }
  }

  String name = '';
  getProfile() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String token = _prefs.getString('token');
    if (token != "") {
      String namex = _prefs.getString('name');
      print('name: $namex');
      setState(() {
        name = namex;
        login = true;
      });
    } else {
      setState(() {
        login = false;
      });
    }
  }

  @override
  void initState() {
    getProfile();
    getDataKategoriArtikel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return CustomScaffold(
      appBar: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              login == true ? "Hi, " : "Hi, Guest",
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Selamat datang kembali',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => NotificationScreen(),
              ),
            );
          },
          icon: Icon(
            Icons.notifications_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
      ],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: login == true ? height * 1.2 : width * 0.63,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: GridView.count(
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 3,
                  children: <Widget>[
                    menuItem(
                        icon: Icons.help,
                        label: 'Tentang BRN',
                        colors: [
                          Color(0xff334263),
                          Color(0xff334263).withOpacity(0.6),
                        ],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => AboutScreen(),
                            ),
                          );
                        }),
                    menuItem(
                        icon: CustomIcons.entypo_shop,
                        label: 'Merchendise',
                        colors: [
                          Color(0xff332A95),
                          Color(0xff332A95).withOpacity(0.6),
                        ],
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (ctx) => MemberScreen(),
                          //   ),
                          // );
                        }),
                    menuItem(
                        icon: Icons.bookmark_sharp,
                        label: 'BRN News',
                        colors: [
                          Color(0xff334263),
                          Color(0xff334263).withOpacity(0.6),
                        ],
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (ctx) => MemberScreen(),
                          //   ),
                          // );
                        }),
                    menuItem(
                        icon: CustomIcons.entypo_shop,
                        label: 'Sponsor',
                        colors: [
                          Color(0xff2AF826),
                          Color(0xff1AC216).withOpacity(0.6),
                        ],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => MemberScreen(),
                            ),
                          );
                        }),
                    menuItem(
                        icon: Icons.person,
                        label: 'Registrasi',
                        colors: [
                          Color(0xff334263),
                          Color(0xff334263).withOpacity(0.6),
                        ],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => RegisterScreen(),
                            ),
                          );
                        }),
                    menuItem(
                        icon: Icons.calendar_today,
                        label: 'Event BRN',
                        colors: [
                          Color(0xffF8CB00),
                          Color(0xffF8CB00).withOpacity(0.6),
                        ],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => AgendaScreen(),
                            ),
                          );
                        }),
                    menuItem(
                        icon: CustomIcons.majesticons_user_group,
                        label: 'Anggota',
                        colors: [
                          Color(0xff334263),
                          Color(0xff334263).withOpacity(0.6),
                        ],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => MemberScreen(),
                            ),
                          );
                        }),
                    menuItem(
                        icon: CustomIcons.majesticons_bookmark_book,
                        label: 'BlackList',
                        colors: [
                          Color(0xff14232A),
                          Color(0xff14232A).withOpacity(0.6),
                        ],
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => BlacklistScreen(),
                            ),
                          );
                        }),
                    menuItem(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CoursesScreen(),
                          ),
                        );
                      },
                      icon: CustomIcons.majesticons_academic_cap,
                      label: 'Pelatihan',
                      colors: [
                        Color(0xff2931B3),
                        Color(0xff2931B3).withOpacity(0.6),
                      ],
                    ),
                    menuItem(
                      icon: CustomIcons.entypo_shop,
                      label: 'Toko BRN',
                      colors: [
                        Color(0xff332A95),
                        Color(0xff332A95).withOpacity(0.6),
                      ],
                      onTap: () {},
                    ),
                    menuItem(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => DonationScreen(),
                          ),
                        );
                      },
                      icon: CustomIcons.fa_solid_hand_holding_heart,
                      label: 'Donasi',
                      colors: [
                        Color(0xffEE4959),
                        Color(0xffEE4959).withOpacity(0.6),
                      ],
                    ),
                    menuItem(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => AgendaScreen(),
                          ),
                        );
                      },
                      icon: CustomIcons.el_book,
                      label: 'Agenda',
                      colors: [
                        Color(0xffF8CB00),
                        Color(0xffF8CB00).withOpacity(0.6),
                      ],
                    ),
                    menuItem(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (ctx) => AgendaScreen(),
                        //   ),
                        // );
                      },
                      icon: CustomIcons.majesticons_user_group,
                      label: 'Team 22',
                      colors: [
                        Color(0xff223036),
                        Color(0xff223036).withOpacity(0.6),
                      ],
                    ),
                    menuItem(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (ctx) => AgendaScreen(),
                        //   ),
                        // );
                      },
                      icon: CustomIcons.majesticons_user_group,
                      label: 'Korwil Korda',
                      colors: [
                        Color(0xff333AB5),
                        Color(0xff6A6FC1).withOpacity(0.6),
                      ],
                    ),
                    menuItem(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CaseReportScreen(),
                          ),
                        );
                      },
                      icon: Icons.warning,
                      label: 'Laporan Kasus',
                      colors: [
                        Color(0xffF84C26),
                        Color(0xffC24A16).withOpacity(0.6),
                      ],
                    ),
                    menuItem(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CaseReportScreen(),
                          ),
                        );
                      },
                      icon: CustomIcons.whh_chat,
                      label: 'Chat',
                      colors: [
                        Color(0xff3491D2),
                        Color(0xff1D74B1).withOpacity(0.6),
                      ],
                    ),
                    menuItem(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => CarScreen(),
                          ),
                        );
                      },
                      icon: Icons.car_rental,
                      label: 'Daftar Kendaraan',
                      colors: [
                        Color(0xffF84C26),
                        Color(0xffC24A16).withOpacity(0.6),
                      ],
                    ),
                    menuItem(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => NfcScreen(),
                          ),
                        );
                      },
                      icon: Icons.chrome_reader_mode,
                      label: 'Cek KTP (NFC)',
                      colors: [
                        Color(0xff05e39d).withOpacity(0.6),
                        Color(0xff08c98c),
                      ],
                    ),
                    menuItem(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (ctx) => PetaIndukScreen(),
                          ),
                        );
                      },
                      icon: Icons.map_outlined,
                      label: 'Peta Induk',
                      colors: [
                        Color(0xff034496),
                        Color(0xff043b80).withOpacity(0.6),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 24.0),
              height: 130.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  slidePromotionItem(
                    width,
                    imagePath: 'assets/images/slider_promotion_1.png',
                  ),
                  slidePromotionItem(
                    width,
                    imagePath: 'assets/images/slider_promotion_2.png',
                  ),
                ],
              ),
            ),
            Text(
              'Berita',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            if (loadingKategoriArtikel == true)
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  height: 28.0,
                  width: width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(left: 10),
                          child: ShimmerDark(
                            width: 77,
                            height: 30,
                          ),
                        );
                      }))
            else
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  height: 28.0,
                  width: width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: kategoriArtikel.length,
                      itemBuilder: (context, index) {
                        return categoryItem(label: kategoriArtikel[index].name);
                      })),
            if (loadingArtikel == true)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0),
                height: 115.0,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return ShimmerDark(
                        height: 100,
                        width: 130,
                      );
                    }),
              )
            else
              Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  height: 115.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: artikel.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => NewsDetailScreen(
                                  articleId: artikel[index].id.toString(),
                                  title: artikel[index].title,
                                  content: artikel[index].content,
                                  date: artikel[index].createdAt,
                                  like: artikel[index].likesCount,
                                  view: artikel[index].viewsCount,
                                  coment: artikel[index].commentsCount,
                                ),
                              ),
                            );
                          },
                          child: newsItem(
                            width,
                            imagePath: 'assets/images/new_1.png',
                            title: artikel[index].title,
                            date: artikel[index].createdAt.substring(0, 10),
                          ),
                        );
                      })),
          ],
        ),
      ),
    );
  }

  Container newsItem(
    double width, {
    @required String imagePath,
    @required String title,
    @required String date,
  }) {
    return Container(
      width: width * 0.65,
      margin: const EdgeInsets.only(right: 10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(7),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(imagePath),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.calendar_today_outlined,
                          color: Colors.grey,
                          size: 18,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          date,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 5),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container categoryItem({@required String label, bool active = false}) {
    return Container(
      // width: 77,
      margin: const EdgeInsets.only(right: 20),
      decoration: active
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff334263),
                  Color(0xff334263).withOpacity(0.8),
                ],
              ),
              color: Colors.red,
              borderRadius: BorderRadius.circular(4),
            )
          : BoxDecoration(),
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: active ? Colors.white : Color(0xff9A9A9A),
          ),
        ),
      ),
    );
  }

  Container slidePromotionItem(double width, {@required String imagePath}) {
    return Container(
      width: width * 0.7,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget menuItem({
    @required IconData icon,
    @required String label,
    @required List<Color> colors,
    Function onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: colors,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.white,
            ),
            SizedBox(
              height: 2,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                label,
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
