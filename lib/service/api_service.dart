import 'dart:async';
import 'package:http/http.dart' as http;

class ApiService {
  String apiUrl = 'https://dcat.karpools.co/api/v1';

  Future<http.Response> getNews(int size) async {
    return await http.get('$apiUrl/news');
  }
}
