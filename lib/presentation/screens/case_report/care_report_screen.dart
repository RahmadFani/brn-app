import 'package:brn/config/constants.dart';
import 'package:brn/config/custom_icons_icons.dart';
import 'package:brn/presentation/component/shimmer_dark.dart';
import 'package:brn/presentation/widgets/auth/title_auth.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/presentation/widgets/custom_modal_bottom_sheet.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class CaseReportScreen extends StatefulWidget {
  @override
  _CaseReportScreenState createState() => _CaseReportScreenState();
}

class _CaseReportScreenState extends State<CaseReportScreen> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return CustomScaffold(
      appBar: [
        SimpleAppBarTitle(title: 'Lapor Kasus'),
        Expanded(
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: Colors.white,
              ),
              SizedBox(width: kPaddingS),
              GestureDetector(
                onTap: () {
                  showCustomModalBottomSheet(
                    context,
                    expanded: false,
                    body: filter(),
                  );
                },
                child: Icon(
                  Icons.subject,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: kPaddingS),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
      body: loading == true
          ? ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 200,
                  width: width,
                  color: Colors.white,
                  child: ShimmerDark(
                    height: 200,
                    width: width,
                  ),
                );
              })
          : ListView(
              children: [
                CarItem(),
                CarItem(),
              ],
            ),
    );
  }

  Widget filter() {
    return Column(
      children: [
        TitleAuth('Filter'),
        Row(
          children: [
            Expanded(
              child: choicheDonationItem(
                'Semua',
                onTap: () {},
              ),
            ),
            SizedBox(width: kPaddingM),
            Expanded(
              child: choicheDonationItem(
                'Lapor',
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: kPaddingM),
        Row(
          children: [
            Expanded(
              child: choicheDonationItem(
                'Proses',
                onTap: () {},
              ),
            ),
            SizedBox(width: kPaddingM),
            Expanded(
              child: choicheDonationItem(
                'Tidak ditemukan',
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: kPaddingM),
        Row(
          children: [
            Expanded(
              child: choicheDonationItem(
                'Selesai',
                onTap: () {},
              ),
            ),
            SizedBox(width: kPaddingM),
            Expanded(
              child: choicheDonationItem(
                'Terbaru',
                onTap: () {},
              ),
            ),
          ],
        ),
        SizedBox(height: kPaddingM * 2),
        PrimaryButton(
          onPressed: () {},
          text: 'Terapkan',
        ),
        SizedBox(height: 40),
      ],
    );
  }

  Widget choicheDonationItem(String text, {@required Function onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(child: Text(text)),
      ),
    );
  }
}

class CarItem extends StatelessWidget {
  const CarItem({
    Key key,
  }) : super(key: key);

  void donationDetail(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => donationDetail(context),
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 210,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/audi.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      color: Colors.red,
                    ),
                    child: Center(
                      child: Text(
                        'Diproses',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                kPaddingM,
                kPaddingM - 6,
                kPaddingM,
                kPaddingM,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'AUDI - 118D',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        'G 5557 TH',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Color(0xff9A9A9A),
                          ),
                          SizedBox(
                            width: kPaddingXS,
                          ),
                          FittedBox(
                            child: Text(
                              '21-03-2021',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff9A9A9A),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.date_range,
                            color: Color(0xff9A9A9A),
                          ),
                          SizedBox(
                            width: kPaddingXS,
                          ),
                          FittedBox(
                            child: Text(
                              'Semarang',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff9A9A9A),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: kPaddingM,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                end: Alignment.topCenter,
                                begin: Alignment.bottomRight,
                                colors: [
                                  primaryColor,
                                  primaryDarkColor,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.asset(
                                'assets/images/person.jpeg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: kPaddingS + 3,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jhon Chairina',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                '3271046504930002',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff9A9A9A),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        width: kPaddingL * 2,
                      ),
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: PrimaryButton(
                          onPressed: () {},
                          color: Color(0xff0A4788),
                          child: Icon(
                            CustomIcons.whh_chat,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
