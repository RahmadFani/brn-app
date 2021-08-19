import 'dart:convert';
import 'dart:io';

import 'package:brn/config/ip.dart';
import 'package:brn/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsDetailScreen extends StatefulWidget {
  final String articleId;
  final String title;
  final String content;
  final String date;
  final int like;
  final int coment;
  final int view;

  const NewsDetailScreen(
      {Key key,
      this.title,
      this.content,
      this.date,
      this.like,
      this.coment,
      this.view,
      this.articleId})
      : super(key: key);
  @override
  _NewsDetailScreenState createState() => _NewsDetailScreenState();
}

class _NewsDetailScreenState extends State<NewsDetailScreen> {
  void getKomen() async {
    Uri url = Uri.parse(IpClass().getip() +
        '/api/articles/:article/comments?page%5Bnumber%5D=' +
        widget.articleId);
    final response = await http.get(url, headers: {
      HttpHeaders.acceptHeader: "application/json",
    });
    final res = json.decode(response.body);
  }

  bool loadingKomen = true;

  @override
  void initState() {
    // TODO: implement initState
    getKomen();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'Kembali',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Icon(
          Icons.share,
          color: Colors.white,
        ),
      ],
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(28.0),
            child: Image.asset(
              'assets/images/new_4.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 18),
          Text(
            widget.title,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 16,
              color: Color(0xff5C5C5C),
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleItem(
                widget.date.substring(0, 10),
                icon: Icons.calendar_today_outlined,
              ),
              titleItem(
                widget.view.toString() + ' dilihat',
                icon: Icons.remove_red_eye_outlined,
              ),
              titleItem(
                widget.like.toString() + ' disukasi',
                icon: Icons.favorite,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(children: [
              Card(
                shadowColor: Colors.grey.withOpacity(0.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(widget.content),
                ),
              ),
              SizedBox(height: 18),
              Text(
                'Komentar',
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff5C5C5C),
                ),
              ),
              SizedBox(height: 8),
              commentar(
                  'Harusnya yang seperti ini di dukung dan di fasilitasi, mari kita semangati anak muda ini!'),
              commentar(
                'Jarang sekali yang mau berbagi ilmu dan pengalaman, salute dengan mas nya',
              ),
              SizedBox(height: 15),
              inputComment(),
            ]),
          ),
        ],
      ),
    );
  }

  Card inputComment() {
    return Card(
      color: Color(0xffF3F4FA),
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(12),
          labelText: "Tambahkan komentar",
          labelStyle: TextStyle(
            color: Colors.grey[500],
          ),
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.send,
              color: Colors.grey[400],
            ),
          ),
          //fillColor: Colors.green
        ),
        validator: (val) {
          if (val.length == 0) {
            return "Nomor handphone tidak boleh kosong";
          } else {
            return null;
          }
        },
        style: TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    );
  }

  Card commentar(String comment) {
    return Card(
      color: Color(0xffF3F4FA),
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(comment),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xff22D6C4).withOpacity(0.4),
                        Color(0xff3491D2).withOpacity(0.4),
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
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Arya Anggara',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xff4D4D4D),
                      ),
                    ),
                    Text(
                      'Tasikmalaya',
                      style: TextStyle(),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row titleItem(String text, {@required IconData icon}) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.grey,
          size: 16,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          text,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
