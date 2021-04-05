import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cremation/model/token_model.dart';

class Token {
  final JsonDecoder _decoder = new JsonDecoder();

  Future<RequestToken> tokens(String refreshToken) async {
    final response = await http.post(
        'https://chapanakij.kar-pool.co/api/v1/tokens',
        body: jsonEncode({"refresh_token": refreshToken}),
        headers: {
          'Accept': 'application/json',
          "Content-Type": "application/json"
        });
    final jsonBody = response.body;
    final statusCode = response.statusCode;
    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new FetchDataException(
          "Error while getting token [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
    }

    final object = _decoder.convert(jsonBody);
    return RequestToken.fromMap(object);
  }
}
