import 'package:brn/config/constants.dart';
import 'package:brn/model/courses.dart';
import 'package:brn/presentation/component/shimmer_dark.dart';
import 'package:brn/presentation/screens/courses/courses_detail_screen.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatefulWidget {
  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final List<Courses> courses = [
    Courses(
      imageUrl: 'assets/images/courses_3.png',
      title: 'Buser Rentcar Provinsi',
    ),
    Courses(
      imageUrl: 'assets/images/courses_2.png',
      title: 'Tahapan Pelaporan Kasus Pencurian Mobil',
    ),
    Courses(
      imageUrl: 'assets/images/courses_1.png',
      title: 'Buser Rentcar Provinsi',
    ),
  ];
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return CustomScaffold(
      appBar: [
        SimpleAppBarTitle(title: 'Pelatihan'),
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
          : ListView.builder(
              itemCount: courses.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return CoursesItem(
                  imageUrl: courses[index].imageUrl,
                  title: courses[index].title,
                );
              },
            ),
    );
  }
}

class CoursesItem extends StatelessWidget {
  const CoursesItem({
    Key key,
    @required this.imageUrl,
    @required this.title,
  }) : super(key: key);

  final String imageUrl;
  final String title;

  void coursesDetail(BuildContext context, String title) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => CourseDetailScreen(
          title: title,
          image: imageUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => coursesDetail(context, title),
      child: Card(
        margin: const EdgeInsets.only(bottom: 20),
        shadowColor: Colors.grey.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        color: primaryDarkColor,
        child: Container(
          padding: const EdgeInsets.all(21.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topRight,
              colors: [
                primaryDarkColor,
                primaryColor,
              ],
            ),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 115,
                alignment: Alignment.topRight,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    imageUrl,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
