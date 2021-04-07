import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/presenter/news_presenter.dart';
import 'package:cremation/model/news_model.dart';
import 'package:cremation/view/news_detail.dart';
import 'package:auto_size_text/auto_size_text.dart';

class NewsGuestPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsGuestPage>
    implements NewsListViewContract {
  NewsPresenter _presenter;
  bool _isLoading = false;
  bool load = false;
  int page = 1;
  int size = 20;
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
      load = true;
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
    await new Future.delayed(new Duration(seconds: 0));
    page++;

    setState(() {
      _isLoading = false;
      _presenter.newsList(page, size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(bottom: 20.0),
            height: 50.0,
            color: Colors.red),
        body: ListView(children: [
          Container(
              padding: EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: [
                      Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: Column(children: [
                            Image.asset('assets/images/logo_120x120.png',
                                width: 80.0, height: 80.0),
                          ])),
                    ],
                  ),
                ),
                Container(child: load ? newsList() : null),
                Container(
                  height: _isLoading ? 50.0 : 0,
                  color: Colors.transparent,
                  child: Center(
                    child: new CircularProgressIndicator(),
                  ),
                ),
              ]))
        ]));
  }

  Widget newsList() {
    return Column(
        children: newsData
            .map((item) => Card(
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
                              builder: (context) =>
                                  NewsDetailPage(item: item)));
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        AutoSizeText(
                                          item.title.toString(),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color: Color(0xFF000000),
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'SukhumvitText',
                                          ),
                                          minFontSize: 14,
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        /*textWidget(item.title.toString(), 18.0,
                                    0xFF000000, 0, FontWeight.w700),*/
                                        textWidget(item.date.toString(), 16.0,
                                            0xFFEFA746, 0, FontWeight.w500),
                                        /*textWidget(item.shortDescription.toString(),
                                    12.0, 0xFF626262, 0, FontWeight.w400),*/
                                      ])))
                        ]))))
            .toList());
  }
}
