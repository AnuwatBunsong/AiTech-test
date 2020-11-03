import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetailPage extends StatefulWidget {
  final dynamic item;

  // In the constructor, require a RecordObject.
  NewsDetailPage({Key key, @required this.item}) : super(key: key);

  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
  String _date;
  String _thumbnail;
  String _content;

  @override
  void initState() {
    super.initState();

    _date = widget.item.date;
    _thumbnail = widget.item.thumbnail;
    _content = widget.item.content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(''), flexibleSpace: appBarBackground()),
        backgroundColor: Color(0xFFFFFFFF),
        body: ListView(children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(children: [
                Container(
                    alignment: Alignment.topLeft,
                    child: Text('ข่าวสารประจำวันที่ $_date',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'SukhumvitText',
                            fontSize: 16,
                            fontWeight: FontWeight.w700))),
                Container(
                    margin: EdgeInsets.only(bottom: 13),
                    alignment: Alignment.topLeft,
                    child: Text('24 มิ.ย. 63, 13:00',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'SukhumvitText',
                            fontSize: 12,
                            fontWeight: FontWeight.w500))),
                /*new Flex(
                  direction: Axis.vertical,
                  children: <Widget>[Image.asset('assets/images/mockup1.png')],
                ),*/
                Container(
                    child: FittedBox(
                  child: Image.network(_thumbnail,
                      width: (MediaQuery.of(context).size.width),
                      fit: BoxFit.fill),
                  fit: BoxFit.fitWidth,
                )),
                Html(
                    data: """
                  """ +
                        _content +
                        """
                """),
              ]))
        ]));
  }
}
