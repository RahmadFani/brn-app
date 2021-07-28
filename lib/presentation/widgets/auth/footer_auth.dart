import 'package:flutter/material.dart';

class FooterAuth extends StatelessWidget {
  final String text;
  final String buttonText;
  final Function onPressed;

  const FooterAuth({
    Key key,
    @required this.text,
    @required this.buttonText,
    @required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          SizedBox(width: 2),
          GestureDetector(
            onTap: onPressed,
            child: Text(
              buttonText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
