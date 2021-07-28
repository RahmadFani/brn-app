import 'package:brn/config/constants.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class AgendaDetailScreen extends StatelessWidget {
  const AgendaDetailScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: [
        SimpleAppBarTitle(title: 'Rapat Anggota Member BRN'),
      ],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 230,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28.0),
                child: Image.asset(
                  'assets/images/donation.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 18),
            Text(
              'Rapat anggota member buser rentcar Nasional',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: kPaddingM,
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
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
                Text(
                  'Buser Rencar Nasional',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: kPaddingS,
            ),
            Text(
                'Mengutip Antara, Ahad, 24 Januari 2021, mayoritas kejadian merupakan bencana hidrometeorologi atau bencana yang terjadi sebagai dampak dari fenomena meteorologi (alam). Bencana banjir mendominasi dengan 134 kejadian, disusul tanah longsor 31 kejadian, dan puting beliung sebanyak 24 kejadian.'),
            SizedBox(
              height: kPaddingL * 1.5,
            ),
            buildItem(
              icon: Icons.date_range,
              color: Colors.yellow,
              title: '01-02-2021',
              subTitle: 'Tanggal Acara',
            ),
            SizedBox(
              height: kPaddingS,
            ),
            buildItem(
              icon: Icons.person_outline_rounded,
              color: Colors.blue,
              title: '280 Orang',
              subTitle: 'Partisipan',
            ),
            SizedBox(
              height: kPaddingS,
            ),
            buildItem(
              icon: Icons.date_range,
              color: Colors.pink[700],
              title: '0821-1233-1233',
              subTitle: 'Kontak Kami',
            ),
            SizedBox(
              height: kPaddingS,
            ),
            buildItem(
              icon: Icons.location_on_outlined,
              color: Colors.purple,
              title: 'Jalan Sutisna Senjaya No 01',
              subTitle: 'Lokasi',
            ),
            SizedBox(
              height: kPaddingS,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(
      {@required IconData icon,
      @required Color color,
      @required String title,
      @required String subTitle}) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 34,
              color: color,
            ),
            SizedBox(
              width: kPaddingS,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                ),
                Text(
                  subTitle,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            )
          ],
        ),
        Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
