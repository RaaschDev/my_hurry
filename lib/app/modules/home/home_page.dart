import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_story_list/flutter_story_list.dart';
import 'package:hurry/app/modules/auth/auth_store.dart';
import 'package:hurry/app/modules/auth/domain/models/user_model.dart';
import 'package:hurry/app/modules/home/widgets/card_next_events.dart';
import 'package:hurry/app/modules/src/colors.dart';

import 'domain/models/event_model.dart';
import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  AuthStore auth = Modular.get();

  @override
  Widget build(BuildContext context) {
    UserModel? user = auth.me;
    store.getEvents();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bem Vindo ${user?.firstName ?? ""}',
          style: TextStyle(color: AppColors.primaryColor),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColors.backGroundColor,
        actions: [
          user?.email != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: NetworkImage('${user?.img}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                )
              : TextButton(
                  onPressed: () {
                    Modular.to.pushNamed('/auth');
                  },
                  child: Text('Login'))
        ],
      ),
      body: Observer(builder: (context) {
        if (store.listEvent.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Column(
            children: [
              CardNextEvents(),
            ],
          );
        }
      }),
    );
  }
}
