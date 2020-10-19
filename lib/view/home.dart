import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List newsData = [
    {
      'image': 'assets/images/mockup1.png',
      'title': "ข่าวสารประจำวันที่ 24 มิ.ย.63",
      'date': "24 มิ.ย. 63, 13:00",
      'shortDescripton':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      'image': 'assets/images/mockup1.png',
      'title': "ข่าวสารประจำวันที่ 23 มิ.ย.63",
      'date': "23 มิ.ย. 63, 13:00",
      'shortDescripton':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      'image': 'assets/images/mockup1.png',
      'title': "ข่าวสารประจำวันที่ 22 มิ.ย.63",
      'date': "22 มิ.ย. 63, 13:00",
      'shortDescripton':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      'image': 'assets/images/mockup1.png',
      'title': "ข่าวสารประจำวันที่ 21 มิ.ย.63",
      'date': "21 มิ.ย. 63, 13:00",
      'shortDescripton':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      'image': 'assets/images/mockup1.png',
      'title': "ข่าวสารประจำวันที่ 20 มิ.ย.63",
      'date': "20 มิ.ย. 63, 13:00",
      'shortDescripton':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      'image': 'assets/images/mockup1.png',
      'title': "ข่าวสารประจำวันที่ 19 มิ.ย.63",
      'date': "19 มิ.ย. 63, 13:00",
      'shortDescripton':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    },
    {
      'image': 'assets/images/mockup1.png',
      'title': "ข่าวสารประจำวันที่ 18 มิ.ย.63",
      'date': "18 มิ.ย. 63, 00:00",
      'shortDescripton':
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: appBarTitle('หน้าแรก'),
          flexibleSpace: appBarBackground()),
      backgroundColor: Color(0xFFFFFFFF),
      body: ListView(children: [
        Container(
            padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
            decoration: BoxDecoration(
              color: Color(0xFFFE5E5E5),
            ),
            child: Container(
                padding:
                    EdgeInsets.only(top: 28, left: 11, right: 11, bottom: 28),
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
                        Text('สวัสดี',
                            style: TextStyle(
                                fontWeight: FontWeight.w800,
                                color: Color(0xFFEFA746),
                                fontFamily: 'SukhumvitText',
                                fontSize: 18,
                                height: 1.4)),
                        Text('คุณ สมชาย',
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontFamily: 'SukhumvitText',
                                fontSize: 18,
                                height: 1)),
                        Text('เลขสมาชิก : 1124112567357',
                            style: TextStyle(
                                color: Color(0xFFACB3BF),
                                fontFamily: 'SukhumvitText',
                                fontSize: 12,
                                height: 1.3))
                      ])),
                  Container(
                      child: Icon(
                    Icons.navigate_next,
                    color: Color(0xFFC4C4C4),
                    size: 35.0,
                    semanticLabel: 'Text to announce in accessibility modes',
                  ))
                ]))),
        Container(
            child: Container(
                padding:
                    EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
                child: Column(children: [
                  Container(
                      margin: EdgeInsets.only(bottom: 15),
                      child: Row(children: <Widget>[
                        Expanded(
                            child: Text('ข่าวสารและกิจกรรม',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFEFA746),
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 16))),
                        Container(
                            child: Text('ดูข่าวสารทั้งหมด >',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFACB3BF),
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 12)))
                      ])),
                  Container(child: _NewsList())
                ])))
      ]),
      bottomNavigationBar: navigationBottomBar(context),
    );
  }

  Widget _NewsList() {
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
                child: Row(children: [
                  Expanded(
                      flex: 6,
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                          child: Image.asset(
                            item['image'],
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
                                Text(item['title'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF000000),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 16)),
                                Text(item['date'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFFEFA746),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 10)),
                                Text(item['shortDescripton'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF626262),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 12))
                              ])))
                ])))
            .toList());
  }
}
