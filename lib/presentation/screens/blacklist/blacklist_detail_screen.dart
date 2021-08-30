import 'package:brn/config/constants.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class BlacklistDetailScreen extends StatefulWidget {
  final int id;
  final String caseReportId;
  final String nik;
  final String name;
  final String phoneNumber;
  final String address;
  final String profilePhotoPath;
  final String information;
  final String createdAt;
  final String updatedAt;
  final String profilePhotoUrl;
  const BlacklistDetailScreen({
    Key key,
    this.id,
    this.caseReportId,
    this.nik,
    this.name,
    this.phoneNumber,
    this.address,
    this.profilePhotoPath,
    this.information,
    this.createdAt,
    this.updatedAt,
    this.profilePhotoUrl,
  }) : super(key: key);

  @override
  _BlacklistDetailScreenState createState() => _BlacklistDetailScreenState();
}

class _BlacklistDetailScreenState extends State<BlacklistDetailScreen> {
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
                                  widget.nik,
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
                  'Informasi',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 11,
                  ),
                ),
                Text(widget.information),
              ],
            ),
            SizedBox(
              height: kPaddingL * 1.5,
            ),
            buildItem(
              icon: Icons.person_outline_rounded,
              color: Colors.blue,
              value: widget.name,
              title: 'Nama Lengkap',
            ),
            SizedBox(
              height: kPaddingS,
            ),
            buildItem(
              icon: Icons.phone,
              color: Colors.pink[700],
              value: widget.phoneNumber,
              title: 'Nomor Handphone',
            ),
            SizedBox(
              height: kPaddingS,
            ),
            buildItem(
              icon: Icons.location_on_outlined,
              color: Colors.purple,
              value: widget.address,
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
