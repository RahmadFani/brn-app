import 'package:brn/config/constants.dart';
import 'package:brn/model/chat_users.dart';
import 'package:brn/presentation/screens/chat/chat_user_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatUsers> chatUsers = [
    ChatUsers(
        text: "Jane Russel",
        secondaryText: "Hari yang indah",
        image: "assets/images/userImage1.jpeg",
        time: "Sekarang"),
    ChatUsers(
        text: "Glady's Murphy",
        secondaryText: "Itu bagus kawan",
        image: "assets/images/userImage2.jpeg",
        time: "Kemarin"),
    ChatUsers(
        text: "Jorge Henry",
        secondaryText: "Hey diamana kamu?",
        image: "assets/images/userImage3.jpeg",
        time: "31 Mar"),
    ChatUsers(
        text: "Philip Fox",
        secondaryText: "Aku sibuk! hubungi aku 20 menit lagi",
        image: "assets/images/userImage4.jpeg",
        time: "28 Mar"),
    ChatUsers(
        text: "Debra Hawkins",
        secondaryText: "Terima kasih itu menakjubkan",
        image: "assets/images/userImage5.jpeg",
        time: "23 Mar"),
    ChatUsers(
        text: "Jacob Pena",
        secondaryText: "Saya akan memperbaharui nya nanti",
        image: "assets/images/userImage6.jpeg",
        time: "17 Mar"),
    ChatUsers(
        text: "Andrey Jones",
        secondaryText: "Bisakah kamu mengirim file nya?",
        image: "assets/images/userImage7.jpeg",
        time: "24 Feb"),
    ChatUsers(
        text: "John Wick",
        secondaryText: "Apa Kabar mu sobat?",
        image: "assets/images/userImage8.jpeg",
        time: "18 Feb"),
    ChatUsers(
        text: "John Wick",
        secondaryText: "Apa Kabar mu sobat?",
        image: "assets/images/userImage8.jpeg",
        time: "18 Feb"),
    ChatUsers(
        text: "John Wick",
        secondaryText: "Apa Kabar mu sobat?",
        image: "assets/images/userImage8.jpeg",
        time: "18 Feb"),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text(
            'Buser Rencar Nasional',
            style: TextStyle(
              fontFamily: 'Montserrat',
            ),
          ),
          actions: <Widget>[
            Icon(
              Icons.search,
              color: Colors.white,
            ),
            IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              onPressed: () {
                // do something
              },
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  primaryDarkColor,
                  primaryColor,
                ],
              ),
            ),
          ),
          elevation: 0,
          bottom: TabBar(
            labelColor: primaryColor,
            unselectedLabelColor: Colors.white,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: Colors.grey[50],
            ),
            tabs: [
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Chat",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
              Tab(
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "Group",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 6),
                itemBuilder: (context, index) {
                  return ChatUsersList(
                    text: chatUsers[index].text,
                    secondaryText: chatUsers[index].secondaryText,
                    image: chatUsers[index].image,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 3) ? true : false,
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: chatUsers.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 6),
                itemBuilder: (context, index) {
                  return ChatUsersList(
                    text: chatUsers[index].text,
                    isGroup: true,
                    secondaryText: chatUsers[index].secondaryText,
                    image: chatUsers[index].image,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 3) ? true : false,
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Add your onPressed code here!
          },
          child: Container(
            width: 60,
            height: 60,
            child: Icon(Icons.add),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomRight,
                colors: [
                  primaryDarkColor,
                  primaryColor,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
