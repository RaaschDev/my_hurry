import 'package:hurry/app/modules/home/domain/models/event_model.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  @observable
  ObservableList<EventModel> listEvent = <EventModel>[].asObservable();

  Future<void> getEvents() async {
    var meURL = Uri.parse('http://178.128.154.39:8000/api/mobile/events/');
    var response = await http.get(meURL);
    try {
      var dec = json.decode(response.body)['results'] as List;
      listEvent.clear();
      dec.forEach((element) {
        listEvent.add(EventModel.fromJson(element));
      });
      print(listEvent.first.description);
    } catch (e) {
      print(e);
    }
  }
}
