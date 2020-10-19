import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/home'));
  }

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
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
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
                ))));
  }
}
