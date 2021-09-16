import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthModel {
  String? authToken;

  AuthModel({this.authToken});

  AuthModel.fromJson(Map<String, dynamic> json) {
    authToken = json['auth_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['auth_token'] = this.authToken;
    return data;
  }

  static Future<AuthModel?> login(password, email) async {
    var authURL = Uri.parse('http://178.128.154.39:8000/auth/token/token/login/');
    var response = await http.post(authURL, body: {"password": password, "email": email});
    try {
      var dec = json.decode(response.body);
      AuthModel token = AuthModel.fromJson(dec);
      return token;
    } catch (e) {
      print(e);
    }
  }
}
