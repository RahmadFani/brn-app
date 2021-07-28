import 'package:brn/config/constants.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/profile/setting_card.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundHeigh: MediaQuery.of(context).size.height * 0.6,
      appBar: [
        SimpleAppBarTitle(title: 'Notifikasi'),
      ],
      body: Column(
        children: [
          SettingCard(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: kPaddingS),
                  Text(
                    'Hari Ini',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  SizedBox(height: kPaddingM),
                  NotificationItem(
                    thumbnail: Image.asset(
                      'assets/images/agenda.png',
                      fit: BoxFit.cover,
                    ),
                    title: 'Buser Rencar Nasional',
                    body:
                        'Perolehan point hari ini, Selamat anda mendapatkan point 50 dari misi yang tercapai.',
                    date: '10 Feb 2021',
                  ),
                  NotificationItem(
                    thumbnail: Icon(
                      Icons.payment,
                      color: Colors.white,
                    ),
                    thumbnailBgColor: Color(0xff3491D2),
                    title: 'Selesaikan ',
                    body: 'Lakukan pembayaran sebelum tangal 22 Oct 2021.',
                    date: '10 Feb 2021',
                  ),
                  SizedBox(height: kPaddingS),
                  Text(
                    'Kemarin',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  SizedBox(height: kPaddingM),
                  NotificationItem(
                    thumbnail: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    thumbnailBgColor: Color(0xff02D4A2),
                    title: 'Pembayaran Berhasil',
                    body: 'Terimakasih telah melakukan pembayaran.',
                    date: '11 Feb 2021',
                  ),
                  NotificationItem(
                    thumbnail: Icon(
                      Icons.payment,
                      color: Colors.white,
                    ),
                    thumbnailBgColor: Color(0xff3491D2),
                    title: 'Selesaikan ',
                    body: 'Lakukan pembayaran sebelum tangal 22 Oct 2021.',
                    date: '11 Feb 2021',
                  ),
                  NotificationItem(
                    thumbnail: Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    thumbnailBgColor: Color(0xff02D4A2),
                    title: 'Pembayaran Berhasil',
                    body: 'Terimakasih telah melakukan pembayaran.',
                    date: '11 Feb 2021',
                  ),
                  NotificationItem(
                    thumbnail: Icon(
                      Icons.payment,
                      color: Colors.white,
                    ),
                    thumbnailBgColor: Color(0xff3491D2),
                    title: 'Selesaikan ',
                    body: 'Lakukan pembayaran sebelum tangal 22 Oct 2021.',
                    date: '11 Feb 2021',
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: kPaddingL),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final Widget thumbnail;
  final String title;
  final String date;
  final String body;
  final Color thumbnailBgColor;

  const NotificationItem({
    Key key,
    @required this.thumbnail,
    @required this.title,
    @required this.date,
    @required this.body,
    this.thumbnailBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      margin: const EdgeInsets.only(bottom: 20),
      shadowColor: Colors.grey.withOpacity(0.3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kPaddingM),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: thumbnailBgColor ?? Colors.grey[300],
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: thumbnail,
                  ),
                ),
                SizedBox(
                  width: kPaddingS + 3,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      date,
                      maxLines: 1,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: kPaddingS,
            ),
            Text(
              body,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
