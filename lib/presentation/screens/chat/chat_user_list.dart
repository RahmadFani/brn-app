import 'package:brn/config/constants.dart';
import 'package:brn/presentation/screens/chat/chat_detail_group_screen.dart';
import 'package:brn/presentation/screens/chat/chat_detail_screen.dart';
import 'package:flutter/material.dart';

class ChatUsersList extends StatefulWidget {
  String text;
  String secondaryText;
  String image;
  String time;
  bool isMessageRead;
  bool isGroup;

  ChatUsersList({
    @required this.text,
    @required this.secondaryText,
    @required this.image,
    @required this.time,
    @required this.isMessageRead,
    this.isGroup = false,
  });
  @override
  _ChatUsersListState createState() => _ChatUsersListState();
}

class _ChatUsersListState extends State<ChatUsersList> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return widget.isGroup ? ChatDetailGroupScreen() : ChatDetailScreen();
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage(widget.image),
                    maxRadius: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.text),
                          SizedBox(
                            height: kPaddingXS,
                          ),
                          Text(
                            widget.secondaryText,
                            style: TextStyle(
                                fontSize: 14, color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.time,
              style: TextStyle(
                fontSize: 12,
                color: widget.isMessageRead ? Colors.red : Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
