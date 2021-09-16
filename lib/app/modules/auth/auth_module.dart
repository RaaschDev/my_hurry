import 'package:hurry/app/modules/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/auth/pages/auth_page.dart';
import 'package:hurry/app/modules/auth/pages/register_page.dart';
import 'package:hurry/app/modules/auth/register_store.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RegisterStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AuthPage()),
    ChildRoute('/register', child: (_, args) => RegisterPage()),
  ];
}
