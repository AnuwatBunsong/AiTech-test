import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cremation/model/user_model.dart';

class UserLogin {
  final JsonDecoder _decoder = new JsonDecoder();

  Future<User> login(String username, String password) async {
    final response = await http.post(
        'https://chapanakij.karpools.co/api/v1/guest/login',
        body: {"username": username, "password": password});
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new FetchDataException(
          "Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
    }

    final object = _decoder.convert(jsonBody);
    return User.fromMap(object);
  }
}
