import 'package:flutter/material.dart';
import 'package:brn/config/constants.dart';

class CustomScaffoldSyncHeight extends StatelessWidget {
  const CustomScaffoldSyncHeight({Key key, this.appBar, this.body})
      : super(key: key);
  final List<Widget> appBar;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 20),
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
          child: SafeArea(
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
                  body ?? SizedBox.shrink(),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        )
      ]),
    ));
  }
}
