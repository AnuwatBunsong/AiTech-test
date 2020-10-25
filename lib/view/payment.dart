import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: appBarTitle('ยืนยันการชำระเงิน'),
            flexibleSpace: appBarBackground()),
        backgroundColor: Color(0xFFFFFFFF),
        body: ListView(children: [
          Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(children: [
                Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Text('สถานะการเป็นสมาชิกไม่สมบูรณ์',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'SukhumvitText',
                            fontSize: 18,
                            fontWeight: FontWeight.w600))),
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text('กรุณาชำระ xxxx ในปีแรก',
                        style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'SukhumvitText',
                            fontSize: 18,
                            fontWeight: FontWeight.w600))),
                Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 20),
                    decoration: BoxDecoration(color: Color(0xFFEDEDED)),
                    child: Column(children: [
                      Container(
                        child: Icon(
                          Icons.cloud_upload,
                          size: 87,
                          color: Color(0xFF9A9A9A),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: Text('อัพโหลดใบเสร็จเพื่อยืนยันการชำระเงิน',
                              style: TextStyle(
                                  color: Color(0xFF9A9A9A),
                                  fontFamily: 'SukhumvitText',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500))),
                      Container(
                          child: Row(children: [
                        Expanded(
                            child: Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFF2FB4FF),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 13),
                                          child: Icon(Icons.camera_alt,
                                              size: 20,
                                              color: Color(0xFFFFFFFF))),
                                      Text('OPEN CAMERA',
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontFamily: 'SukhumvitText',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600))
                                    ]))),
                        Expanded(
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xFFFFCC17),
                                ),
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 13),
                                          child: Icon(Icons.image,
                                              size: 20,
                                              color: Color(0xFFFFFFFF))),
                                      Text('OPEN GALLERY',
                                          style: TextStyle(
                                              color: Color(0xFFFFFFFF),
                                              fontFamily: 'SukhumvitText',
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600))
                                    ])))
                      ]))
                    ])),
                Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    margin: EdgeInsets.only(bottom: 15),
                    child: Text('ใบเสร็จ :',
                        style: TextStyle(
                            color: Color(0xFF50555C),
                            fontFamily: 'SukhumvitText',
                            fontSize: 18,
                            fontWeight: FontWeight.w500))),
                Container(
                    padding: EdgeInsets.only(left: 16, right: 7),
                    child: Column(children: [
                      Stack(children: [
                        Container(
                            padding: EdgeInsets.only(top: 10, right: 9),
                            margin: EdgeInsets.only(bottom: 10),
                            child: Card(
                                elevation: 2,
                                child: Container(
                                    padding: EdgeInsets.all(13),
                                    child: Container(
                                        child: Row(children: [
                                      Container(
                                          width: 50,
                                          height: 50,
                                          margin: EdgeInsets.only(right: 10),
                                          decoration: new BoxDecoration(
                                            color: Color(0xFFE9D9CE),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(Icons.camera_alt,
                                              size: 20,
                                              color: Color(0xFFFFFFFF))),
                                      Expanded(
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                            Text('Pic.jpg',
                                                style: TextStyle(
                                                    color: Color(0xFF000000),
                                                    fontFamily: 'SukhumvitText',
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text('124 kb',
                                                style: TextStyle(
                                                    color: Color(0xFFDADADA),
                                                    fontFamily: 'SukhumvitText',
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500))
                                          ])),
                                      Container(
                                          child: Icon(Icons.check,
                                              size: 30,
                                              color: Color(0xFF27AE60)))
                                    ]))))),
                        Positioned(
                            top: 0,
                            right: 0,
                            child: Container(
                                color: Color(0xFFFFFFFF),
                                child: Icon(Icons.cancel_outlined,
                                    size: 30, color: Color(0xFFEDEDED))))
                      ])
                    ]))
                /*new Flex(
                  direction: Axis.vertical,
                  children: <Widget>[Image.asset('assets/images/mockup1.png')],
                ),*/
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
                        child: Text("อัพโหลด",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontFamily: 'SukhumvitText',
                              fontSize: 20,
                            )))))));
  }
}
