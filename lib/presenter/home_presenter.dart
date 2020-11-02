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

  void newsList() {
    api.fetch(2).then((data) {
      _view.onLoadNewsComplete(data);
    }).catchError((e) {
      _view.onLoadNewsError();
    });
  }
}

