import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/splash_screen.jpg"),
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter)),
            child: Align(
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
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  ),
                  alignment: Alignment.topLeft,
                  child: Column(children: <Widget>[
                    Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 15.0, bottom: 10.0),
                        child: Text('เข้าสู่ระบบด้วยเลขสมาชิก',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: 'SukhumvitText',
                              fontSize: 15,
                            ))),
                    Container(
                        width: (MediaQuery.of(context).size.width),
                        height: (45.0),
                        margin: const EdgeInsets.only(bottom: 15.0),
                        child: new TextField(
                            decoration: new InputDecoration(
                              prefixIcon:
                                  new Image.asset('assets/icons/user.png'),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(
                                    color: Color(0xFF1EFA746), width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(
                                    color: Color(0xFF1EFA746), width: 1.0),
                              ),
                            ),
                            enabled: true,
                            style: TextStyle(
                                fontSize: 15.0,
                                height: 1,
                                color: Color(0xFF000000)))),
                    Container(
                        alignment: Alignment.topLeft,
                        margin: const EdgeInsets.only(left: 15.0, bottom: 10.0),
                        child: Text('รหัสผ่าน',
                            style: TextStyle(
                              color: Color(0xFF000000),
                              fontFamily: 'SukhumvitText',
                              fontSize: 15,
                            ))),
                    Container(
                        width: (MediaQuery.of(context).size.width),
                        height: (45.0),
                        margin: const EdgeInsets.only(bottom: 15.0),
                        child: new TextField(
                            decoration: new InputDecoration(
                              prefixIcon:
                                  new Image.asset('assets/icons/key.png'),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(
                                    color: Color(0xFF1EFA746), width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                  const Radius.circular(30.0),
                                ),
                                borderSide: BorderSide(
                                    color: Color(0xFF1EFA746), width: 1.0),
                              ),
                            ),
                            enabled: true,
                            style: TextStyle(
                                fontSize: 15.0,
                                height: 1,
                                color: Color(0xFF000000)))),
                  ])),
            ]))));
  }
}
