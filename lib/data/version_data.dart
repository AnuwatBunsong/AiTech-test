import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cremation/model/version_model.dart';

class VersionApp {
  final JsonDecoder _decoder = new JsonDecoder();

  Future<Version> versionApp() async {
    final response = await http.get(
        'https://chapanakij.kar-pool.co/api/v1/version');
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new FetchDataException(
          "Error while getting user login [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
    }

    final object = _decoder.convert(jsonBody);
    return Version.fromMap(object);
  }
}
