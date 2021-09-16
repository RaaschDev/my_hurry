// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  final _$tokenAtom = Atom(name: '_AuthStoreBase.token');

  @override
  AuthModel? get token {
    _$tokenAtom.reportRead();
    return super.token;
  }

  @override
  set token(AuthModel? value) {
    _$tokenAtom.reportWrite(value, super.token, () {
      super.token = value;
    });
  }

  final _$meAtom = Atom(name: '_AuthStoreBase.me');

  @override
  UserModel? get me {
    _$meAtom.reportRead();
    return super.me;
  }

  @override
  set me(UserModel? value) {
    _$meAtom.reportWrite(value, super.me, () {
      super.me = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthStoreBase.login');

  @override
  Future<void> login(dynamic password, dynamic email) {
    return _$loginAsyncAction.run(() => super.login(password, email));
  }

  final _$registerAsyncAction = AsyncAction('_AuthStoreBase.register');

  @override
  Future<void> register(
      dynamic email,
      dynamic first_name,
      dynamic last_name,
      dynamic gender,
      dynamic birth_date,
      dynamic cpf,
      dynamic img,
      dynamic password) {
    return _$registerAsyncAction.run(() => super.register(
        email, first_name, last_name, gender, birth_date, cpf, img, password));
  }

  @override
  String toString() {
    return '''
token: ${token},
me: ${me}
    ''';
  }
}
