class News {
  final double id;
  final String title;

  const News({this.id, this.title});

  News.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        title = map['title'];
}
