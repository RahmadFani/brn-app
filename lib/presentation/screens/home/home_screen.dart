import 'package:brn/config/custom_icons_icons.dart';
import 'package:brn/presentation/screens/agenda/agenda_screen.dart';
import 'package:brn/presentation/screens/courses/courses_screen.dart';
import 'package:brn/presentation/screens/donation/donation_screen.dart';
import 'package:brn/presentation/screens/member/member_screen.dart';
import 'package:brn/presentation/screens/news/news_detail_screen.dart';
import 'package:brn/presentation/screens/notification/notification_screen.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScaffold(
      appBar: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Arya Anggara',
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
              height: width * 0.635,
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
                    ),
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 28.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  categoryItem(label: 'Semua', active: true),
                  categoryItem(label: 'Nasional'),
                  categoryItem(label: 'Agenda'),
                  categoryItem(label: 'Video'),
                  categoryItem(label: 'Kesehatan'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              height: 115.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  newsItem(
                    width,
                    imagePath: 'assets/images/new_1.png',
                    title: 'Maluku adakan pendampingan usaha bagi UMKM',
                    date: '2020-12-12',
                  ),
                  newsItem(
                    width,
                    imagePath: 'assets/images/new_2.png',
                    title:
                        'Penyuluhan Standar Prokes di hadiri Walikota Padang',
                    date: '2020-5-12',
                  ),
                ],
              ),
            ),
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
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => NewsDetailScreen(),
            ),
          );
        },
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
      ),
    );
  }

  Container categoryItem({@required String label, bool active = false}) {
    return Container(
      width: 77,
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
