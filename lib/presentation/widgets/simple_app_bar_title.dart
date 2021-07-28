import 'package:flutter/material.dart';

class SimpleAppBarTitle extends StatelessWidget {
  const SimpleAppBarTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Row(
        children: [
          Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          SizedBox(width: 10),
          Container(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
