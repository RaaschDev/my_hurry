import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/events/events_store.dart';

import 'package:hurry/app/modules/src/appbar/ht_default_appbar.dart';
import 'package:hurry/app/modules/src/colors.dart';
import 'package:hurry/app/modules/src/texts.dart';

class LineUpPage extends StatefulWidget {
  const LineUpPage({Key? key}) : super(key: key);

  @override
  _LineUpPageState createState() => _LineUpPageState();
}

class _LineUpPageState extends State<LineUpPage> {
  EventsStore eventsStore = Modular.get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: PreferredSize(
        child: HTDefaultAppBar(),
        preferredSize: Size(double.maxFinite, 150),
      ),
      body: Container(
        height: double.maxFinite,
        child: ListView.builder(
            itemCount: eventsStore.listArtist.length,
            itemBuilder: (context, index) {
              var artista = eventsStore.listArtist[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("${artista.img}"),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Colors.black,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 130,
                      decoration: BoxDecoration(
                        color: Colors.black87,
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: Text(
                              "${artista.description}",
                              style: HTText.primaryTitleTextStyle,
                            ),
                          ),
                          Center(
                            child: Text(
                              '01:00 ate 4:00',
                              style: HTText.accentButtonTextStyle,
                            ),
                          ),
                          Expanded(child: SizedBox()),
                          MaterialButton(
                              onPressed: () {},
                              child: Icon(Icons.sports),
                              height: 56,
                              minWidth: 56,
                              color: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          Expanded(child: SizedBox()),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
