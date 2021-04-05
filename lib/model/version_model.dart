class Version {
  final String version;
  const Version(
      {this.version});

  Version.fromMap(Map<String, dynamic> map)
      : version = map['version'];
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}
