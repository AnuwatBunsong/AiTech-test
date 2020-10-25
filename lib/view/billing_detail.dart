import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';

class BillingDetailPage extends StatefulWidget {
  @override
  _BillingDetailPageState createState() => _BillingDetailPageState();
}

class _BillingDetailPageState extends State<BillingDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: appBarTitle('รายละเอียดรายการ'),
            flexibleSpace: appBarBackground()),
        backgroundColor: Color(0xFFE5E5E5),
        body: ListView(children: [
          Container(
              padding: EdgeInsets.only(left: 15, right: 15, top: 20),
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 27),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Column(children: [
                    Container(
                      child: Text('31 พ. ค. 2563, 13:21',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF000000),
                              fontFamily: 'SukhumvitText',
                              fontSize: 18)),
                    ),
                    Container(
                      child: Text('จำนวนเงิน',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF50555C),
                              fontFamily: 'SukhumvitText',
                              fontSize: 18)),
                    ),
                    Container(
                      child: Text('2,000.00',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFEFA746),
                              fontFamily: 'SukhumvitText',
                              fontSize: 35)),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: dotWidget((MediaQuery.of(context).size.width - 50),
                          10, 5, 2, 0xFFACB3BF),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 23, bottom: 5),
                        child: Row(children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text('รายละเอียด : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF50555C),
                                          fontFamily: 'SukhumvitText',
                                          fontSize: 18)))),
                          Expanded(
                              flex: 6,
                              child: Text('ชำระเงินสงเคราะห์',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF000000),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 18)))
                        ])),
                    Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Row(children: [
                          Expanded(
                              flex: 4,
                              child: Container(
                                  alignment: Alignment.topRight,
                                  child: Text('ช่องทาง : ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF50555C),
                                          fontFamily: 'SukhumvitText',
                                          fontSize: 18)))),
                          Expanded(
                              flex: 6,
                              child: Text('บัตรเครดิต',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF000000),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 18)))
                        ])),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: dotWidget((MediaQuery.of(context).size.width - 50),
                          10, 5, 2, 0xFFACB3BF),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 10),
                      child: Text('ใบเสร็จ',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF50555C),
                              fontFamily: 'SukhumvitText',
                              fontSize: 18)),
                    ),
                    Container(
                        child: Image.asset('assets/images/no_image_01.png'))
                  ]))),
        ]));
  }
}
