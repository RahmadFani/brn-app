import 'package:brn/config/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Widget child;
  final Function onPressed;
  final Color color;
  final bool gradient;

  const PrimaryButton({
    Key key,
    this.text,
    this.child,
    this.color,
    @required this.onPressed,
    this.gradient = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80.0),
      ),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: !gradient && color != null
            ? BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(30.0),
              )
            : BoxDecoration(
                gradient: LinearGradient(
                  colors: gradient && color != null
                      ? [
                          color.withOpacity(0.95),
                          color.withOpacity(0.5),
                        ]
                      : [
                          primaryDarkColor.withOpacity(0.95),
                          primaryColor.withOpacity(0.95),
                        ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(30.0),
              ),
        child: Container(
          height: 52,
          alignment: Alignment.center,
          child: child ??
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: color == Colors.white ? Colors.black87 : Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
      ),
    );
  }
}
