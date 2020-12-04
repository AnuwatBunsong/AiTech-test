import 'dart:async';

class Profile {
  final String title;

  const Profile(
      {this.title});

  Profile.fromMap(Map<String, dynamic> map)
      : title = map['title'];
}

abstract class ProfileRepository {
  Future<List<Profile>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}
