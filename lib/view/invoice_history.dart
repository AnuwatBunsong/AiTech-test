import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/presenter/invoice_presenter.dart';
import 'package:cremation/model/invoice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:cremation/presenter/local_notification_presenter.dart';

class InvoiceHistoryPage extends StatefulWidget {
  @override
  _InvoiceHistoryPageState createState() => _InvoiceHistoryPageState();
}

class _InvoiceHistoryPageState extends State<InvoiceHistoryPage>
    implements InvoiceContract {
  InvoicePresenter _presenter;
  List<Invoice> invoiceData;
  bool _isLoading = true;
  int page = 0;
  int size = 0;
  int paidStatus = 2;
  int selectYear = 0;
  List<int> yearList;

  final LocalNotifications _localNotification = LocalNotifications();

  List newsData = [
    {
      'title': "ชำระเงินสงเคราะห์",
      'date': "31 พ. ค. 2563",
      'time': '13:21',
      'price': '2,000.00',
    },
    {
      'title': "ชำระเงินสงเคราะห์",
      'date': "30 เม. ย. 2563",
      'time': '12:44',
      'price': '2,000.00',
    },
    {
      'title': "ชำระเงินสงเคราะห์",
      'date': "30 มี. ค. 2563",
      'time': '09:44',
      'price': '2,000.00',
    },
    {
      'title': "ชำระเงินสงเคราะห์",
      'date': "28 ก. พ. 2563",
      'time': '12:44',
      'price': '2,000.00',
    },
    {
      'title': "ชำระเงินสงเคราะห์",
      'date': "30 ม. ค. 2563",
      'time': '12:12',
      'price': '2,000.00',
    },
    {
      'title': "ชำระเงินสงเคราะห์",
      'date': "30 ธ. ค. 2562",
      'time': '11:12',
      'price': '2,000.00',
    },
  ];

  _InvoiceHistoryPageState() {
    _presenter = InvoicePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    DateTime now = new DateTime.now();
    yearList = List<int>.generate(7, (i) => now.year - i);
    _getInvoiceList();
  }

  void _getInvoiceList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');
    if (token == null) {
      Navigator.pushNamed(context, '/login');
    }
    _presenter.invoiceList(paidStatus, token, page, size);
  }

  @override
  void onLoadInvoiceComplete(List<Invoice> items) {
    setState(() {
      _isLoading = false;
      invoiceData = items;
    });
  }

  @override
  void onLoadInvoiceError() {}

  void filter() {
    Future<void> future = showModalBottomSheet<int>(
      context: context,
      builder: (BuildContext context) {
        return _buildYearPicker();
      },
    );

    future.then((void value) => _closeFilter(value));
  }

  void _closeFilter(void value) {
    setState(() {
      _isLoading = true;
      _getInvoiceList();
    });
  }

  _buildYearPicker() {
    return Container(
        height: 250,
        child: CupertinoPicker(
          itemExtent: 60.0,
          backgroundColor: CupertinoColors.white,
          scrollController: FixedExtentScrollController(initialItem: 0),
          onSelectedItemChanged: (index) {
            setState(() {
              selectYear = index;
            });
          },
          children: new List<Widget>.generate(yearList.length, (index) {
            return new Center(
              child: Text(
                yearList[index].toString(),
                style: TextStyle(fontSize: 22.0),
              ),
            );
          }),
        ));
  }

  void testNotification() {
    _localNotification.initNotifications();
    _localNotification.pushNotification('ข่าวสารสมาชิก ณกส.สาธารณะสุข',
        'ข่าวสารและข้อมูล ประจำวันที่ 20 ธันวาคม');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: appBarTitle('ดูรายการที่ผ่านมา'),
          flexibleSpace: appBarBackground(),
          bottom: PreferredSize(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                  child: Row(children: [
                    Container(
                        child: Icon(Icons.description,
                            size: 20, color: Color(0xFFFFFFFF))),
                    Expanded(
                        child: GestureDetector(
                            onTap: () {
                              testNotification();
                            },
                            child: Text('Share Document',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFFFFFFF),
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 14)))),
                    Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 5, top: 2, bottom: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                            onTap: () {
                              filter();
                            },
                            child: Row(children: [
                              Container(
                                  child: Icon(Icons.sort,
                                      size: 20, color: Color(0xFFEFA746))),
                              Text('Filter',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFEFA746),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 14)),
                            ]))),
                  ])),
              preferredSize: Size.fromHeight(30.0)),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        body: ListView(children: [
          if (_isLoading)
            Center(
                child: Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    child: CircularProgressIndicator()))
          else
            Container(
                child: Container(
                    child: Column(
                        children: [Container(child: invoiceHistoryList())])))
        ]));
  }

  Widget invoiceHistoryList() {
    return Column(
        children: invoiceData
            .map((item) => Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Color(0xFFEFA746)),
                  ),
                ),
                padding:
                    EdgeInsets.only(top: 20, bottom: 15, left: 20, right: 15),
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/invoice_detail');
                    },
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                            item.month.toString() +
                                                ' ' +
                                                item.year.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF000000),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 18)),
                                        Text('ชำระเงินสงเคราะห์',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF50555C),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 18)),
                                        /*Text(item['time'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF50555C),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 14))*/
                                      ]))),
                          Container(
                              child: Row(children: [
                            Text(item.amount.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFEFA746),
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 18)),
                            Container(
                                child: Icon(Icons.keyboard_arrow_right,
                                    size: 30, color: Color(0xFFC4C4C4))),
                          ]))
                        ]))))
            .toList());
  }
}
