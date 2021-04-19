import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/presenter/news_presenter.dart';
import 'package:cremation/model/news_model.dart';
import 'package:cremation/view/news_detail.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/rendering.dart';
import 'package:cremation/presenter/version_presenter.dart';
import 'package:cremation/model/version_model.dart';
import 'package:cremation/presenter/token_presenter.dart';
import 'package:cremation/model/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewsGuestPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsGuestPage>
    implements NewsListViewContract, TokenContract, VersionContract {
  NewsPresenter _presenter;
  TokenPresenter _tokenPresenter;
  VersionPresenter _versionPresenter;
  bool _isLoading = false;
  bool load = false;
  int page = 1;
  int size = 20;
  List<News> newsData;
  double _bottomBar = 0;
  ScrollController scrollController = new ScrollController();
  bool isVisible = true;
  var appVersion = '1.0.0';

  _NewsPageState() {
    _presenter = NewsPresenter(this);
    _tokenPresenter = new TokenPresenter(this);
    _versionPresenter = new VersionPresenter(this);
  }

  @override
  void initState() {
    super.initState();
    checkVersion();

    scrollController.addListener(() {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        if (isVisible)
          setState(() {
            isVisible = false;
          });
      }
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (!isVisible)
          setState(() {
            isVisible = true;
          });
      }
    });
  }

  void checkVersion() async {
    _versionPresenter.versionApp();
  }

  @override
  void onVersionSuccess(Version version) async {
    if (appVersion == version.version) {
      autoLogIn();
    } else {
      onVersionError('error');
    }
  }

  void autoLogIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');
    final String refreshToken = prefs.getString('refreshToken');

    if (token != null) {
      _tokenPresenter.requestToken(refreshToken);
    } else {
      _presenter.newsList(page, size);
    }
  }

  @override
  void requestTokenError(String errorTxt) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('refreshToken');
    prefs.remove('userData');
    _presenter.newsList(page, size);
  }

  @override
  void requestTokenSuccess(RequestToken response) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', response.token);
    prefs.setString('refreshToken', response.refreshToken);
    Navigator.pushNamed(context, '/main_page');
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

  @override
  Widget build(BuildContext context) {
    if (load) {
      return Scaffold(
        backgroundColor: Color(0xFFE5E5E5),
        body: Stack(
          children: <Widget>[
            ListView(controller: scrollController, children: [
              Container(
                  padding:
                      EdgeInsets.only(top: 0, left: 15, right: 15, bottom: 10),
                  child: Column(children: [
                    Container(
                      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                      child: Column(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
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
            ]),
            AnimatedPositioned(
                height: 65.0,
                bottom: isVisible ? _bottomBar : -65.0,
                duration: const Duration(milliseconds: 200),
                width: MediaQuery.of(context).size.width,
                child: Container(
                    height: 0,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 1],
                      colors: [
                        Color.fromRGBO(0, 0, 0, 0),
                        Color.fromRGBO(0, 0, 0, 0.5),
                      ],
                    )),
                    child: Container(
                        height: 50,
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        margin: EdgeInsets.only(bottom: 15.0),
                        child: /*_isLoading ? new CircularProgressIndicator() :*/ RaisedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/login');
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            color: Colors.white,
                            padding: EdgeInsets.all(0.0),
                            child: Container(
                                constraints: BoxConstraints(minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text("เข้าสู่ระบบ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFEFA746),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 20,
                                    ))))))),
          ],
        ),
      );
    } else {
      return Scaffold(
          body: Container(
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: Center(
          child: new CircularProgressIndicator(),
        ),
      ));
    }
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

  @override
  void onVersionError(String errorTxt) {
    //_showSnackBar(errorTxt);
    //setState(() => _isLoading = false);
    Alert(
      context: context,
      title: "ตรวจพบเวอร์ชั่นเก่า" + "\n" + "กรุณาติดตั้งเวอร์ชั่นใหม่",
      style: AlertStyle(
          isCloseButton: false,
          titleStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontFamily: 'SukhumvitText')),
      buttons: [
        DialogButton(
          child: Text(
            "ตกลง",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontFamily: 'SukhumvitText'),
          ),
          onPressed: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          },
          gradient:
              LinearGradient(colors: [Color(0xFFEFA746), Color(0xFFF0C984)]),
        )
      ],
    ).show();
  }
}
