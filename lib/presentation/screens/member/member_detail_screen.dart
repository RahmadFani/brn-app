import 'package:brn/config/constants.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class MemberDetailScreen extends StatefulWidget {
  final int id;
  final int active;
  final int pointsRelationSumPoints;
  final String name;
  final String email;
  final String profilePhotoPath;
  final String profilePhotoUrl;
  final String createdAt;
  final String reasonForInactivity;
  const MemberDetailScreen(
      {Key key,
      this.id,
      this.active,
      this.pointsRelationSumPoints,
      this.name,
      this.email,
      this.profilePhotoPath,
      this.profilePhotoUrl,
      this.createdAt,
      this.reasonForInactivity})
      : super(key: key);

  @override
  _MemberDetailScreenState createState() => _MemberDetailScreenState();
}

class _MemberDetailScreenState extends State<MemberDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundHeigh: MediaQuery.of(context).size.height * 0.18,
      appBar: [
        SimpleAppBarTitle(title: 'Detail Anggota'),
      ],
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: TextFormField(
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  contentPadding: EdgeInsets.all(14),
                  labelText: "Cari Anggota",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ), // add padding to adjust icon
                    child: Icon(Icons.search),
                  ),
                  //fillColor: Colors.green
                ),
                style: TextStyle(
                  fontFamily: "Poppins",
                ),
              ),
            ),
            SizedBox(
              height: kPaddingM,
            ),
            Row(
              children: [
                Container(
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
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      widget.profilePhotoUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: kPaddingS + 3,
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        height: kPaddingXS,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  widget.email,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xff9A9A9A),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1.2,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: kPaddingS,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bio',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                Text(
                    'Ia yang mengerjakan lebih dari apa yang dibayar pada suatu saat akan dibayar lebih dari apa yang ia kerjakan.'),
              ],
            ),
            SizedBox(
              height: kPaddingL * 1.5,
            ),
            buildItem(
              icon: Icons.person_outline_rounded,
              color: Colors.blue,
              value: 'Nurdin Raudinata',
              title: 'Nama Lengkap',
            ),
            SizedBox(
              height: kPaddingS,
            ),
            buildItem(
              icon: Icons.date_range,
              color: Colors.pink[700],
              value: '29-07-1999',
              title: 'Tanggal Lahir',
            ),
            SizedBox(
              height: kPaddingS,
            ),
            buildItem(
              icon: Icons.location_on_outlined,
              color: Colors.purple,
              value: 'Jalan Sutisna Senjaya No 01',
              title: 'Alamat',
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
      @required String value}) {
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
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                Text(
                  value,
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
