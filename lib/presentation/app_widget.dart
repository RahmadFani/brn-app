import 'package:brn/config/storage.dart';
import 'package:brn/presentation/screens/dashboard_screen.dart';
import 'package:brn/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppWidget extends StatefulWidget {
  AppWidget({Key key}) : super(key: key);

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  bool _status;

  @override
  void initState() {
    stateCheck();
    _status = false;
    super.initState();
  }

  stateCheck() async {
    bool res = await DataStorage().getSplashScreenStatus();
    if (res == null) _status = false;
    res ? _status = true : _status = false;
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buser Car Nasional',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: _status ? DashBoardScreen() : SplashScreen(),
    );
  }
}
