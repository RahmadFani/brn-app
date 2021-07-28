import 'package:brn/config/constants.dart';
import 'package:flutter/material.dart';

void showCustomModalBottomSheet(context,
    {@required Widget body, bool expanded = true}) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(36.0),
    ),
    context: context,
    builder: (context) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(36.0),
            topRight: const Radius.circular(36.0),
          ),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: kPaddingL,
          vertical: 10,
        ),
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 10),
            Center(
              child: Container(
                width: 50,
                height: 3,
                decoration: BoxDecoration(
                  color: Color(0xffC4C4C4),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
            if (expanded)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: kPaddingL),
                  child: body,
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: kPaddingL),
                child: body,
              ),
          ],
        ),
      );
    },
  );
}
