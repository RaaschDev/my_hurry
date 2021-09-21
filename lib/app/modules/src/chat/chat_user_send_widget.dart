import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/chat/chat_store.dart';
import 'package:hurry/app/modules/src/colors.dart';
import 'package:hurry/app/modules/src/texts.dart';

class ChatUserSendWidget extends StatelessWidget {
  final String title;
  final DocumentSnapshot? data;

  const ChatUserSendWidget(
      {Key? key, this.title = "ChatUserSendWidget", this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ChatStore chatStore = Modular.get();
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color: AppColors.primaryColor,
              style: BorderStyle.solid,
              width: 1,
            )),
        trailing: Padding(
          padding: EdgeInsets.symmetric(vertical: 8),
          child: CircleAvatar(
              maxRadius: 30, backgroundImage: NetworkImage(data!['photoUrl'])),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data!['userSend'],
              style: HTText.primaryInputTextStyle,
            ),
            Text(
              '10/09/2021 - 19:23:44',
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ],
        ),
        onTap: () {},
      ),
    );
  }
}
