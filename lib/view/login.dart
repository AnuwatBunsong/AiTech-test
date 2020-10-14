import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/splash_screen.jpg"),
                        fit: BoxFit.cover)),
                child: Center(
                    child: Column(children: <Widget>[
                  Container(
                    child: Column(
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                            child: Column(children: [
                              Image.asset('assets/images/logo.png'),
                            ])),
                        Text('สำนักงานการณาปนกิจสงเคราะห์',
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SukhumvitText',
                              fontSize: 24,
                            )),
                        Text('กระทรวงสาธารณสุข',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'SukhumvitText',
                              fontSize: 24,
                            ))
                      ],
                    ),
                  ),
                  Container(
                      width: (MediaQuery.of(context).size.width - 20),
                      padding: const EdgeInsets.only(
                          top: 30.0, bottom: 30.0, left: 15.0, right: 15.0),
                      margin: const EdgeInsets.only(top: 30.0),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                      ),
                      child: Column(children: <Widget>[
                        Text('เข้าสู่ระบบด้วยเลขสมาชิก',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: 'SukhumvitText',
                              fontSize: 15,
                            )),
                      ])),
                ])))));
  }
}
