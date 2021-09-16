import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hurry/app/modules/auth/domain/models/auth_model.dart';
import 'package:mobx/mobx.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'domain/models/user_model.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final cloudinary = Cloudinary(
    "281941533576787",
    "cALe807tCHhktbxlOTvTfLBnFow",
    "dyzuhli2j",
  );
  @observable
  AuthModel? token;
  @observable
  UserModel? me;

  @action
  Future<void> login(password, email) async {
    token = await AuthModel.login(password, email) as AuthModel;
    if (token?.authToken != null) {
      me = await UserModel.getMe(token?.authToken) as UserModel;
      Modular.to.pushReplacementNamed('/');
    }
  }

  @action
  Future<void> register(email, first_name, last_name, gender, birth_date, cpf, img, password) async {
    var registerURL = Uri.parse('http://178.128.154.39:8000/auth/users/');
    Map<String, String> body = {
      "email": "$email",
      "first_name": "$first_name",
      "last_name": "$last_name",
      "gender": "$gender",
      "birth_date": "$birth_date",
      "cpf": "$cpf",
      "img": "$img",
      "password": "$password",
    };
    Map<String, String> headers = {"Content-Type": "application/json"};
    var response = await http.post(registerURL, headers: headers, body: json.encode(body));
    try {
      print(response.statusCode);
      if (response.statusCode == 201) {
        await login(password, email);
      } else {
        print(response.statusCode);
        print(response.body);
        print('erro');
      }
    } catch (e) {
      print(response.statusCode);
      print(e);
    }
  }
}
