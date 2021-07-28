import 'package:brn/config/constants.dart';
import 'package:brn/presentation/widgets/button/primary_button.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:brn/presentation/widgets/simple_app_bar_title.dart';
import 'package:flutter/material.dart';
import 'package:rating_dialog/rating_dialog.dart';

class QuizScreen extends StatelessWidget {
  final String title;
  final String image;

  const QuizScreen({Key key, @required this.title, @required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      backgroundHeigh: MediaQuery.of(context).size.height * 0.125,
      appBar: [SimpleAppBarTitle(title: title)],
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.035),
          progress(),
          SizedBox(height: 12),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 10),
                questionItem(1),
                SizedBox(height: 28),
                questionItem(2),
                SizedBox(height: 28),
                questionItem(3),
                SizedBox(height: 38),
                PrimaryButton(
                  onPressed: () => _showRatingAppDialog(context),
                  text: 'Periksa',
                ),
                SizedBox(height: 28),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _showRatingAppDialog(BuildContext context) {
    final _ratingDialog = RatingDialog(
      ratingColor: Colors.amber,
      title: title,
      message:
          'Beri peringkat pembelajaran ini dan beri tahu orang lain pendapat Anda. Tambahkan lebih banyak deskripsi di sini jika Anda mau.',
      image: Image.asset(
        image,
        height: 100,
      ),
      submitButton: 'Kirim',
      commentHint: 'Beri tahu kami komentar Anda',
      onCancelled: () => print('cancelled'),
      onSubmitted: (response) {
        print('rating: ${response.rating}, '
            'comment: ${response.comment}');

        if (response.rating < 3.0) {
          print('response.rating: ${response.rating}');
        } else {
          Container();
        }
      },
    );

    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => _ratingDialog,
    );
  }

  Widget progress() {
    return Column(
      children: [
        Text(
          'Soal Quiz',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Stack(
            children: [
              Container(
                height: 8,
                margin: const EdgeInsets.only(top: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    end: Alignment.topRight,
                    begin: Alignment.bottomLeft,
                    colors: [
                      Color(0xffF8CB00),
                      Color(0xffF8CB00).withOpacity(0.6),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                    color: Color(0xffF8CB00),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Progress',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
            Text(
              '1/1 Soal',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget questionItem(int index, {bool selected = false}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Text(
              '$index. Virus Corona (COVID-19) yang menyerang manusia muncul dinegara ... pada tahun 2020'),
        ),
        SizedBox(height: 4),
        choice(
          iconText: 'A',
          text: 'China',
          selected: true,
        ),
        choice(
          iconText: 'B',
          text: 'Italia',
        ),
        choice(
          iconText: 'C',
          text: 'Amerika',
        ),
        choice(
          iconText: 'D',
          text: 'Indonesia',
        ),
      ],
    );
  }

  GestureDetector choice({
    @required String iconText,
    @required String text,
    bool selected = false,
  }) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: kPaddingM, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: selected
                    ? BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xff14232A).withOpacity(0.9),
                            Color(0xff334263).withOpacity(0.9),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(10),
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: primaryDarkColor,
                        )),
                child: Center(
                  child: Text(
                    iconText ?? 'A',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: selected ? Colors.white : primaryDarkColor,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 18),
              Expanded(
                child: Text(
                  text ?? 'China',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
