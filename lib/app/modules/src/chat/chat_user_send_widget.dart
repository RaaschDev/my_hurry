import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/src/texts.dart';

class ChatUserSendWidget extends StatelessWidget {
  final String title;
  final DocumentSnapshot? data;
  const ChatUserSendWidget(
      {Key? key, this.title = "ChatUserSendWidget", this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data!['usuario1']);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
            maxRadius: 30,
            backgroundImage: 001 == 001
                ? NetworkImage(
                    'https://static1.purepeople.com.br/articles/7/28/07/77/@/3189181-mulher-de-gusttavo-lima-andressa-suita-624x600-2.jpg')
                : NetworkImage(
                    'https://static1.purepeople.com.br/articles/1/31/06/61/@/3513419-andressa-suita-analisa-separacao-de-gust-624x600-2.jpg')),
        title: Text(
          title,
          style: HTText.primaryInputTextStyle,
        ),
      ),
    );
  }
}
