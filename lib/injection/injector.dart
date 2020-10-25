import 'package:cremation/data/news_data.dart';
import 'package:cremation/model/news_model.dart';

enum Flavor { MOCK, PRO }

class Injector {
  static final Injector _singleton = Injector._internal();
  static Flavor _flavor;

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory Injector() {
    return _singleton;
  }

  Injector._internal();

  NewsRepository get newsRepository {
    return NewsListRepository();
  }
}
