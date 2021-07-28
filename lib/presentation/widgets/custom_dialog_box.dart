import 'dart:ui';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, cancelText, text, description;
  final Function action, cancelAction;

  const CustomDialogBox({
    Key key,
    this.title,
    @required this.description,
    @required this.text,
    @required this.cancelText,
    @required this.action,
    @required this.cancelAction,
  }) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      padding: EdgeInsets.all(22),
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
          ]),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (widget.title != null)
            Column(
              children: [
                Text(
                  widget.title ?? '',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 12,
                )
              ],
            )
          else
            Text(
              widget.description ?? '',
              style: TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          SizedBox(height: 22),
          SizedBox(
            height: 30,
            child: Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    color: Colors.red,
                    gradient: true,
                    onPressed: () {
                      Navigator.of(context).pop();
                      widget.cancelAction();
                    },
                    text: widget.cancelText,
                  ),
                ),
                SizedBox(width: 52),
                Expanded(
                  child: PrimaryButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      widget.action();
                    },
                    text: widget.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
