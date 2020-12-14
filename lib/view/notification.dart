import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/presenter/notification_presenter.dart';
import 'package:cremation/model/notification_model.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    implements NotificationContract {
  NotificationPresenter _presenter;

  _NotificationPageState() {
    _presenter = NotificationPresenter(this);
  }

  bool _isLoading = false;
  bool _isShowDelete = false;
  bool _isSelectAll = false;
  List<int> selectedItems = List();
  List<NotificationModel> notificationData;

  /*List notificationData = [
    {
      'id': 1,
      'title': "คุณมียอดค้างชำระเดือน มิ.ย. 63",
      'date': "30 มิ.ย. 63, 13:00",
      'new': true
    },
    {
      'id': 2,
      'title': "กิจกรรมของสำนักงานการณาปนกิจสงเค...",
      'date': "30 มิ.ย. 63, 12:00",
      'new': true
    },
    {
      'id': 3,
      'title': "ข่าวสารประจำวันที่ 24 มิ.ย.63",
      'date': "24 มิ.ย. 63, 13:00",
      'new': false
    },
    {
      'id': 4,
      'title': "ผลการสอบคัดเลือกเพื่อจ้างเป็นพนักงาน...",
      'date': "22 มิ.ย. 63, 13:00",
      'new': false
    },
    {
      'id': 5,
      'title': "เรื่องน่ารู้จาก ฌกส. (12)",
      'date': "21 มิ.ย. 63, 13:00",
      'new': false
    },
    {
      'id': 6,
      'title': "คุณมียอดค้างชำระเดือน พ.ค. 63",
      'date': "30 พ.ค. 63, 13:00",
      'new': false
    },
    {
      'id': 7,
      'title': "ข่าวสารประจำวันที่ 24 พ.ค.63",
      'date': "24 มิ.ย. 63, 13:00",
      'new': false
    }
  ];*/

  @override
  void initState() {
    super.initState();
    _presenter.notificationList();
  }

  void _selectAll() {
    setState(() {
      if (_isSelectAll) {
        _isSelectAll = false;
        selectedItems.clear();
      } else {
        _isSelectAll = true;
        notificationData.forEach((item) => selectedItems.add(item.id));
      }
    });
  }

  void _selectByItem(int id) {
    var item = selectedItems.contains(id);
    setState(() {
      if (item) {
        selectedItems.remove(id);
      } else {
        selectedItems.add(id);
      }
    });
  }

  void _onShowDelete() {
    setState(() {
      _isShowDelete = true;
    });
  }

  void _isDelete() {
    setState(() {
      for (int index in selectedItems) {
        notificationData.removeWhere((item) => item.id == index);
      }
      selectedItems.clear();
      _isShowDelete = false;
      _isSelectAll = false;
    });
  }

  @override
  void onLoadNotificationComplete(List<NotificationModel> items) {
    setState(() {
      _isLoading = false;
      notificationData = items;
    });
  }

  @override
  void onLoadNotificationError() {}

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
                        child: GestureDetector(
                            onTap: () {
                              _selectAll();
                            },
                            child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 12),
                                child: Row(children: [
                                  Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Icon(
                                          _isSelectAll
                                              ? Icons.check_circle_sharp
                                              : Icons.radio_button_unchecked,
                                          color: Color(_isSelectAll
                                              ? 0xFF27AE60
                                              : 0xFFACB3BF))),
                                  Text('เลือกทั้งหมด',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF000000),
                                          fontFamily: 'SukhumvitText',
                                          fontSize: 16))
                                ]))))),
              if (_isLoading)
                      Center(
                          child: Padding(
                              padding: EdgeInsets.only(left: 16.0, right: 16.0),
                              child: CircularProgressIndicator()))
                    else
              Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: notificationData == null ? 0 : notificationData.length,
                      itemBuilder: (context, index) {
                        return notificationList(notificationData[index]);
                      }))
            ])));
  }

  Widget notificationList(item) {
    bool check = selectedItems.contains(item.id);
    return Column(children: [
      Card(
          elevation: 0,
          shape: Border(bottom: BorderSide(color: Color(0xFFACB3BF))),
          child: Padding(
              padding: EdgeInsets.only(top: 15, bottom: 20),
              child: Row(children: [
                if (_isShowDelete)
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      child: GestureDetector(
                          onTap: () {
                            _selectByItem(item.id);
                          },
                          child: Icon(
                              check
                                  ? Icons.check_circle_sharp
                                  : Icons.radio_button_unchecked,
                              color: Color(check ? 0xFF27AE60 : 0xFFACB3BF)))),
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
                      if (item.newItem)
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
                              Text(item.title.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF000000),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 16)),
                              Text(item.createDate.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF50555C),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 12))
                            ])))
              ])))
    ]);
  }
}
