import 'package:brn/config/constants.dart';
import 'package:flutter/material.dart';

class CustomScaffoldAuth extends StatelessWidget {
  final Widget body;

  const CustomScaffoldAuth({Key key, this.body}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor,
                  primaryDarkColor,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(kPaddingL),
              child: Padding(
                padding: EdgeInsets.only(top: height * 0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    if (height > 450)
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.width * 0.65,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/brush_stroke.png'),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.width * 0.65,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/auth.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(36.0),
                topRight: const Radius.circular(36.0),
              ),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: kPaddingL,
              vertical: 10,
            ),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Center(
                  child: Container(
                    width: 50,
                    height: 3,
                    decoration: BoxDecoration(
                      color: Color(0xffC4C4C4),
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPaddingL),
                  child: body,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
