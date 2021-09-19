import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'chat_store.g.dart';

class ChatStore = _ChatStoreBase with _$ChatStore;

abstract class _ChatStoreBase with Store {
  @observable
  TextEditingController msgController = TextEditingController();

  @observable
  XFile? imgFile;

  @observable
  String urlImg = '';

  @observable
  bool carregandoImagem = false;

  @observable
  Future<void> sendMessage(String msg) async {
    if (msg != null || imgFile != null) {
      Map<String, dynamic> data = {};
      DateTime dataTime = DateTime.now();
      data['userID'] = 001;
      data['userSend'] = 002;
      data['dataEnvio'] = dataTime;
      data['from'] = 'Abner Sanlai';

      if (imgFile != null) {
        data['urlImg'] = '';
        if (imgFile!.path != '') {
          carregandoImagem = true;
          UploadTask task = FirebaseStorage.instance
              .ref()
              .child(dataTime.toString())
              .putFile(File(imgFile!.path));
          var img = await (await task).ref.getDownloadURL();
          urlImg = img.toString();
          data['urlImg'] = urlImg;
          urlImg = '';
          carregandoImagem = false;
        }
      } else {
        data['urlImg'] = '';
      }

      if (msg != null) {
        data['text'] = msg;
        resetMsg();
      } else {
        data['text'] = '';
      }
      FirebaseFirestore.instance
          .collection("chat")
          .doc("usuario2")
          .collection('msg')
          .doc('user2to3')
          .collection('mensagens')
          .doc()
          .set(data);
    }
  }

  void capturePhoto() async {
    imgFile = await (ImagePicker().pickImage(source: ImageSource.camera));
  }

  void resetMsg() {
    msgController.clear();
  }

  void buscarChats() {}
}
