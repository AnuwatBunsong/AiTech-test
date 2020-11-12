import 'dart:async';

class News {
  final String title;
  final String shortDescription;
  final String date;
  final String thumbnail;
  final String slug;
  final String content;

  const News(
      {this.title,
      this.shortDescription,
      this.date,
      this.thumbnail,
      this.content,
      this.slug});

  News.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        shortDescription = map['short_description'],
        date = toDate(map['created_at']),
        thumbnail = map['image']['thumbnail_url'],
        slug = map['slug'],
        content = map['content'];
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

toDate(date) {
  var strToDateTime = DateTime.parse(date.toString());
  final convertLocal = strToDateTime.toLocal();
  //var newFormat = DateFormat("dd-MM-yyyy H:mm:ss");
  //String updatedDt = newFormat.format(convertLocal);
  final dateTime =
      "${convertLocal.day.toString()} ${monthThai(convertLocal.month)} ${convertLocal.year + 543}, ${convertLocal.hour.toString()}:${convertLocal.minute.toString()}";
  return dateTime;
}

monthThai($month) {
  switch ($month) {
    case 1:
      return 'ม.ค.';
      break;
    case 2:
      return 'ก.พ.';
      break;
    case 3:
      return 'มี.ค.';
      break;
    case 4:
      return 'เม.ย.';
      break;
    case 5:
      return 'พ.ค.';
      break;
    case 6:
      return 'มิ.ย.';
      break;
    case 7:
      return 'ก.ค.';
      break;
    case 8:
      return 'ส.ค.';
      break;
    case 9:
      return 'ก.ย.';
      break;
    case 10:
      return 'ต.ค.';
      break;
    case 11:
      return 'พ.ย.';
      break;
    case 12:
      return 'ธ.ค.';
      break;
    default:
  }
}
