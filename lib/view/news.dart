import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/presenter/news_presenter.dart';
import 'package:cremation/model/news_model.dart';
import 'package:cremation/view/news_detail.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> implements NewsListViewContract {
  NewsPresenter _presenter;
  bool _isLoading = false;
  int page = 1;
  int size = 1;
  List<News> newsData;

  _NewsPageState() {
    _presenter = NewsPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.newsList(page, size);
  }

  @override
  void onLoadNewsComplete(List<News> items) {
    setState(() {
      _isLoading = false;
      newsData = items;
    });
  }

  @override
  void onLoadNewsError() {}

  _onEndScroll(ScrollMetrics metrics) {
    setState(() {
      _isLoading = true;
    });
    _loadData();
  }

  Future _loadData() async {
    await new Future.delayed(new Duration(seconds: 2));
    page++;

    setState(() {
      _isLoading = false;
      _presenter.newsList(page, size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: appBarTitle('ข่าวสารทั้งหมด'),
            flexibleSpace: appBarBackground()),
        backgroundColor: Color(0xFFFFFFFF),
        body: Container(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
            child: Column(children: [
              Expanded(
                  child: NotificationListener<ScrollNotification>(
                // ignore: missing_return
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification &&
                      scrollNotification.metrics.pixels ==
                          scrollNotification.metrics.maxScrollExtent) {
                    _onEndScroll(scrollNotification.metrics);
                  }
                },
                child: ListView.builder(
                  itemCount: newsData == null ? 0 : newsData.length,
                  itemBuilder: (context, index) {
                    return newsList(newsData[index]);
                  },
                ),
              )),
              Container(
                height: _isLoading ? 50.0 : 0,
                color: Colors.transparent,
                child: Center(
                  child: new CircularProgressIndicator(),
                ),
              ),
            ])));
  }

  Widget newsList(item) {
    return Card(
        elevation: 4,
        margin: EdgeInsets.only(bottom: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
          side: BorderSide(
            color: Color(0xFFEFEFEF),
            width: 1.0,
          ),
        ),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsDetailPage(item: item)));
            },
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 6,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                          child: Image.network(
                            item.thumbnail,
                            width: (MediaQuery.of(context).size.width),
                            fit: BoxFit.fill,
                          ))),
                  Expanded(
                      flex: 4,
                      child: Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                textWidget(item.title.toString(), 16.0,
                                    0xFF000000, 0, FontWeight.w700),
                                textWidget(item.date.toString(), 10.0,
                                    0xFFEFA746, 0, FontWeight.w500),
                                textWidget(item.shortDescription.toString(),
                                    12.0, 0xFF626262, 0, FontWeight.w400),
                              ])))
                ])));
  }
}
