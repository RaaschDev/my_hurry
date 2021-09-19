// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChatStore on _ChatStoreBase, Store {
  final _$msgControllerAtom = Atom(name: '_ChatStoreBase.msgController');

  @override
  TextEditingController get msgController {
    _$msgControllerAtom.reportRead();
    return super.msgController;
  }

  @override
  set msgController(TextEditingController value) {
    _$msgControllerAtom.reportWrite(value, super.msgController, () {
      super.msgController = value;
    });
  }

  final _$imgFileAtom = Atom(name: '_ChatStoreBase.imgFile');

  @override
  XFile? get imgFile {
    _$imgFileAtom.reportRead();
    return super.imgFile;
  }

  @override
  set imgFile(XFile? value) {
    _$imgFileAtom.reportWrite(value, super.imgFile, () {
      super.imgFile = value;
    });
  }

  final _$urlImgAtom = Atom(name: '_ChatStoreBase.urlImg');

  @override
  String get urlImg {
    _$urlImgAtom.reportRead();
    return super.urlImg;
  }

  @override
  set urlImg(String value) {
    _$urlImgAtom.reportWrite(value, super.urlImg, () {
      super.urlImg = value;
    });
  }

  final _$carregandoImagemAtom = Atom(name: '_ChatStoreBase.carregandoImagem');

  @override
  bool get carregandoImagem {
    _$carregandoImagemAtom.reportRead();
    return super.carregandoImagem;
  }

  @override
  set carregandoImagem(bool value) {
    _$carregandoImagemAtom.reportWrite(value, super.carregandoImagem, () {
      super.carregandoImagem = value;
    });
  }

  @override
  ObservableFuture<void> sendMessage(String msg) {
    final _$future = super.sendMessage(msg);
    return ObservableFuture<void>(_$future);
  }

  @override
  String toString() {
    return '''
msgController: ${msgController},
imgFile: ${imgFile},
urlImg: ${urlImg},
carregandoImagem: ${carregandoImagem}
    ''';
  }
}
