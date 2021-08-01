import 'package:flutter/material.dart';

class CustomAddfile extends StatefulWidget {
  final IconData icon;
  final String text;
  CustomAddfile({Key key, this.icon, this.text}) : super(key: key);

  @override
  _CustomAddfileState createState() => _CustomAddfileState();
}

class _CustomAddfileState extends State<CustomAddfile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Icon(
            widget.icon,
            size: 30,
          ),
          Text(
            widget.text,
            style: TextStyle(
                color: Color(0xFF4D4D4D), fontFamily: "Poppins", fontSize: 16),
          ),
        ],
      ),
    );
  }
}
