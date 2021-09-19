import 'package:hurry/app/modules/chat/chat_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/chat/pages/chat_page.dart';
import 'package:hurry/app/modules/chat/pages/chats_page.dart';

class ChatModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ChatStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ChatPage()),
    ChildRoute('/chats', child: (_, args) => ChatsPage()),
  ];
}
