import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  final String comment;
  const CommentItem(
    this.comment, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xffF3F4FA),
      shadowColor: Colors.grey.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
}
