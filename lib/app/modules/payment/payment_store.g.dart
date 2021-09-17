// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentStore on _PaymentStoreBase, Store {
  final _$listArtistAtom = Atom(name: '_PaymentStoreBase.listArtist');

  @override
  ObservableList<TiketModel> get listArtist {
    _$listArtistAtom.reportRead();
    return super.listArtist;
  }

  @override
  set listArtist(ObservableList<TiketModel> value) {
    _$listArtistAtom.reportWrite(value, super.listArtist, () {
      super.listArtist = value;
    });
  }

  final _$valorTiketAtom = Atom(name: '_PaymentStoreBase.valorTiket');

  @override
  double get valorTiket {
    _$valorTiketAtom.reportRead();
    return super.valorTiket;
  }

  @override
  set valorTiket(double value) {
    _$valorTiketAtom.reportWrite(value, super.valorTiket, () {
      super.valorTiket = value;
    });
  }

  final _$valorTotalAtom = Atom(name: '_PaymentStoreBase.valorTotal');

  @override
  double get valorTotal {
    _$valorTotalAtom.reportRead();
    return super.valorTotal;
  }

  @override
  set valorTotal(double value) {
    _$valorTotalAtom.reportWrite(value, super.valorTotal, () {
      super.valorTotal = value;
    });
  }

  final _$quantidadeAtom = Atom(name: '_PaymentStoreBase.quantidade');

  @override
  double get quantidade {
    _$quantidadeAtom.reportRead();
    return super.quantidade;
  }

  @override
  set quantidade(double value) {
    _$quantidadeAtom.reportWrite(value, super.quantidade, () {
      super.quantidade = value;
    });
  }

  final _$bntSelecionadoAtom = Atom(name: '_PaymentStoreBase.bntSelecionado');

  @override
  bool get bntSelecionado {
    _$bntSelecionadoAtom.reportRead();
    return super.bntSelecionado;
  }

  @override
  set bntSelecionado(bool value) {
    _$bntSelecionadoAtom.reportWrite(value, super.bntSelecionado, () {
      super.bntSelecionado = value;
    });
  }

  final _$getTiketAsyncAction = AsyncAction('_PaymentStoreBase.getTiket');

  @override
  Future<void> getTiket(dynamic id) {
    return _$getTiketAsyncAction.run(() => super.getTiket(id));
  }

  final _$_PaymentStoreBaseActionController =
      ActionController(name: '_PaymentStoreBase');

  @override
  double getValortiket() {
    final _$actionInfo = _$_PaymentStoreBaseActionController.startAction(
        name: '_PaymentStoreBase.getValortiket');
    try {
      return super.getValortiket();
    } finally {
      _$_PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValorTiket(double valorTiket) {
    final _$actionInfo = _$_PaymentStoreBaseActionController.startAction(
        name: '_PaymentStoreBase.setValorTiket');
    try {
      return super.setValorTiket(valorTiket);
    } finally {
      _$_PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTiket() {
    final _$actionInfo = _$_PaymentStoreBaseActionController.startAction(
        name: '_PaymentStoreBase.addTiket');
    try {
      return super.addTiket();
    } finally {
      _$_PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remTiket() {
    final _$actionInfo = _$_PaymentStoreBaseActionController.startAction(
        name: '_PaymentStoreBase.remTiket');
    try {
      return super.remTiket();
    } finally {
      _$_PaymentStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listArtist: ${listArtist},
valorTiket: ${valorTiket},
valorTotal: ${valorTotal},
quantidade: ${quantidade},
bntSelecionado: ${bntSelecionado}
    ''';
  }
}
