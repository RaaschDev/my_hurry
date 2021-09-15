// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventsStore on _EventsStoreBase, Store {
  final _$listArtistAtom = Atom(name: '_EventsStoreBase.listArtist');

  @override
  ObservableList<ArtistModel> get listArtist {
    _$listArtistAtom.reportRead();
    return super.listArtist;
  }

  @override
  set listArtist(ObservableList<ArtistModel> value) {
    _$listArtistAtom.reportWrite(value, super.listArtist, () {
      super.listArtist = value;
    });
  }

  final _$listConsumablesAtom = Atom(name: '_EventsStoreBase.listConsumables');

  @override
  ObservableList<ConsumableModel> get listConsumables {
    _$listConsumablesAtom.reportRead();
    return super.listConsumables;
  }

  @override
  set listConsumables(ObservableList<ConsumableModel> value) {
    _$listConsumablesAtom.reportWrite(value, super.listConsumables, () {
      super.listConsumables = value;
    });
  }

  final _$getArtistsAsyncAction = AsyncAction('_EventsStoreBase.getArtists');

  @override
  Future<void> getArtists(dynamic id) {
    return _$getArtistsAsyncAction.run(() => super.getArtists(id));
  }

  final _$getConsumablesAsyncAction =
      AsyncAction('_EventsStoreBase.getConsumables');

  @override
  Future<void> getConsumables(dynamic id) {
    return _$getConsumablesAsyncAction.run(() => super.getConsumables(id));
  }

  @override
  String toString() {
    return '''
listArtist: ${listArtist},
listConsumables: ${listConsumables}
    ''';
  }
}
