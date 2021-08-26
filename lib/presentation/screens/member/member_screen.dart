import 'package:brn/config/constants.dart';
import 'package:brn/presentation/component/shimmer_dark.dart';
import 'package:brn/presentation/screens/member/member_detail_screen.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class MemberScreen extends StatefulWidget {
  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return CustomScaffold(
      backgroundHeigh: MediaQuery.of(context).size.height * 0.18,
      appBar: [
        SimpleAppBarTitle(title: 'Anggota BRN'),
      ],
      body: Column(
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
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: 28.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                filter(
                  label: 'Semua',
                  active: true,
                ),
                filter(label: 'Pusat'),
                filter(label: 'Korda'),
                filter(label: 'Kowil'),
                filter(label: 'Anggota'),
              ],
            ),
          ),
          SizedBox(
            height: kPaddingM,
          ),
          Expanded(
            child: loading == true
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
                      MemberItem(),
                      MemberItem(),
                      MemberItem(),
                      MemberItem(),
                      MemberItem(),
                      MemberItem(),
                      MemberItem(),
                      MemberItem(),
                      MemberItem(),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Container filter({@required String label, bool active = false}) {
    return Container(
      width: 77,
      margin: const EdgeInsets.only(right: 20),
      decoration: active
          ? BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff334263),
                  Color(0xff334263).withOpacity(0.8),
                ],
              ),
              borderRadius: BorderRadius.circular(4),
            )
          : BoxDecoration(),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: active ? Colors.white : Color(0xff9A9A9A),
          ),
        ),
      ),
    );
  }
}

class MemberItem extends StatelessWidget {
  const MemberItem({
    Key key,
  }) : super(key: key);

  void donationDetail(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kPaddingS),
      child: Row(
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
              child: Image.asset(
                'assets/images/person.jpeg',
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
                            'Nurdin Raudinata ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            'Ketua',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xff9A9A9A),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32,
                      width: 32,
                      child: PrimaryButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => MemberDetailScreen(),
                            ),
                          );
                        },
                        child: Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.white,
                        ),
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
    );
  }
}
