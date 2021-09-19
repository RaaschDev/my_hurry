import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/src/appbar/ht_default_appbar.dart';
import 'package:hurry/app/modules/src/chat/list_msg_widget.dart';
import 'package:hurry/app/modules/src/chat/text_composer.dart';
import 'package:hurry/app/modules/src/colors.dart';
import 'package:hurry/app/modules/src/texts.dart';

class ChatsPage extends StatefulWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
        child: Row(
          children: [HTDefaultAppBar()],
        ),
        preferredSize: Size(double.maxFinite, 150),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListMsgWidget(),
          ),
          TextComposer()
        ],
      ),
    );
  }
}
