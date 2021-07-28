import 'package:flutter/material.dart';

class SubTitleAuth extends StatelessWidget {
  final String text;

  const SubTitleAuth(this.text, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
