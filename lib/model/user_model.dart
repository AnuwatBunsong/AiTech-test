class User {
  final int id;
  final String username;
  final String password;
  final String token;
  final String refreshToken;
  const User(
      {this.id, this.username, this.password, this.token, this.refreshToken});

  User.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        password = map['password'],
        token = map['token'],
        refreshToken = map['refresh_token'];
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}
