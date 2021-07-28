import 'package:brn/config/constants.dart';
import 'package:brn/model/lesson.dart';
import 'package:brn/presentation/screens/courses/quiz_screen.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/presentation/widgets/comment/comment_input.dart';
import 'package:brn/presentation/widgets/comment/comment_item.dart';
import 'package:brn/presentation/widgets/custom_dialog_box.dart';
import 'package:brn/presentation/widgets/custom_modal_bottom_sheet.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/profile/setting_card.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class CourseDetailScreen extends StatefulWidget {
  final String title;
  final String image;

  const CourseDetailScreen({
    Key key,
    @required this.title,
    @required this.image,
  }) : super(key: key);

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _currentLessonIndex = 0;

  YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: '3Ccsz3gnSOI',
    flags: YoutubePlayerFlags(
      autoPlay: true,
      mute: true,
    ),
  );

  List<Lesson> lessons = [
    Lesson(
        youtubeId: 'gDZHSR2uvo4',
        status: 0,
        title: 'Apa itu buser rentcar nasional',
        subTitle: '01:32',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.'),
    Lesson(
        youtubeId: '3Ccsz3gnSOI',
        status: 0,
        title: 'Dimana Anda bisa menemukan BRN',
        subTitle: '00:32',
        description:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.'),
    Lesson(
        status: 0,
        title: 'Jenis jenis kasus penggelapan mobil',
        subTitle: '03:32',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\n Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
  ];

  bool showListCourses = true;
  bool _allLessonDone = false;

  void changeTab() {
    setState(() {
      showListCourses = !showListCourses;
    });
  }

  void nextLesson() {
    setState(
      () {
        lessons[_currentLessonIndex].status = 1;
        if ((_currentLessonIndex + 1) == lessons.length) {
          _allLessonDone = true;
          startQuiz();
        } else {
          _currentLessonIndex++;
        }
      },
    );
  }

  void startQuiz() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialogBox(
          description:
              "Apakah anda telah menyelesaikan semua materi? Ingin laukan kuis sekarang?",
          text: "Ya",
          action: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) =>
                    QuizScreen(title: widget.title, image: widget.image),
              ),
            );
          },
          cancelText: 'Tidak',
          cancelAction: () {},
        );
      },
    );
  }

  void changeLesson(index) {
    setState(() {
      _currentLessonIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double sHeight = MediaQuery.of(context).size.height;

    return CustomScaffold(
      appBar: [
        SimpleAppBarTitle(title: widget.title),
        Icon(
          Icons.favorite,
          color: Colors.white,
        ),
      ],
      body: Column(
        children: [
          if (lessons[_currentLessonIndex].youtubeId == null)
            SettingCard(
              child: ListView(
                children: [
                  Text(
                    lessons[_currentLessonIndex].title ?? '',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 6),
                  Text(lessons[_currentLessonIndex].content ?? ''),
                ],
              ),
            )
          else
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressColors: ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.red,
              ),
              onReady: () {},
            ),
          SizedBox(height: 12),
          if (!_allLessonDone) LessonCheckDone(onDone: () => nextLesson()),
          if (sHeight > 600 && lessons[_currentLessonIndex].youtubeId != null)
            buildLessons(),
          SizedBox(
            height: MediaQuery.of(context).size.height *
                (lessons[_currentLessonIndex].youtubeId != null
                    ? 0.065
                    : 0.165),
          )
        ],
      ),
      floatAction: Padding(
        padding: const EdgeInsets.all(kPaddingL),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (_allLessonDone)
              Expanded(
                child: PrimaryButton(
                  color: Colors.white,
                  onPressed: () {
                    startQuiz();
                  },
                  text: 'Mulai Kuis',
                ),
              ),
            if (_allLessonDone)
              SizedBox(
                width: kPaddingM,
              ),
            if (!(sHeight > 600 &&
                lessons[_currentLessonIndex].youtubeId != null))
              Expanded(
                child: PrimaryButton(
                  color: Colors.white,
                  onPressed: () {
                    showCustomModalBottomSheet(
                      context,
                      body: Column(
                        children: [buildLessons(nPop: true)],
                      ),
                    );
                  },
                  text: 'Materi',
                ),
              ),
            if (!(sHeight > 600 &&
                lessons[_currentLessonIndex].youtubeId != null))
              SizedBox(
                width: kPaddingM,
              ),
            SizedBox(
              width: 58,
              child: PrimaryButton(
                onPressed: () {
                  showCustomModalBottomSheet(
                    context,
                    body: Column(
                      children: [buildDiscution()],
                    ),
                  );
                },
                color: Colors.white,
                child: Icon(
                  Icons.comment,
                  color: primaryColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildDiscution() {
    return Expanded(
      child: ListView(children: [
        CommentItem('Semangat!!'),
        CommentItem(
          'Jarang sekali yang mau berbagi ilmu dan pengalaman, salute dengan mas nya',
        ),
        SizedBox(height: 15),
        CommentInput(),
      ]),
    );
  }

  Widget buildLessons({bool nPop = false}) {
    return Expanded(
      child: ListView.builder(
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          return lessonItem(
            nPop: nPop,
            status: _currentLessonIndex == index ? 2 : lessons[index].status,
            title: lessons[index].title,
            subTitle: lessons[index].subTitle,
            onTap: () => changeLesson(index),
          );
        },
      ),
    );
  }

  Widget lessonItem({
    @required Function onTap,
    @required int status,
    @required String title,
    @required String subTitle,
    bool nPop = false,
  }) {
    return GestureDetector(
      onTap: () {
        if (nPop) Navigator.of(context).pop();
        onTap();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(kPaddingM),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: status == 0
                        ? [
                            Color(0xffC4C4C4).withOpacity(0.5),
                            Color(0xffC4C4C4).withOpacity(0.5),
                          ]
                        : status == 2
                            ? [
                                Color(0xff8039F5).withOpacity(0.3),
                                Color(0xff8039F5).withOpacity(0.2),
                              ]
                            : [
                                Color(0xff00D2A0).withOpacity(0.3),
                                Color(0xff00D2A0).withOpacity(0.2),
                              ],
                  ),
                ),
                child: Center(
                  child: Icon(
                    status == 0
                        ? Icons.play_arrow
                        : status == 2
                            ? Icons.pause
                            : Icons.done,
                    color: status == 0
                        ? Color(0xffC4C4C4)
                        : status == 2
                            ? Color(0xff8039F5)
                            : Color(0xff00D2A0),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LessonCheckDone extends StatefulWidget {
  const LessonCheckDone({
    Key key,
    @required this.onDone,
  }) : super(key: key);

  final Function onDone;

  @override
  _LessonCheckDoneState createState() => _LessonCheckDoneState();
}

class _LessonCheckDoneState extends State<LessonCheckDone> {
  bool _isDone = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(kPaddingXS),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Checkbox(
              value: _isDone,
              onChanged: (bool value) {
                setState(() {
                  _isDone = !_isDone;
                });
              },
            ),
            _isDone
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _isDone = !_isDone;
                        widget.onDone();
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            primaryColor,
                            primaryDarkColor,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        'Materi Selanjutnya',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                : Expanded(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                          'Saya sudah selesai membaca/menonton materi ini.'),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
