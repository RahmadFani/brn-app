import 'package:flutter/material.dart';

class DividerText extends StatelessWidget {
  final String text;

  const DividerText({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Divider(
            thickness: 2,
          )),
          SizedBox(width: 14),
          Text(text),
          SizedBox(width: 14),
          Expanded(
              child: Divider(
            thickness: 2,
          )),
        ],
      ),
    );
  }
}
