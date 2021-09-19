import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hurry/app/modules/src/chat/chat_message_widget.dart';
import 'package:hurry/app/modules/src/texts.dart';

class ListMsgWidget extends StatelessWidget {
  final String title;
  //final BuildContext context;
  const ListMsgWidget({
    Key? key,
    this.title = "ListMsgWidget",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("msg")
          .orderBy('dataEnvio')
          .snapshots(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
          default:
            List<DocumentSnapshot> documents =
                snapshot.data!.docs.reversed.toList();

            return ListView.builder(
              itemCount: documents.length,
              reverse: true,
              itemBuilder: (context, index) {
                return ChatMessageWidget(
                  data: documents[index],
                );
              },
            );
        }
      },
    );
  }
}
