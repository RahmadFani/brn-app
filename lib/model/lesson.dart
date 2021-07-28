import 'package:flutter/foundation.dart';

class Lesson {
  String youtubeId;
  int status;
  String title;
  String subTitle;
  String content;
  String description;

  Lesson({
    this.youtubeId,
    @required this.status,
    @required this.title,
    this.subTitle,
    this.content,
    this.description,
  });
}
