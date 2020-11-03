import 'package:cremation/model/news_model.dart';
import 'package:cremation/data/news_data.dart';

abstract class NewsListViewContract {
  void onLoadNewsComplete(List<News> items);
  void onLoadNewsError();
}

class NewsPresenter {
  NewsListViewContract _view;
  NewsListRepository api = new NewsListRepository();
  NewsPresenter(this._view);

  void newsList(int size) {
    api.fetch(size).then((data) {
      _view.onLoadNewsComplete(data);
    }).catchError((e) {
      _view.onLoadNewsError();
    });
  }
}
