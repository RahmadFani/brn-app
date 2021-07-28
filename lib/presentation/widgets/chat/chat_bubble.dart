import 'package:brn/config/constants.dart';
import 'package:brn/model/chat_message.dart';
import 'package:brn/presentation/screens/chat/chat_detail_group_screen.dart';
import 'package:brn/presentation/screens/chat/chat_detail_screen.dart';
import 'package:chat_bubbles/bubbles/bubble_special_two.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final ChatMessage chatMessage;
  final String from;
  final Color labelColor;

  const ChatBubble({
    Key key,
    @required this.chatMessage,
    this.from,
    this.labelColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 10, 10),
          child: BubbleSpecialTwo(
            text: chatMessage.message,
            isSender: chatMessage.type == MessageType.Sender,
            color: chatMessage.type == MessageType.Sender
                ? Color(0xFFE8E8EE)
                : primaryColor.withOpacity(0.4),
            sent: chatMessage.type == MessageType.Sender,
          ),
        ),
        if (from != null)
          Positioned(
            child: Align(
              alignment: (chatMessage.type == MessageType.Receiver
                  ? Alignment.topLeft
                  : Alignment.topRight),
              child: Padding(
                padding: EdgeInsets.only(left: 34, right: 34),
                child: Text(
                  from,
                  style: TextStyle(fontSize: 12, color: labelColor),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
