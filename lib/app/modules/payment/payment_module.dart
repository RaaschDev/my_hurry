import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/payment/pages/payment_card.dart';
import 'package:hurry/app/modules/payment/pages/payment_page.dart';
import 'package:hurry/app/modules/payment/payment_store.dart';

class PaymentModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PaymentStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => PaymentPage()),
    ChildRoute('/card_payment', child: (_, args) => PaymentCard()),
    //ChildRoute('/pix_payment', child: (_, args) => PaymentPix()),
    //ChildRoute('/payment_success', child: (_, args) => PaymentSuccess()),
  ];
}
