import 'package:brn/config/storage.dart';
import 'package:brn/presentation/screens/dashboard_screen.dart';
import 'package:brn/presentation/screens/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';

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

  Future stateCheck() async {
    bool res = await DataStorage.instance.getSplashScreenStatus();
    if (res == null) {
      setState(() {
        _status = false;
      });
    } else {
      if (res) {
        setState(() {
          _status = true;
        });
      } else {
        setState(() {
          _status = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    print('Status $_status');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Buser Car Nasional',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Poppins',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      builder: (context, child) => Stack(children: [child, DropdownAlert()]),
      home: _status ? DashBoardScreen() : SplashScreen(),
    );
  }
}
