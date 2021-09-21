import 'dart:convert';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/payment/domain/tiket_model.dart';
import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
part 'payment_store.g.dart';

class PaymentStore = _PaymentStoreBase with _$PaymentStore;

abstract class _PaymentStoreBase with Store {
  @observable
  ObservableList<TiketModel> listArtist = <TiketModel>[].asObservable();
  @action
  Future<void> getTiket(id) async {
    var meURL = Uri.parse(
        'http://178.128.154.39:8000/api/mobile/tickets/?event=$id&status=true');
    var response = await http.get(meURL);
    try {
      var dec = json.decode(response.body)['results'] as List;
      listArtist.clear();
      dec.forEach((element) {
        listArtist.add(TiketModel.fromJson(element));
      });
      // Modular.to.pushNamed("/event/lineup");
      print(listArtist.first.description);
    } catch (e) {
      print(e);
    }
  }

  @observable
  double valorTiket = 0;

  @action
  double getValortiket() {
    return this.valorTiket;
  }

  @action
  void setValorTiket(double valorTiket) {
    this.valorTiket = valorTiket;
  }

  @observable
  double valorTotal = 0;
  @observable
  double quantidade = 0;

  @action
  void addTiket() {
    quantidade++;
    valorTotal = valorTotal + valorTiket;
  }

  @action
  void remTiket() {
    quantidade--;
    valorTotal = valorTotal - valorTiket;
  }

  @observable
  bool bntSelecionado = false;

  void selecionado() {
    bntSelecionado = !bntSelecionado;
  }
}
