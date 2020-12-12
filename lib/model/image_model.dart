import 'dart:async';

class ImageGallery {
  final int id;
  final String image;
  final String name;
  final int size;

  const ImageGallery({this.id, this.image, this.name, this.size});

  ImageGallery.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        image = map['image'],
        name = map['name'],
        size = map['size'];
}

abstract class ImageRepository {
  Future<List<ImageGallery>> fetch();
}

class FetchDataException implements Exception {
  String _message;

  FetchDataException(this._message);

  String toString() {
    return "Exception: $_message";
  }
}
