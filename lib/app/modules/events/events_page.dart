import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/controllers/event/event_controller.dart';
import 'package:hurry/app/modules/events/events_store.dart';
import 'package:flutter/material.dart';
import 'package:hurry/app/modules/home/widgets/back_button.dart';
import 'package:hurry/app/modules/home/widgets/event_banner.dart';
import 'package:hurry/app/modules/home/widgets/event_header.dart';
import 'package:hurry/app/modules/src/colors.dart';

class EventsPage extends StatefulWidget {
  final String title;
  const EventsPage({Key? key, this.title = 'EventsPage'}) : super(key: key);
  @override
  EventsPageState createState() => EventsPageState();
}

class EventsPageState extends State<EventsPage> {
  final EventsStore store = Modular.get();
  EventController event = Modular.get();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: screenSize.height,
        child: Stack(
          children: [
            EventBanner(
              img: '${event.eventModel?.image}',
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: screenSize.height * .75,
                decoration: BoxDecoration(
                  color: AppColors.backGroundColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    EventHeader(
                      title: "${event.eventModel?.description}",
                      date: "${event.eventModel?.date}",
                      start: "${event.eventModel?.start}",
                      end: "${event.eventModel?.end}",
                    ),
                  ],
                ),
              ),
            ),
            BackButtonWidget()
          ],
        ),
      ),
    );
  }
}
