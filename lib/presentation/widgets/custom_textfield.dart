import 'package:flutter/material.dart';

class CustomTextfield extends StatefulWidget {
  final String label;
  final String hint;
  CustomTextfield({Key key, this.label, this.hint}) : super(key: key);

  @override
  _CustomTextfieldState createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          contentPadding: EdgeInsets.all(14),
          labelText: widget.label,
          fillColor: Colors.white,
          hintText: widget.hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(),
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(
              left: 15,
            ), // add padding to adjust icon
            child: Icon(Icons.search),
          ),
          //fillColor: Colors.green
        ),
        style: TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}