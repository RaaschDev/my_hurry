import 'dart:convert';

import 'package:http/http.dart' as http;

class UserModel {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? birthDate;
  String? cpf;
  String? img;

  UserModel({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.birthDate,
    this.cpf,
    this.img,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    birthDate = json['birth_date'];
    cpf = json['cpf'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['birth_date'] = this.birthDate;
    data['cpf'] = this.cpf;
    data['img'] = this.img;
    return data;
  }

  static Future<UserModel?> getMe(token) async {
    var meURL = Uri.parse('http://178.128.154.39:8000/auth/users/me/');
    var response = await http.get(meURL, headers: {"Authorization": "Token $token"});
    try {
      var dec = json.decode(response.body);
      UserModel me = UserModel.fromJson(dec);
      return me;
    } catch (e) {
      print(e);
    }
  }
}
