import 'dart:ui';

import 'package:brn/config/custom_icons_icons.dart';
import 'package:brn/config/storage.dart';
import 'package:brn/presentation/screens/chat/chat_screen.dart';
import 'package:brn/presentation/screens/home/home_screen.dart';
import 'package:brn/presentation/screens/profile/profile_screen.dart';
import 'package:brn/presentation/screens/profile/unauth_screen.dart';
import 'package:brn/presentation/screens/store/store_screen.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class DashBoardScreen extends StatefulWidget {
  static String tag = '/DashBoardScreen1';

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;
  bool login = false;
  checklogin() async {
    String token = await DataStorage.instance.getToken();

    if (token != "") {
      setState(() {
        login = true;
      });
    } else {
      setState(() {
        login = false;
      });
    }
  }

  final tab = [
    HomeScreen(),
    StoreScreen(),
    ChatScreen(),
    // ProfileScreen(),
    UnauthScreen(),
  ];
  final tab2 = [
    HomeScreen(),
    StoreScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];
  @override
  void initState() {
    checklogin();

    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    window.onPlatformBrightnessChanged = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: login == false ? tab[_currentIndex] : tab2[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        activeColor: Color(0xff14232A).withOpacity(1),
        color: Color(0xff9A9A9A),
        backgroundColor: Colors.white,
        curveSize: 85,
        items: [
          TabItem(icon: Icons.home_rounded, title: 'Home'),
          TabItem(icon: CustomIcons.entypo_shop, title: 'Store'),
          TabItem(icon: CustomIcons.whh_chat, title: 'Chat'),
          TabItem(
            icon: CustomIcons.ri_map_pin_user_fill,
            title: 'Profile',
          ),
        ],
        height: 68,
        initialActiveIndex: 0,
        onTap: (int i) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }
}
