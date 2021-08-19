import 'package:brn/config/constants.dart';
import 'package:brn/model/category.dart';
import 'package:brn/model/slider_model.dart';
import 'package:brn/presentation/screens/auth/login_screen.dart';
import 'package:brn/presentation/screens/store/store_detail.dart';
import 'package:brn/presentation/screens/store/store_header.dart';
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
  int _currentTab = 0;

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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CustomScaffold(
      appBar: [StoreHeaderComponent()],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _carousel(),
          SizedBox(
            height: 21,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 68,
                width: 68,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF22D6C4),
                          Color(0xFF3491D2),
                        ]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(2, 4),
                          blurRadius: 10),
                    ]),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Pakaian",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Monserrat",
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
              Container(
                height: 68,
                width: 68,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFF46FFDE),
                          Color(0xFF00D2A0),
                        ]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(2, 4),
                          blurRadius: 10),
                    ]),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Otomotif",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Monserrat",
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
              Container(
                height: 68,
                width: 68,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFFB433D),
                          Color(0xFFFB433D),
                        ]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(2, 4),
                          blurRadius: 10),
                    ]),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Terlaris",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Monserrat",
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
              Container(
                height: 68,
                width: 68,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xFFD6C422),
                          Color(0xFFEFBA00),
                        ]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.15),
                          offset: Offset(2, 4),
                          blurRadius: 10),
                    ]),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Transaksi",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Monserrat",
                            fontSize: 11,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ),
            ],
          ),
          SizedBox(height: kPaddingL),
          // _category(),
          Text('Produk',
              textAlign: TextAlign.left,
              style: primaryTextStyle(size: 18, weight: FontWeight.w600)),
          SizedBox(height: kPaddingL),

          Container(
            height: 28.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: tabs(
                labels: [
                  'Semua',
                  'Sparepart',
                  'Kaos',
                  'Kendaraan',
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: height * 0.4,
            width: width,
            child: GridView.builder(
              padding: EdgeInsets.only(left: 15, right: 15),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1 / 1.3,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15),
              itemCount: 20,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => StoreDetailScreen(),
                      ),
                    );
                  },
                  child: Container(
                    height: 172,
                    width: 140,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              offset: Offset(2, 4),
                              blurRadius: 10),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset('assets/images/audi.jpeg'),
                        ),
                        Text('Mobil Audi',
                            textAlign: TextAlign.left,
                            style: primaryTextStyle(
                                size: 10, weight: FontWeight.w600)),
                        SizedBox(
                          height: 5,
                        ),
                        Text('Rp. 567.000.000',
                            textAlign: TextAlign.left,
                            style: primaryTextStyle(
                                size: 10, weight: FontWeight.w400)),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  color: Colors.black45,
                                  size: 10,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text('2021-09-19',
                                    textAlign: TextAlign.left,
                                    style: primaryTextStyle(
                                        size: 10, weight: FontWeight.w400)),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFFFB433D),
                                            Color(0xFFFB433D).withOpacity(0.5),
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.15),
                                            offset: Offset(2, 4),
                                            blurRadius: 10),
                                      ]),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.favorite_outlined,
                                          color: Colors.white,
                                        ),
                                      ]),
                                ),
                                Container(
                                  height: 30,
                                  width: 30,
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xFF3491D2),
                                            Color(0xFF3491D2).withOpacity(0.5),
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.15),
                                            offset: Offset(2, 4),
                                            blurRadius: 10),
                                      ]),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _carousel() {
    return Container(
      height: 153,
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
  List<Widget> tabs({@required List<String> labels}) {
    return labels
        .asMap()
        .map(
          (i, e) => MapEntry(
            i,
            GestureDetector(
              onTap: () {
                setState(() {
                  _currentTab = i;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(right: 20),
                padding: const EdgeInsets.symmetric(horizontal: kPaddingS),
                decoration: i == _currentTab
                    ? BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff334263),
                            Color(0xff334263).withOpacity(0.8),
                          ],
                        ),
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      )
                    : BoxDecoration(),
                child: Center(
                  child: Text(
                    e,
                    style: TextStyle(
                      color:
                          i == _currentTab ? Colors.white : Color(0xff9A9A9A),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
        .values
        .toList();
  }
}
