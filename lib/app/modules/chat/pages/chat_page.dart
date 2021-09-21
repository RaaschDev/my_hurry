import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:hurry/app/modules/chat/chat_store.dart';
import 'package:hurry/app/modules/src/appbar/ht_default_appbar.dart';
import 'package:hurry/app/modules/src/chat/chat_user_send_widget.dart';
import 'package:hurry/app/modules/src/colors.dart';
import 'package:hurry/app/modules/src/texts.dart';

class ChatPage extends StatefulWidget {
  final String title;
  const ChatPage({Key? key, this.title = 'ChatPage'}) : super(key: key);
  @override
  ChatPageState createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final ChatStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: PreferredSize(
          child: AppBar(
            centerTitle: true,
            title: Text(
              'CHAT',
              style: HTText.primaryInputTextStyle,
              textAlign: TextAlign.center,
            ),
            iconTheme: IconThemeData(color: AppColors.primaryColor),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: BackButton(),
          ),
          preferredSize: Size(double.maxFinite, 60),
        ),
        body: LayoutBuilder(
          builder: (_, constrains) {
            return StreamBuilder<QuerySnapshot>(
              stream: store.buscarChatContatosFireStore('usuario1'),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                  case ConnectionState.waiting:
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  default:
                    List<DocumentSnapshot> documents = snapshot.data!.docs;
                    return Container(
                      child: ListView.builder(
                        itemCount: documents.length,
                        reverse: false,
                        itemBuilder: (context, index) {
                          return ChatUserSendWidget(data: documents[index]);
                        },
                      ),
                    );
                }
              },
            );
          },
        ));
  }
}
