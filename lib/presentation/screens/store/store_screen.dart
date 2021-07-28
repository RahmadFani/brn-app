import 'package:brn/config/constants.dart';
import 'package:brn/model/category.dart';
import 'package:brn/model/slider_model.dart';
import 'package:brn/presentation/screens/auth/login_screen.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:nb_utils/nb_utils.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({Key key}) : super(key: key);

  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  PageController bannerPageController = PageController();
  List<Category> mCategoryModel = [
    Category(
      name: 'Spare Part',
      image:
          'https://images.tokopedia.net/img/cache/200-square/attachment/2018/8/12/3127195/3127195_274d0aef-df76-4fbd-aa7c-6e997a150d71.jpg.webp?ect=4g',
    ),
    Category(
      name: 'Pakaian',
      image: 'https://img.icons8.com/plasticine/2x/clothes.png',
    ),
    Category(
      name: 'Spare Part',
      image:
          'https://images.tokopedia.net/img/cache/200-square/attachment/2018/8/12/3127195/3127195_274d0aef-df76-4fbd-aa7c-6e997a150d71.jpg.webp?ect=4g',
    ),
    Category(
      name: 'Pakaian',
      image: 'https://img.icons8.com/plasticine/2x/clothes.png',
    ),
    Category(
      name: 'Spare Part',
      image:
          'https://images.tokopedia.net/img/cache/200-square/attachment/2018/8/12/3127195/3127195_274d0aef-df76-4fbd-aa7c-6e997a150d71.jpg.webp?ect=4g',
    ),
    Category(
      name: 'Pakaian',
      image: 'https://img.icons8.com/plasticine/2x/clothes.png',
    ),
    Category(
      name: 'Spare Part',
      image:
          'https://images.tokopedia.net/img/cache/200-square/attachment/2018/8/12/3127195/3127195_274d0aef-df76-4fbd-aa7c-6e997a150d71.jpg.webp?ect=4g',
    ),
    Category(
      name: 'Pakaian',
      image: 'https://img.icons8.com/plasticine/2x/clothes.png',
    ),
  ];
  List<SliderModel> mSliderModel = [
    SliderModel(
      image:
          'https://akcdn.detik.net.id/community/media/visual/2020/08/13/transmart_169.jpeg?w=700&q=90',
      url:
          'https://akcdn.detik.net.id/community/media/visual/2020/08/13/transmart_169.jpeg?w=700&q=90',
      thumb:
          'https://akcdn.detik.net.id/community/media/visual/2020/08/13/transmart_169.jpeg?w=700&q=90',
    ),
    SliderModel(
      image: 'https://cf.shopee.co.id/file/631519ad95a7857182206746d4c2361e',
      url: 'https://cf.shopee.co.id/file/631519ad95a7857182206746d4c2361e',
      thumb: 'https://cf.shopee.co.id/file/631519ad95a7857182206746d4c2361e',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: [
        Text(
          'Toko BRN',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            SizedBox(width: kPaddingS),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => LoginScreen(),
                  ),
                );
              },
              child: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
            ),
            SizedBox(width: kPaddingS),
            Icon(
              Icons.shopping_bag_rounded,
              color: Colors.white,
            ),
          ],
        )
      ],
      body: Column(
        children: [
          _carousel(),
          SizedBox(height: kPaddingL),
          _category(),
        ],
      ),
    );
  }

  Widget _carousel() {
    return Container(
      height: 200,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: bannerPageController,
            onPageChanged: (i) {
              setState(() {});
            },
            children: mSliderModel.map((i) {
              return Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  child: commonCacheImageWidget(
                    i.image,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
              );
            }).toList(),
          ),
          DotIndicator(
            pageController: bannerPageController,
            pages: mSliderModel,
            indicatorColor: primaryColor,
          ).paddingBottom(8)
        ],
      ),
    );
  }

  Widget _category() {
    return Container(
      height: 80,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 16, right: 8),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: mCategoryModel.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Container(
                  child: mCategoryModel[index].image != null
                      ? CircleAvatar(
                          backgroundColor: Colors.grey[300],
                          backgroundImage:
                              NetworkImage(mCategoryModel[index].image),
                          radius: 25,
                        ).cornerRadiusWithClipRRect(8)
                      : CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/app_logo.png'),
                          radius: 25,
                        ).cornerRadiusWithClipRRect(8),
                ),
                4.height,
                Text(mCategoryModel[index].name,
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: primaryTextStyle(size: 14))
                    .center()
              ],
            ).paddingRight(16),
          );
        },
      ),
    );
  }

  Widget commonCacheImageWidget(String url,
      {double width, BoxFit fit, double height}) {
    if (url.startsWith('https')) {
      return CachedNetworkImage(
        placeholder: placeholderWidgetFn(),
        imageUrl: '$url',
        height: height,
        width: width,
        fit: fit,
      );
    } else {
      return Image.asset(url, height: height, width: width, fit: fit);
    }
  }

  Function(BuildContext, String) placeholderWidgetFn() =>
      (_, s) => placeholderWidget();

  Widget placeholderWidget() =>
      Image.asset('assets/images/placeholder.jpg', fit: BoxFit.cover);
}
