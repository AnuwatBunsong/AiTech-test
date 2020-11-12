import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';

class PaymentSuccessPage extends StatefulWidget {
  @override
  _PaymentSuccessPageState createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: appBarTitle('การชำระเงินเสร็จสมบูรณ์'),
            flexibleSpace: appBarBackground()),
        backgroundColor: Color(0xFFFFFFFF),
        body: ListView(children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(children: [
                Container(
                    child: Icon(Icons.check_circle_outline,
                        size: 120, color: Color(0xFF927AE60))),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(bottom: 44),
                    margin: EdgeInsets.only(top: 5, bottom: 20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 1.0, color: Color(0xFFACB3BF)),
                      ),
                    ),
                    child: Text('การชำระเงินเสร็จสมบูรณ์',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'SukhumvitText',
                            fontSize: 18,
                            fontWeight: FontWeight.w500))),
                Container(
                  child: Text(
                      'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book',
                      style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: 'SukhumvitText',
                          fontSize: 10,
                          fontWeight: FontWeight.w500)),
                )
              ]))
        ]),
        bottomNavigationBar: Container(
            height: 50.0,
            margin: const EdgeInsets.only(bottom: 15.0),
            padding: EdgeInsets.symmetric(horizontal: 25),
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
                        child: Text("กลับหน้าแรก",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontFamily: 'SukhumvitText',
                              fontSize: 20,
                            )))))));
  }
}
