import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/profile/edit_personal_information_screen.dart';
import 'package:brn/presentation/screens/profile/edit_pin_screen.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/profile/setting_card.dart';
import 'package:brn/presentation/widgets/profile/setting_item.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundHeigh: MediaQuery.of(context).size.height * 0.6,
      appBar: [
        SimpleAppBarTitle(title: 'Setting'),
      ],
      body: Column(
        children: [
          SettingCard(
            child: Column(
              children: [
                SettingItem(
                  text: 'Data Pribadi',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => EditPersonalInformationScreen(),
                      ),
                    );
                  },
                ),
                SettingItem(
                  text: 'Ubah PIN',
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => EditPinScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: kPaddingL),
        ],
      ),
    );
  }
}
