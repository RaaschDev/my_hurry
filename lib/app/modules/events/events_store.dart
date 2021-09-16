import 'package:mobx/mobx.dart';

part 'events_store.g.dart';

class EventsStore = _EventsStoreBase with _$EventsStore;

abstract class _EventsStoreBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
