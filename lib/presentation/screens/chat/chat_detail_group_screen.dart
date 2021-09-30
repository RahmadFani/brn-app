import 'package:brn/config/constants.dart';
import 'package:brn/model/chat_message.dart';
import 'package:brn/model/send_menu_items.dart';
import 'package:brn/presentation/screens/chat/chat_detail_screen.dart';
import 'package:brn/presentation/widgets/chat/chat_bubble.dart';
import 'package:brn/presentation/widgets/chat/chat_detail_page_appbar.dart';
import 'package:brn/presentation/widgets/chat/date_chip.dart';
import 'package:brn/presentation/widgets/custom_modal_bottom_sheet.dart';
// import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatDetailGroupScreen extends StatefulWidget {
  @override
  _ChatDetailGroupScreenState createState() => _ChatDetailGroupScreenState();
}

class _ChatDetailGroupScreenState extends State<ChatDetailGroupScreen> {
  List<ChatMessage> chatMessage = [
    ChatMessage(
        message: "Hallo, Apa kabar kalian?", type: MessageType.Receiver),
    ChatMessage(message: "Saya baik", type: MessageType.Receiver),
    ChatMessage(
        message: "Hello Arya, saya baik bagaimana dengan mu",
        type: MessageType.Sender),
    ChatMessage(
        message: "Hello Arya, saya baik bagaimana dengan mu",
        type: MessageType.Sender),
    ChatMessage(
        message: "Saya baik-baik saja, Bekerja dari rumah.",
        type: MessageType.Receiver),
    ChatMessage(
        message: "Oh! Bagus. disini juga sobat", type: MessageType.Sender),
  ];

  List<SendMenuItems> menuItems = [
    SendMenuItems(
        text: "Photos & Videos", icons: Icons.image, color: Colors.amber),
    SendMenuItems(
        text: "Document", icons: Icons.insert_drive_file, color: Colors.blue),
    SendMenuItems(text: "Audio", icons: Icons.music_note, color: Colors.orange),
    SendMenuItems(
        text: "Location", icons: Icons.location_on, color: Colors.green),
    SendMenuItems(text: "Contact", icons: Icons.person, color: Colors.purple),
  ];

  void showModal() {
    showCustomModalBottomSheet(
      context,
      body: ListView.builder(
        itemCount: menuItems.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: ListTile(
              leading: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: menuItems[index].color.shade50,
                ),
                height: 50,
                width: 50,
                child: Icon(
                  menuItems[index].icons,
                  size: 20,
                  color: menuItems[index].color.shade400,
                ),
              ),
              title: Text(menuItems[index].text),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatDetailPageAppBar(
          image: 'assets/images/audi.jpeg',
          title: 'Buser Rencar Nasional',
          subTitle: 'Arya Anggara, Iqbal Saputra, Saya'),
      body: Stack(
        children: <Widget>[
          ListView.builder(
            itemCount: chatMessage.length,
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 10, bottom: 10),
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final now = new DateTime.now();
              if (index != 2) {
                return ChatBubble(
                  chatMessage: chatMessage[index],
                  from: chatMessage[index].type == MessageType.Receiver
                      ? ((index % 2) == 0 ? 'Arya Anggara' : 'Iqbal Saputra')
                      : null,
                );
              } else {
                return Center(
                  child: SizedBox(
                    child: DateChip(
                      date: DateTime(now.year, now.month, now.day - 1),
                    ),
                  ),
                );
              }
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 16, bottom: 10),
              height: 80,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showModal();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 21,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Ketik pesan...",
                          hintStyle: TextStyle(color: Colors.grey.shade500),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              padding: EdgeInsets.only(right: 30, bottom: 50),
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
                backgroundColor: primaryColor,
                elevation: 0,
              ),
            ),
          )
        ],
      ),
    );
  }
}
