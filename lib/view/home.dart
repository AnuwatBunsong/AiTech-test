import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/presenter/home_presenter.dart';
import 'package:cremation/model/news_model.dart';
import 'package:cremation/view/news_detail.dart';
import 'package:cremation/presenter/profile_presenter.dart';
import 'package:cremation/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage>
    implements HomeListViewContract, ProfileContract {
  HomePresenter _presenter;
  ProfilePresenter _profilePresenter;
  bool _isLoading = true;
  bool _isProfileLoading = true;
  List<News> newsData;
  var profileData;

  _HomePageState() {
    _presenter = HomePresenter(this);
    _profilePresenter = ProfilePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    getProfile();
    _presenter.newsList();
  }

  @override
  void onLoadNewsComplete(List<News> items) {
    setState(() {
      newsData = items;
      _isLoading = false;
    });
  }

  @override
  void onLoadNewsError() {
    setState(() {
      newsData = [];
      _isLoading = false;
    });
    //ไม่พบข้อมูลกรุณาลองใหม่อีกครั้ง
  }

  void getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');
    final String userData = prefs.getString('userData');
    if (userData == null) {
      if (token != null) {
        _profilePresenter.getProfile(token);
      } else {
        Navigator.pushNamed(context, '/login');
      }
    } else {
      profileData = json.decode(userData);
      _isProfileLoading = false;
    }
  }

  @override
  void getProfileSuccess(Profile items) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      'memberId': items.memberId,
      'firstName': items.firstName,
      'lastName': items.lastName,
      'image': items.image
    };
    prefs.setString('userData', json.encode(data));
    setState(() {
      profileData = data;
      _isProfileLoading = false;
    });
  }

  @override
  void getProfileError(error) {}

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
          if (_isProfileLoading)
            Center(
                child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: CircularProgressIndicator()))
          else
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
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
                                      image: NetworkImage(
                                          profileData['image'].toString())))),
                          Expanded(
                              child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                textWidget('สวัสดี', 22.0, 0xFFEFA746, 1.4,
                                    FontWeight.w800),
                                textWidget(
                                    'คุณ ' +
                                        profileData['firstName'].toString() +
                                        ' ' +
                                        profileData['lastName'].toString(),
                                    22.0,
                                    0xFF000000,
                                    1.0,
                                    FontWeight.w400),
                                textWidget(
                                    'เลขสมาชิก : ' +
                                        profileData['memberId'].toString(),
                                    20.0,
                                    0xFFACB3BF,
                                    1.3,
                                    FontWeight.w400),
                              ])),
                          Container(
                              child: Icon(
                            Icons.navigate_next,
                            color: Color(0xFFC4C4C4),
                            size: 39.0,
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
                              child: textWidget('ข่าวสารและกิจกรรม', 20.0,
                                  0xFFEFA746, 0, FontWeight.w700)),
                          Container(
                              child: GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/news');
                                  },
                                  child: textWidget('ดูข่าวสารทั้งหมด >', 16.0,
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
                                        textWidget(item.title.toString(), 18.0,
                                            0xFF000000, 0, FontWeight.w700),
                                        textWidget(item.date.toString(), 16.0,
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
