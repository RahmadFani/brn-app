import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:brn/config/constants.dart';
import 'package:brn/config/ip.dart';
import 'package:brn/config/storage.dart';
import 'package:brn/model/onboard.dart';
import 'package:brn/presentation/screens/dashboard_screen.dart';
import 'package:brn/presentation/screens/splash_screen/constants/constants.dart';
import 'package:brn/model/slider.dart';
import 'package:brn/presentation/widgets/slide_items/slide_dots.dart';
import 'package:brn/presentation/widgets/slide_items/slide_item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SliderLayoutView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SliderLayoutViewState();
}

class _SliderLayoutViewState extends State<SliderLayoutView> {
  int _currentPage = 0;
  List<OnboardModel> _data = [];
  final PageController _pageController = PageController();
  bool loading = true;
  getData() async {
    Uri url = Uri.parse(IpClass().getip() + '/api/onboardings');
    final response2 = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
    });
    final res = json.decode(response2.body);
    if (mounted) {
      setState(() {
        for (Map data in res['data']) {
          _data.add(OnboardModel.fromJson(data));
        }
        loading = false;
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _nextSlide() async {
    if ((_pageController.page + 1) == Constants.totalSlide) {
      await DataStorage().setSplashScreenStatus();
      _changeScreen(DashBoardScreen());
    } else {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  void _changeScreen(Widget screen) {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 450),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return screen;
        },
        transitionsBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation, Widget child) {
          return Align(
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) => topSliderLayout();

  Widget topSliderLayout() => Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomRight,
            colors: [primaryColor, primaryDarkColor],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kPaddingL),
          child: Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: <Widget>[
              PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _data.length,
                itemBuilder: (ctx, i) => SlideItem(
                    title: _data[i].title, subTitle: _data[i].description),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: () => _nextSlide(),
                        child: Padding(
                          padding:
                              const EdgeInsets.only(bottom: 12.0, left: 15),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: const Text(
                              Constants.NEXT,
                              style: TextStyle(
                                fontFamily: Constants.OPEN_SANS,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      alignment: AlignmentDirectional.bottomCenter,
                      margin: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                        children: <Widget>[
                          for (int i = 0; i < sliderArrayList.length; i++)
                            if (i == _currentPage)
                              SlideDots(true)
                            else
                              SlideDots(false)
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
}
