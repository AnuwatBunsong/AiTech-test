import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiNewsService {
  String _baseUrl = "http://api.google.com/";

  Future<Response> getNews(int size) {
    return http.get("$_baseUrl?results=$size");
  }
}
