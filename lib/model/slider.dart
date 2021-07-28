import 'package:brn/presentation/screens/splash_screen/constants/constants.dart';
import 'package:flutter/cupertino.dart';

class Slider {
  Slider(
      {@required this.sliderImageUrl,
      @required this.sliderHeading,
      @required this.sliderSubHeading});

  final List<String> sliderImageUrl;
  final String sliderHeading;
  final String sliderSubHeading;
}

final sliderArrayList = [
  Slider(
      sliderImageUrl: [
        'assets/images/app_logo.png',
      ],
      sliderHeading: Constants.SLIDER_HEADING_1,
      sliderSubHeading: Constants.SLIDER_DESC_1),
  Slider(
      sliderImageUrl: [
        'assets/images/slide_1_1.png',
        'assets/images/slide_1_2.png',
        'assets/images/slide_1_3.png',
        'assets/images/slide_1_4.png',
      ],
      sliderHeading: Constants.SLIDER_HEADING_2,
      sliderSubHeading: Constants.SLIDER_DESC_2),
  Slider(
    sliderImageUrl: [
      'assets/images/slide_2_1.png',
      'assets/images/slide_2_2.png',
      'assets/images/slide_2_3.png',
      'assets/images/slide_2_4.png',
    ],
    sliderHeading: Constants.SLIDER_HEADING_3,
    sliderSubHeading: Constants.SLIDER_DESC_3,
  ),
];
