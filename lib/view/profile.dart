import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: appBarTitle('ข้อมูลส่วนตัวสมาชิก'),
          flexibleSpace: appBarBackground(),
        ),
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
                        margin: EdgeInsets.only(right: 13, bottom: 20),
                        width: 80.0,
                        height: 80.0,
                        decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                                fit: BoxFit.fill,
                                image: new AssetImage(
                                    "assets/images/mockup2.png")))),
                    profileDetail('เลขทะเบียน :', '000000'),
                    profileDetail('ชื่อ-สกุล :', 'AAAAA AAAAAAA'),
                    profileDetail('เลขบัตรประชาชน :', '0000000000000'),
                    profileDetail('วันเกิด :', 'วว/ดด/ปป'),
                    profileDetail('ที่อยู่สำหรับติดต่อ :',
                        '000 AAA AAA AAA AAAAAAAAAAAAAAAAA AAAAAAA00000'),
                    profileDetail('เบอร์โทรศัพท์ :', '000-0000000'),
                    profileDetail('สถานะสมาชิก :', 'เป็นสมาชิก'),
                    profileDetail('เป็นสมาชิกตั้งแต่ :', 'วว/ดด/ปป'),
                    profileDetail('วิธีชำระเงิน :', 'หน่วยงานต้นสังกัด'),
                    profileDetail(
                        'สถานที่เรียกเก็บเงิน :', 'รพร.สระบุรี (พิเศษ)'),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: dotWidget((MediaQuery.of(context).size.width - 50),
                          10, 5, 2, 0xFFACB3BF),
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 25),
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xFFEDEDED),
                              width: 1,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.5),
                                offset: Offset(0.0, 2.0),
                                blurRadius: 2.0,
                              )
                            ],
                            color: Colors.white),
                        child: Column(children: [
                          Container(
                              child: Text(
                                  'เปลี่ยนผู้มีสิทธิ์รับเงินครั้งแรกล่าสุด',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF50555C),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 16,
                                      height: 1.3))),
                          Container(
                              child: Text('อัพเดต ณ วันที่',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF50555C),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 16,
                                      height: 1.3))),
                          Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text('วว/ดด/ปป',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFFEFA746),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 16)))
                        ]))
                  ]))),
        ]));
  }

  Widget profileDetail(String title, String value) {
    return Container(
        margin: EdgeInsets.only(bottom: 12),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
              flex: 4,
              child: Container(
                  alignment: Alignment.topRight,
                  child: Text(title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF50555C),
                          fontFamily: 'SukhumvitText',
                          fontSize: 14)))),
          Expanded(
              flex: 6,
              child: Container(
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.topLeft,
                  child: Text(value,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFFEFA746),
                          fontFamily: 'SukhumvitText',
                          fontSize: 14))))
        ]));
  }
}
