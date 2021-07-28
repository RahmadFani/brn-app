import 'package:brn/config/constants.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final double backgroundHeigh;
  final Widget bottomNav;
  final List<Widget> appBar;
  final Widget floatAction;

  const CustomScaffold({
    Key key,
    this.appBar,
    @required this.body,
    this.backgroundHeigh,
    this.bottomNav,
    this.floatAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: floatAction,
      body: Stack(
        children: [
          Container(
            height: backgroundHeigh ?? 240,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  primaryDarkColor,
                  primaryColor,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(55),
                bottomRight: Radius.circular(55),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.fromLTRB(kPaddingL, kPaddingL, kPaddingL, 0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: appBar ?? [],
                  ),
                  SizedBox(height: 15),
                  Expanded(child: body),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: bottomNav,
    );
  }
}
