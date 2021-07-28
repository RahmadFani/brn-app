import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/car/car_screen.dart';
import 'package:brn/presentation/screens/case_report/care_report_screen.dart';
import 'package:brn/presentation/screens/profile/about_screen.dart';
import 'package:brn/presentation/screens/profile/faq_screen.dart';
import 'package:brn/presentation/screens/profile/privacy_policy_screen.dart';
import 'package:brn/presentation/screens/profile/setting_screen.dart';
import 'package:brn/presentation/screens/transaction/transaction_screen.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/profile/setting_card.dart';
import 'package:brn/presentation/widgets/profile/setting_item.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundHeigh: MediaQuery.of(context).size.height * 0.6,
      appBar: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Arya Anggara',
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Together we could be unstoppable.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            )
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ProfileScreen(),
              ),
            );
          },
          child: Container(
            width: 55,
            height: 55,
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
        )
      ],
      body: Column(
        children: [
          Row(
            children: [
              simpleDataCard(
                'Data Kendaraan',
                value: '8',
                icon: Icons.car_rental,
                colors: [
                  Color(0xff0A4788),
                  Color(0xff020F2C),
                ],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => CarScreen(),
                    ),
                  );
                },
              ),
              SizedBox(width: kPaddingS),
              simpleDataCard(
                'Lapor Kasus',
                value: '8',
                icon: Icons.warning,
                colors: [
                  Color(0xffFB433D),
                  Color(0xffB81717),
                ],
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => CaseReportScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(height: kPaddingS),
          SettingCard(
            child: Column(
              children: [
                SettingItem(
                  text: 'Score saya',
                  onTap: () {},
                ),
                SettingItem(
                  text: 'Setting',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => SettingScreen(),
                      ),
                    );
                  },
                ),
                SettingItem(
                  text: 'Transaksi',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => TransactionScreen(),
                      ),
                    );
                  },
                ),
                SettingItem(
                  text: 'Tentang',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => AboutScreen(),
                      ),
                    );
                  },
                ),
                SettingItem(
                  text: 'Bantuan',
                  onTap: () {},
                ),
                SettingItem(
                  text: 'FAQ',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => FaqScreen(),
                      ),
                    );
                  },
                ),
                SettingItem(
                  text: 'Kebijakan & Privasi',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => PrivacyPolicyScreen(),
                      ),
                    );
                  },
                ),
                SettingItem(
                  text: 'Keluar',
                  onTap: () {},
                ),
              ],
            ),
          ),
          SizedBox(height: kPaddingL),
        ],
      ),
    );
  }

  Expanded simpleDataCard(
    String title, {
    @required IconData icon,
    @required String value,
    @required List<Color> colors,
    @required Function onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shadowColor: Colors.grey.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: colors,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(kPaddingM),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        icon,
                        color: Colors.white,
                        size: 26,
                      ),
                      SizedBox(width: 8),
                      Text(
                        value,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 3),
                  FittedBox(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
