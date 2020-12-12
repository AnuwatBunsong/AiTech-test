import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';

class InvoiceHistoryPage extends StatefulWidget {
  @override
  _InvoiceHistoryPageState createState() => _InvoiceHistoryPageState();
}

class _InvoiceHistoryPageState extends State<InvoiceHistoryPage> {
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
                        child: Text('Share Document',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Color(0xFFFFFFFF),
                                fontFamily: 'SukhumvitText',
                                fontSize: 14))),
                    Container(
                        padding: EdgeInsets.only(
                            left: 10, right: 5, top: 2, bottom: 2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
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
                        ])),
                  ])),
              preferredSize: Size.fromHeight(30.0)),
        ),
        backgroundColor: Color(0xFFFFFFFF),
        body: ListView(children: [
          Container(
              child: Container(
                  child: Column(
                      children: [Container(child: billingHistoryList())])))
        ]));
  }

  Widget billingHistoryList() {
    return Column(
        children: newsData
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
                                        Text(item['date'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF000000),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 18)),
                                        Text(item['title'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF50555C),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 18)),
                                        Text(item['time'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF50555C),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 14))
                                      ]))),
                          Container(
                              child: Row(children: [
                            Text(item['price'].toString(),
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
