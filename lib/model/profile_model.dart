import 'dart:async';

class Profile {
  final int id;
  final String memberId;
  final String firstName;
  final String lastName;
  final String birthDate;
  final String address;
  final String telephone;
  final String approve;
  final DateTime updatedAt;

  const Profile(
      {this.id,
      this.memberId,
      this.firstName,
      this.lastName,
      this.birthDate,
      this.address,
      this.telephone,
      this.approve,
      this.updatedAt});

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['member']['id'],
        memberId = map['member']['member_id'],
        firstName = map['member']['first_name'],
        lastName = map['member']['last_name'],
        birthDate = convertDate(map['member']['birthdate']),
        address =
            "${map['member']['address'].trim()} ${map['member']['tambon'].trim()} ${map['member']['amphur'].trim()} ${map['member']['changwat'].trim()}",
        telephone = map['member']['telephone'],
        approve = convertDate(map['member']['approve_date']),
        updatedAt = map['update_at'];
}

abstract class ProfileRepository {
  Future<Profile> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}

convertDate(date) {
  var strToDateTime = DateTime.parse(date);
  final convertLocal = strToDateTime.toLocal();
  final dateTime =
      "${convertLocal.day.toString()} ${monthThai(convertLocal.month)} ${convertLocal.year + 543}";
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
