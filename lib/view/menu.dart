import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
          margin: EdgeInsets.only(bottom: 30),
          child: Column(children: [
            Container(
                height: 65,
                child: RaisedButton(
                    color: Color(0xFFFFFFFF),
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: new Image.asset('assets/icons/member.png'),
                          ),
                          Text("ข้อมูลส่วนตัวสมาชิก",
                              style: TextStyle(
                                color: Color(0xFF50555C),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SukhumvitText',
                                fontSize: 16,
                              ))
                        ]))),
            Container(
                height: 65,
                child: RaisedButton(
                    color: Color(0xFFFFFFFF),
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: new Image.asset('assets/icons/news.png'),
                          ),
                          Text("ข่าวสารและกิจกรรม",
                              style: TextStyle(
                                color: Color(0xFF50555C),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SukhumvitText',
                                fontSize: 16,
                              ))
                        ]))),
            Container(
                height: 65,
                child: RaisedButton(
                    color: Color(0xFFFFFFFF),
                    onPressed: () {},
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                            icon: new Image.asset('assets/icons/setting.png'),
                          ),
                          Text("ตั้งค่า",
                              style: TextStyle(
                                color: Color(0xFF50555C),
                                fontWeight: FontWeight.w600,
                                fontFamily: 'SukhumvitText',
                                fontSize: 16,
                              ))
                        ]))),
          ])),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          //ติดต่อ Call Center
          child: RaisedButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              padding: EdgeInsets.all(0.0),
              child: Ink(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFEFA746), Color(0xFFF0C984)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                      ),
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Container(
                      constraints: BoxConstraints(minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: new Icon(Icons.phone,
                                  color: Color(0xFFFFFFFF)),
                            ),
                            Text("ติดต่อ Call Center",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFFFFFFF),
                                  fontFamily: 'SukhumvitText',
                                  fontSize: 20,
                                ))
                          ])))))
    ]);
  }
}
