import 'dart:convert';

import 'package:hurry/app/modules/events/domain/artist_model.dart';
import 'package:hurry/app/modules/events/domain/consumable_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'events_store.g.dart';

class EventsStore = _EventsStoreBase with _$EventsStore;

abstract class _EventsStoreBase with Store {
  @observable
  ObservableList<ArtistModel> listArtist = <ArtistModel>[].asObservable();
  @action
  Future<void> getArtists(id) async {
    var meURL = Uri.parse('http://178.128.154.39:8000/api/mobile/artists/?event=$id');
    var response = await http.get(meURL);
    try {
      var dec = json.decode(response.body)['results'] as List;
      listArtist.clear();
      dec.forEach((element) {
        listArtist.add(ArtistModel.fromJson(element));
      });
      print(listArtist.first.description);
    } catch (e) {
      print(e);
    }
  }

  @observable
  ObservableList<ConsumableModel> listConsumables = <ConsumableModel>[].asObservable();
  @action
  Future<void> getConsumables(id) async {
    var meURL = Uri.parse('http://178.128.154.39:8000/api/mobile/consumables/?event=$id');
    var response = await http.get(meURL);
    try {
      var dec = json.decode(response.body)['results'] as List;
      listConsumables.clear();
      dec.forEach((element) {
        listConsumables.add(ConsumableModel.fromJson(element));
      });
      print(listConsumables.first.description);
    } catch (e) {
      print(e);
    }
  }
}
