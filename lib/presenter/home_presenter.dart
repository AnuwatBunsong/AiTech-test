import 'package:cremation/model/news_model.dart';
import 'package:cremation/data/news_data.dart';

abstract class HomeListViewContract {
  void onLoadNewsComplete(List<News> items);
  void onLoadNewsError();
}

class HomePresenter {
  HomeListViewContract _view;
  NewsListRepository api = new NewsListRepository();
  HomePresenter(this._view);

  int _page = 1;
  int _size = 5;

  void newsList() {
    api.fetch(_page, _size).then((data) {
      _view.onLoadNewsComplete(data);
    }).catchError((e) {
      _view.onLoadNewsError();
    });
  }
}
