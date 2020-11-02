import 'dart:async';

class News {
  final String title;
  final String shortDescription;
  final String date;
  final String thumbnail;

  const News({this.title, this.shortDescription, this.date, this.thumbnail});

  News.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        shortDescription = map['short_description'],
        date = map['created_at'],
        thumbnail = map['image']['thumbnail_url'];
}

abstract class NewsRepository {
  Future<List<News>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}
