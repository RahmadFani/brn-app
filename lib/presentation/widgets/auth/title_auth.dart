import 'package:flutter/material.dart';

class TitleAuth extends StatelessWidget {
  final String text;
  final String description;

  const TitleAuth(this.text, {Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        if (description != null) SizedBox(height: 5),
        if (description != null)
          Center(
            child: Text(
              description,
              style: TextStyle(
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        SizedBox(height: 30),
      ],
    );
  }
}
