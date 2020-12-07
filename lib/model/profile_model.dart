import 'dart:async';

class Profile {
  final String firstName;
  final String lastName;
  final String empCode;
  final int id;
  final DateTime updatedAt;

  const Profile(
      {this.firstName, this.lastName, this.empCode, this.id, this.updatedAt});

  Profile.fromMap(Map<String, dynamic> map)
      : firstName = map['first_name'],
        lastName = map['last_name'],
        empCode = map['emp_code'],
        id = map['id'],
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
