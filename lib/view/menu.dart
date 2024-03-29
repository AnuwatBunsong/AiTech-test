import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:cremation/utils/widget.dart';
import 'package:url_launcher/url_launcher.dart';

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  void initState() {
    super.initState();
  }

  //ยกเลิก ออกจากระบบ
  void _confirmLogout() {
    Alert(
      context: context,
      title: "คุณต้องการออกจากระบบหรือไม่",
      style: AlertStyle(
          isCloseButton: false,
          isOverlayTapDismiss: false,
          titleStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontFamily: 'SukhumvitText')),
      buttons: [
        DialogButton(
          child: Text(
            "ออกจากระบบ",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'SukhumvitText'),
          ),
          onPressed: () => _logout(),
          color: Color(0xFFFF0000),
        ),
        DialogButton(
          child: Text(
            "ยกเลิก",
            style: TextStyle(
                color: Colors.white, fontSize: 15, fontFamily: 'SukhumvitText'),
          ),
          onPressed: () => Navigator.pop(context),
          color: Color.fromRGBO(111, 111, 111, 1.0),
        )
      ],
    ).show();
  }

  void _logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');

    Navigator.pushNamed(context, '/news_guest');
  }

  _launchURL() async {
    const url = 'https://chapanakij.or.th/mophsc/member/form/';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLMember() async {
    const url = 'https://chapanakij.or.th/mophsc/member/manual/';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLLine() async {
    const url = 'https://line.me/ti/p/%40chapanakij8813';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: appBarTitle('อื่นๆ'),
          flexibleSpace: appBarBackground(),
        ),
        backgroundColor: Color(0xFFE5E5E5),
        body: ListView(children: [
          Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Column(children: [
                Container(
                    height: 65,
                    child: RaisedButton(
                        color: Color(0xFFFFFFFF),
                        onPressed: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(Icons.person,
                                      size: 30, color: Color(0xFFEFA746))),
                              Text("ข้อมูลส่วนตัวสมาชิก",
                                  style: TextStyle(
                                    color: Color(0xFF50555C),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 20,
                                  ))
                            ]))),
                Container(
                    height: 65,
                    child: RaisedButton(
                        color: Color(0xFFFFFFFF),
                        onPressed: () {
                          Navigator.pushNamed(context, '/news');
                        },
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(Icons.menu_book,
                                      size: 30, color: Color(0xFFEFA746))),
                              Text("ข่าวสารและกิจกรรม",
                                  style: TextStyle(
                                    color: Color(0xFF50555C),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 20,
                                  ))
                            ]))),
                Container(
                    height: 65,
                    child: RaisedButton(
                        color: Color(0xFFFFFFFF),
                        onPressed: () => _launchURL(),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(Icons.live_help,
                                      size: 30, color: Color(0xFFEFA746))),
                              Text("เอกสารต่างๆ",
                                  style: TextStyle(
                                    color: Color(0xFF50555C),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 20,
                                  ))
                            ]))),
                Container(
                    height: 65,
                    child: RaisedButton(
                        color: Color(0xFFFFFFFF),
                        onPressed: () => _launchURLMember(),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(Icons.text_snippet,
                                      size: 30, color: Color(0xFFEFA746))),
                              Text("คู่มือสำหรับสมาชิก",
                                  style: TextStyle(
                                    color: Color(0xFF50555C),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 20,
                                  ))
                            ]))),
                Container(
                    height: 65,
                    child: RaisedButton(
                        color: Color(0xFFFFFFFF),
                        onPressed: () => _launchURLLine(),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(Icons.mode_comment,
                                      size: 30, color: Color(0xFFEFA746))),
                              Text("แสดงความคิดเห็น",
                                  style: TextStyle(
                                    color: Color(0xFF50555C),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 20,
                                  ))
                            ]))),
                Container(
                    height: 65,
                    child: RaisedButton(
                        color: Color(0xFFFFFFFF),
                        onPressed: _confirmLogout,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  padding: EdgeInsets.only(right: 20),
                                  child: Icon(Icons.input,
                                      size: 30, color: Color(0xFFEFA746))),
                              Text("ออกจากระบบ",
                                  style: TextStyle(
                                    color: Color(0xFF50555C),
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 20,
                                  ))
                            ]))),
              ])),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              //ติดต่อ Call Center
              child: RaisedButton(
                  onPressed: () => launch("tel:025899105"),
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
                                Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(Icons.phone,
                                        color: Color(0xFFFFFFFF))),
                                Text("ติดต่อ Call Center",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFFFFFFFF),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 24,
                                    ))
                              ])))))
        ]));
  }
}
