import 'package:hurry/app/modules/events/events_Page.dart';
import 'package:hurry/app/modules/events/events_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/events/pages/line_up.dart';

class EventsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => EventsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => EventsPage()),
    ChildRoute('/lineup', child: (_, args) => LineUpPage()),
  ];
}
