import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/controllers/event/event_controller.dart';
import 'package:hurry/app/modules/home/domain/models/event_model.dart';
import 'package:hurry/app/modules/home/home_store.dart';
import 'package:hurry/app/modules/src/colors.dart';

class CardNextEvents extends StatelessWidget {
  HomeStore store = Modular.get();
  EventController eventController = Modular.get();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Observer(
      builder: (context) => Container(
        height: screenSize.height * .25,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    'Proximos Eventos',
                    style: TextStyle(color: AppColors.primaryColor, fontSize: 20),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: store.listEvent.length,
                  itemBuilder: (context, index) {
                    EventModel evento = store.listEvent[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: InkWell(
                        onTap: () {
                          eventController.eventModel = evento;
                          Modular.to.pushNamed('/event');
                        },
                        child: Container(
                          height: screenSize.height * .15,
                          width: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage('${evento.image}'),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
