import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
  }

  bool _isShowDelete = false;
  List notificationData = [
    {
      'id': '1',
      'title': "คุณมียอดค้างชำระเดือน มิ.ย. 63",
      'date': "30 มิ.ย. 63, 13:00",
      'new': true
    },
    {
      'id': '2',
      'title': "กิจกรรมของสำนักงานการณาปนกิจสงเค...",
      'date': "30 มิ.ย. 63, 12:00",
      'new': true
    },
    {
      'id': '3',
      'title': "ข่าวสารประจำวันที่ 24 มิ.ย.63",
      'date': "24 มิ.ย. 63, 13:00",
      'new': false
    },
    {
      'id': '4',
      'title': "ผลการสอบคัดเลือกเพื่อจ้างเป็นพนักงาน...",
      'date': "22 มิ.ย. 63, 13:00",
      'new': false
    },
    {
      'id': '5',
      'title': "เรื่องน่ารู้จาก ฌกส. (12)",
      'date': "21 มิ.ย. 63, 13:00",
      'new': false
    },
    {
      'id': '6',
      'title': "คุณมียอดค้างชำระเดือน พ.ค. 63",
      'date': "30 พ.ค. 63, 13:00",
      'new': false
    },
    {
      'id': '7',
      'title': "ข่าวสารประจำวันที่ 24 พ.ค.63",
      'date': "24 มิ.ย. 63, 13:00",
      'new': false
    }
  ];

  void _onShowDelete() {
    setState(() {
      _isShowDelete = true;
    });
  }

  void _isDelete() {
    setState(() {
      _isShowDelete = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: appBarTitle('การแจ้งเตือน'),
          flexibleSpace: appBarBackground(),
          actions: <Widget>[
            if (!_isShowDelete)
              IconButton(
                  icon: new Icon(
                    Icons.delete_outline,
                  ),
                  tooltip: 'Delete',
                  onPressed: () {
                    _onShowDelete();
                  })
            else
              Container(
                  padding: EdgeInsets.only(right: 15, top: 15),
                  child: GestureDetector(
                      onTap: () {
                        _isDelete();
                      },
                      child: Text('Delete',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFFFFF),
                              fontFamily: 'SukhumvitText',
                              fontSize: 16))))
          ],
        ),
        backgroundColor: Color(0xFFFFFFFF),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              if (_isShowDelete)
                Container(
                    child: Card(
                        elevation: 0,
                        shape: Border(
                            bottom: BorderSide(color: Color(0xFFACB3BF))),
                        child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Row(children: [
                              Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.check_circle_sharp,
                                      color: Color(0xFF27AE60))),
                              Text('เลือกทั้งหมด',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF000000),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 16))
                            ])))),
              Expanded(
                  child: ListView(children: [
                Container(
                    child: Column(
                        children: [Container(child: notificationList())]))
              ]))
            ])));
  }

  Widget notificationList() {
    return Column(
        children: notificationData
            .map((item) => Card(
                elevation: 0,
                shape: Border(bottom: BorderSide(color: Color(0xFFACB3BF))),
                child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 20),
                    child: Row(children: [
                      if (_isShowDelete)
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            child: Icon(Icons.radio_button_unchecked,
                                color: Color(0xFFACB3BF))),
                      Container(
                          margin: EdgeInsets.only(right: 18, left: 2),
                          width: 50.0,
                          height: 50.0,
                          decoration: new BoxDecoration(
                            color: Color(0xFFEFA746),
                            shape: BoxShape.circle,
                          ),
                          child: new Stack(children: <Widget>[
                            new Positioned(
                                left: 13,
                                top: 13,
                                child: Icon(Icons.mail_outline,
                                    color: Color(0xFFFFFFFF))),
                            if (item['new'])
                              new Positioned(
                                right: 0.0,
                                top: 0,
                                child: Container(
                                    width: 16.0,
                                    height: 16.0,
                                    decoration: new BoxDecoration(
                                      color: Color(0xFFFF0000),
                                      shape: BoxShape.circle,
                                    )),
                              ),
                          ])),
                      Expanded(
                          child: Container(
                              padding: EdgeInsets.only(left: 5),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(item['title'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Color(0xFF000000),
                                            fontFamily: 'SukhumvitText',
                                            fontSize: 16)),
                                    Text(item['date'].toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF50555C),
                                            fontFamily: 'SukhumvitText',
                                            fontSize: 12))
                                  ])))
                    ]))))
            .toList());
  }
}
