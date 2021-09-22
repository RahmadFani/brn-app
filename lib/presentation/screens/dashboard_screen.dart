import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:brn/config/custom_icons_icons.dart';
import 'package:brn/config/ip.dart';
import 'package:brn/presentation/screens/chat/chat_screen.dart';
import 'package:brn/presentation/screens/home/home_screen.dart';
import 'package:brn/presentation/screens/profile/profile_screen.dart';
import 'package:brn/presentation/screens/profile/unauth_screen.dart';
import 'package:brn/presentation/screens/store/store_screen.dart';
import 'package:brn/providers/nfc_provider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class DashBoardScreen extends StatefulWidget {
  static String tag = '/DashBoardScreen1';

  @override
  DashBoardScreenState createState() => DashBoardScreenState();
}

class DashBoardScreenState extends State<DashBoardScreen> {
  int _currentIndex = 0;
  bool login = false;
  checklogin() async {
    SharedPreferences x = await SharedPreferences.getInstance();
    String token = x.getString('token');
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

    Future.microtask(() async {
      Provider.of<NFCProvider>(context, listen: false).initialNFC();
    });

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
    final provNFC = Provider.of<NFCProvider>(context);
    if (provNFC.isDetectionKTP) {
      Fluttertoast.showToast(
          msg: "KTP Terdeteksi",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    return Scaffold(
      body: login == false ? tab[_currentIndex] : tab2[_currentIndex],
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.reactCircle,
        activeColor: Color(0xff14232A).withOpacity(1),
        color: Color(0xff9A9A9A),
        backgroundColor: Colors.white,
        curveSize: 75,
        items: [
          TabItem(icon: Icons.home_rounded, title: 'Home'),
          TabItem(icon: CustomIcons.entypo_shop, title: 'Store'),
          TabItem(icon: CustomIcons.whh_chat, title: 'Chat'),
          TabItem(
            icon: CustomIcons.ri_map_pin_user_fill,
            title: 'Profile',
          ),
        ],
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
