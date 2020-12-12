import 'dart:async';

class Profile {
  final int id;
  final String memberId;
  final String firstName;
  final String lastName;
  final String birthDate;
  final DateTime updatedAt;

  const Profile(
      {this.id,
      this.memberId,
      this.firstName,
      this.lastName,
      this.birthDate,
      this.updatedAt});

  Profile.fromMap(Map<String, dynamic> map)
      : id = map['member']['id'],
        memberId = map['member']['member_id'],
        firstName = map['member']['first_name'],
        lastName = map['member']['last_name'],
        birthDate = convertDate(map['member']['birthdate']),
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
  return convertLocal;
}
