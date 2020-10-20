import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:flutter_html/flutter_html.dart';

class NewsDetailPage extends StatefulWidget {
  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {
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
                    child: Text('ข่าวสารประจำวันที่ 24 มิ.ย.63',
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
                  child: Image.asset('assets/images/mockup1.png'),
                  fit: BoxFit.fitWidth,
                )),
                Html(data: """
                  <div>
                    <h1>Test Html Editor</h1>
                    <p>This Tag P !</p>
                    <h3>Features</h3>
                    <ul>
                      <li>It actually works</li>
                      <li>It exists</li>
                      <li>It doesn't cost much!</li>
                    </ul>
                    <!--You can pretty much put any html in here!-->
                  </div>
                """),
              ]))
        ]));
  }
}
