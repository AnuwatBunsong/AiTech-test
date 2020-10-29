import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cremation/model/news_model.dart';

class NewsListRepository implements NewsRepository {
  final JsonDecoder _decoder = new JsonDecoder();

  Future<List<News>> fetch() async {
    final response =
        await http.get('https://chapanakij.karpools.co/api/v1/news');
    final jsonBody = response.body;
    final statusCode = response.statusCode;

    if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
      throw new FetchDataException(
          "Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
    }

    final contactsContainer = _decoder.convert(jsonBody);
    final List contactItems = contactsContainer['entities'];
    return contactItems.map((contactRaw) => News.fromMap(contactRaw)).toList();
  }
}
