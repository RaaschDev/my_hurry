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

      data['userID'] = 1;
      data['userContato'] = 5;
      data['dataEnvio'] = dataTime;
      data['msgLida'] = false;
      data['from'] = 'Ines Brasil';
      data['mine'] = true;
      sendMsg(data);

      // Salva a conversa na  lado de quem recebe
      data['userID'] = 5;
      data['userContato'] = 1;
      data['msgLida'] = false;
      data['from'] = 'Ines Brasil';
      data['mine'] = false;
      receciveMsg(data);
    }
  }

  void capturePhoto() async {
    imgFile = await (ImagePicker().pickImage(source: ImageSource.camera));
  }

  void resetMsg() {
    msgController.clear();
  }

  Stream<QuerySnapshot<Object>> buscarChatContatosFireStore(String userID) {
    return FirebaseFirestore.instance
        .collection("chat")
        .doc(userID)
        .collection("msg")
        .snapshots();
  }

  void abrirChatComUsuario(String userSendId) {}

  Stream<QuerySnapshot<Object>> buscarConversa(String userId, String userChat) {
    return FirebaseFirestore.instance
        .collection("chat")
        .doc(userId)
        .collection("msg")
        .doc(userChat)
        .collection('mensagens')
        .orderBy('dataEnvio')
        .snapshots();
  }

  void sendMsg(Map<String, dynamic> data) {
    FirebaseFirestore.instance
        .collection("chat")
        .doc("usuario1")
        .collection('msg')
        .doc('user5')
        .set({
      'userSendid': 5,
      'userSend': 'Ines Brasil',
      'photoUrl':
          'https://th.bing.com/th/id/OIF.a5nMtXvTyueMvDhiHmkAIw?pid=ImgDet&rs=1'
    });
    FirebaseFirestore.instance
        .collection("chat")
        .doc("usuario1")
        .collection('msg')
        .doc('user5')
        .collection('mensagens')
        .doc()
        .set(data);
  }

  void receciveMsg(Map<String, dynamic> data) {
    FirebaseFirestore.instance
        .collection("chat")
        .doc("usuario5")
        .collection('msg')
        .doc('user1')
        .set({
      'userSendid': 1,
      'userSend': 'Rafael',
      'photoUrl':
          ' https://th.bing.com/th/id/OIP.HQbKw7HNHrKYnMt1oLUplAHaEK?pid=ImgDet&rs=1'
    });
    FirebaseFirestore.instance
        .collection("chat")
        .doc("usuario5")
        .collection('msg')
        .doc('user1')
        .collection('mensagens')
        .doc()
        .set(data);
  }
}
