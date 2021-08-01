import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  CustomButton({Key key, this.text}) : super(key: key);

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
            colors: [
              const Color(0xFF303F5E),
              const Color(0xFF1D2C3B),
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(1.0, 0.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      alignment: Alignment(0, 0),
      child: Text(
        widget.text,
        style: TextStyle(
            fontSize: 12, fontWeight: FontWeight.w600, fontFamily: "Poppins"),
      ),
    );
  }
}
