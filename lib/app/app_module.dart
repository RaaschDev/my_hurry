import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/auth/auth_module.dart';
import 'package:hurry/app/modules/controllers/event/event_controller.dart';
import 'package:hurry/app/modules/events/events_module.dart';
import 'package:hurry/app/modules/home/domain/models/event_model.dart';
import 'package:hurry/app/modules/payment/payment_module.dart';

import 'modules/auth/auth_store.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore()),
    Bind.lazySingleton((i) => EventController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/event', module: EventsModule()),
    ModuleRoute('/payment', module: PaymentModule()),
  ];
}
