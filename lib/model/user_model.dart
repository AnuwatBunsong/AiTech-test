import 'dart:async';

class User {
  int _id;
  String _username;
  String _password;
  String _token;
  String _refreshToken;
  User(this._username, this._password);

  User.map(dynamic obj) {
    this._username = obj["username"];
    this._password = obj["password"];
  }

  User.token(dynamic obj) {
    this._id = obj["id"];
    this._token = obj["token"];
    this._refreshToken = obj["refreshToken"];
  }

  String get username => _username;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["username"] = _username;
    map["password"] = _password;

    return map;
  }

  User.fromMap(Map<String, dynamic> map)
      : _id = map['id'],
        _token = map['token'],
        _refreshToken = map['refreshToken'];
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}
