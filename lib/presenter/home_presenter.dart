import 'dart:async';
import 'dart:convert';

import 'package:cremation/model/news_model.dart';
import 'package:cremation/utils/exception.dart';
import 'package:cremation/data/news_data.dart';
import 'package:cremation/injection/injector.dart';
import 'package:http/http.dart';

abstract class HomeListViewContract {
  void onLoadNewsComplete(List<News> items);
  void onLoadNewsError();
}

class HomePresenter {
  HomeListViewContract _view;
  NewsRepository _repository;

  HomePresenter(this._view) {
    _repository = Injector().newsRepository;
  }

  void loadNews(int size) {
    assert(_view != null);

    _repository
        .fetch()
        .then((data) => _view.onLoadNewsComplete(data))
        .catchError((onError) {
      print('error:' + onError);
      _view.onLoadNewsError();
    });
  }
}
