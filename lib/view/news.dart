import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/presenter/news_presenter.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
            centerTitle: true,
            title: appBarTitle('ข่าวสารทั้งหมด'),
            flexibleSpace: appBarBackground()),
        backgroundColor: Color(0xFFFFFFFF),
        body: ListView(children: [
          Container(
              child: Container(
                  padding:
                      EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 10),
                  child: Column(children: [Container(child: newsList())])))
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
                      Navigator.pushNamed(context, '/news_detail');
                    },
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
                    ]))))
            .toList());
  }
}
