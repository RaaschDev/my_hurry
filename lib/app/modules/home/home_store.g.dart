// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on HomeStoreBase, Store {
  final _$listEventAtom = Atom(name: 'HomeStoreBase.listEvent');

  @override
  ObservableList<EventModel> get listEvent {
    _$listEventAtom.reportRead();
    return super.listEvent;
  }

  @override
  set listEvent(ObservableList<EventModel> value) {
    _$listEventAtom.reportWrite(value, super.listEvent, () {
      super.listEvent = value;
    });
  }

  @override
  String toString() {
    return '''
listEvent: ${listEvent}
    ''';
  }
}
