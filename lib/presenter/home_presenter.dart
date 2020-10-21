import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import '../model/news_model.dart';
import '../utils/exception.dart';
import '../view/home.dart';

class HomePresenter<T> {
  T view;

  final JsonDecoder _decoder = new JsonDecoder();
  //NewsModel _newsModel;

  /*void newsList() {
    _newsModel.getNews().then((Response response) {
      final String jsonBody = response.body;
      final statusCode = response.statusCode;

      if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
        throw FetchDataException(
            "Error while getting contacts [StatusCode:$statusCode, Error:${response.reasonPhrase}]");
      }

      final userContainer = _decoder.convert(jsonBody);
      final List items = userContainer['results'];

      return items;
    });
  }*/
}
