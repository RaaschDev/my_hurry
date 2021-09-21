import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hurry/app/modules/src/texts.dart';

class ChatMessageWidget extends StatelessWidget {
  final String title;
  final DocumentSnapshot? data;
  final int userID;
  const ChatMessageWidget(
      {Key? key,
      this.title = "ChatMessageWidget",
      this.data,
      required this.userID})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          data!['mine'] == false
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIF.a5nMtXvTyueMvDhiHmkAIw?pid=ImgDet&rs=1'),
                  ),
                )
              : Container(),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: data!['mine'] == false
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.end,
              children: [
                data!['urlImg'] != ''
                    ? Image.network(
                        data!['urlImg'],
                        width: 250,
                      )
                    : SizedBox(),
                data!['from'] != null
                    ? Text(
                        data!['from'],
                        style: HTText.primaryButtonTextStyle,
                        textAlign: data!['mine'] == false
                            ? TextAlign.start
                            : TextAlign.end,
                      )
                    : SizedBox(),
                Text(
                  data!['text'],
                  style: HTText.accentButtonTextStyle,
                  textAlign:
                      data!['mine'] == false ? TextAlign.start : TextAlign.end,
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          data!['mine'] == true
              ? Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://avatarfiles.alphacoders.com/156/thumb-1920-156922.jpg'),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
