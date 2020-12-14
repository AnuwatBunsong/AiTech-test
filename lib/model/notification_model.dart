import 'dart:async';

class NotificationModel {
  final int id;
  final String title;
  final String description;
  final bool newItem;
  final String createDate;

  const NotificationModel(
      {this.id, this.title, this.description, this.newItem, this.createDate});

  NotificationModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'],
        description = map['description'],
        newItem = checkItem(map['created_date']),
        createDate = toDate(map['created_date']);

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["title"] = title;
    map["description"] = description;
    map["created_date"] = createDate;
    return map;
  }
}

abstract class NotificationRepository {
  Future<List<NotificationModel>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}

checkItem(date) {
  return true;
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
