import 'package:brn/config/constants.dart';
import 'package:brn/model/slider.dart';
import 'package:brn/presentation/screens/splash_screen/constants/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget {
  const SlideItem(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (sliderArrayList[index].sliderImageUrl.length == 1)
          Container(
            height: MediaQuery.of(context).size.width * 0.6,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(sliderArrayList[index].sliderImageUrl[0]),
              ),
            ),
          ),
        const SizedBox(
          height: 20.0,
        ),
        Text(
          sliderArrayList[index].sliderHeading,
          style: TextStyle(
            fontFamily: Constants.MONTSERRAT,
            fontWeight: FontWeight.w700,
            fontSize:
                sliderArrayList[index].sliderImageUrl.length == 1 ? 18 : 20,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: index < 1 ? 3 : 16,
        ),
        if (sliderArrayList[index].sliderImageUrl.length > 1)
          SizedBox(
            height: MediaQuery.of(context).size.width *
                0.48 *
                (sliderArrayList[index].sliderImageUrl.length - 2),
            child: GridView.count(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 0),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: List.generate(
                  sliderArrayList[index].sliderImageUrl.length, (inl) {
                return Container(
                  decoration: BoxDecoration(
                    color: primaryColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                          sliderArrayList[index].sliderImageUrl[inl]),
                    ),
                  ),
                );
              }),
            ),
          ),
        if (index < 1)
          Text(
            'v 1.0.0',
            style: TextStyle(
              fontFamily: Constants.POPPINS,
              fontWeight: FontWeight.w500,
              letterSpacing: 1.5,
              fontSize: 14,
              color: Colors.blue[700],
            ),
            textAlign: TextAlign.center,
          ),
        SizedBox(
          height: index < 1 ? 12 : 2,
        ),
        Text(
          sliderArrayList[index].sliderSubHeading,
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
