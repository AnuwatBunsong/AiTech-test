import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cremation/model/profile_model.dart';

class GetProfile {
  final JsonDecoder _decoder = new JsonDecoder();

  Future<Profile> getProfile(String token) async {
    final response =
        await http.get('https://chapanakij.karpools.co/api/v1/me', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    });

    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new FetchDataException(
          "Error while getting Profile [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
    }

    final object = _decoder.convert(jsonBody);
    return Profile.fromMap(object);
  }

  Future updateImageProfile(String token, image) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Accept': 'application/json',
      'Accept-Language': 'en',
      'Authorization': 'Bearer $token',
    };

    final url = 'https://chapanakij.karpools.co/api/v1/c/me/profile_picture';
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(headers);
    request.files.add(await http.MultipartFile.fromPath('image', image));
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    return respStr;
  }
}
