import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/presenter/home_presenter.dart';
import 'package:cremation/model/news_model.dart';
import 'package:cremation/view/news_detail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage>
    implements HomeListViewContract {
  HomePresenter _presenter;
  bool _isLoading = true;
  List<News> newsData;

  _HomePageState() {
    _presenter = HomePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _presenter.newsList();
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

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: appBarTitle('หน้าแรก'),
          flexibleSpace: appBarBackground(),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        body: ListView(children: [
          Container(
              padding:
                  EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFE5E5E5),
              ),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Container(
                      padding: EdgeInsets.only(
                          top: 28, left: 11, right: 11, bottom: 28),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.white),
                      child: Row(children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(right: 13),
                            width: 60.0,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                shape: BoxShape.circle,
                                image: new DecorationImage(
                                    fit: BoxFit.fill,
                                    image: new AssetImage(
                                        "assets/images/mockup2.png")))),
                        Expanded(
                            child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                              textWidget('สวัสดี', 18.0, 0xFFEFA746, 1.4,
                                  FontWeight.w800),
                              textWidget('คุณ xxx', 18.0, 0xFF000000, 1.0,
                                  FontWeight.w400),
                              textWidget('เลขสมาชิก : 1124112567357', 12.0,
                                  0xFFACB3BF, 1.3, FontWeight.w400),
                            ])),
                        Container(
                            child: Icon(
                          Icons.navigate_next,
                          color: Color(0xFFC4C4C4),
                          size: 35.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ))
                      ])))),
          Container(
              child: Container(
                  padding:
                      EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
                  child: Column(children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 15),
                        child: Row(children: <Widget>[
                          Expanded(
                              child: textWidget('ข่าวสารและกิจกรรม', 16.0,
                                  0xFFEFA746, 0, FontWeight.w700)),
                          Container(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/news');
                                  },
                                  child: textWidget('ดูข่าวสารทั้งหมด >', 12.0,
                                      0xFFACB3BF, 0, FontWeight.w400)))
                        ])),
                    if (_isLoading)
                      Center(
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0),
                              child: CircularProgressIndicator()))
                    else
                      Container(child: newsList())
                  ])))
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
                                        textWidget(item.title.toString(), 16.0,
                                            0xFF000000, 0, FontWeight.w700),
                                        textWidget(item.date.toString(), 10.0,
                                            0xFFEFA746, 0, FontWeight.w500),
                                        /*textWidget(
                                            item.shortDescription.toString(),
                                            12.0,
                                            0xFF626262,
                                            0,
                                            FontWeight.w400),*/
                                      ])))
                        ]))))
            .toList());
  }

  @override
  bool get wantKeepAlive => true;
}
