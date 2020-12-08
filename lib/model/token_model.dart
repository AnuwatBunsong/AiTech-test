class RequestToken {
  final int id;
  final String createdAt;
  final String updatedAt;
  final String token;
  final String refreshToken;
  const RequestToken(
      {this.id, this.createdAt, this.updatedAt, this.token, this.refreshToken});

  RequestToken.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        createdAt = map['created_at'],
        updatedAt = map['updated_at'],
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
