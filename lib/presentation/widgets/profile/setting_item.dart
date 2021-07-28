import 'package:flutter/material.dart';

class SettingItem extends StatelessWidget {
  final String text;
  final Function onTap;

  const SettingItem({
    Key key,
    @required this.text,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff4D4D4D),
                ),
              ),
              Icon(
                Icons.chevron_right_rounded,
                size: 26,
                color: Color(0xff4D4D4D).withOpacity(0.5),
              ),
            ],
          ),
        ),
        SizedBox(height: 2),
        Divider(
          thickness: 1.5,
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
