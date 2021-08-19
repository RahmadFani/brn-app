import 'package:brn/config/constants.dart';
import 'package:brn/model/slider.dart';
import 'package:brn/presentation/screens/splash_screen/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatefulWidget {
  final String image;
  final String title;
  final String subTitle;

  const SlideItem({Key key, this.image, this.title, this.subTitle})
      : super(key: key);

  @override
  _SlideItemState createState() => _SlideItemState();
}

class _SlideItemState extends State<SlideItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(sliderArrayList[0].sliderImageUrl[0]),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          widget.title,
          style: TextStyle(
            fontFamily: Constants.MONTSERRAT,
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          widget.subTitle,
          style: const TextStyle(
            fontFamily: Constants.POPPINS,
            fontWeight: FontWeight.w500,
            letterSpacing: 1.5,
            fontSize: 14,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
