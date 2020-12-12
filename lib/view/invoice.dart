import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/presenter/invoice_presenter.dart';
import 'package:cremation/model/invoice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> implements InvoiceContract {
  InvoicePresenter _presenter;
  List<Invoice> invoiceData;
  bool _isLoading = false;
  int page = 1;
  int size = 1;

  List newsData = [
    {
      'title': "มิ.ย. 63",
      'shortDescripton': "กรุณาชำระภายในวันที่ 31 ต.ค. 63",
      'price': '298',
    },
    {
      'title': "มิ.ย. 63",
      'shortDescripton': "กรุณาชำระภายในวันที่ 31 ต.ค. 63",
      'price': '298',
    },
    {
      'title': "มิ.ย. 63",
      'shortDescripton': "กรุณาชำระภายในวันที่ 31 ต.ค. 63",
      'price': '298',
    }
  ];

  _InvoicePageState() {
    _presenter = InvoicePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    _getInvoiceList();
  }

  @override
  void _getInvoiceList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');
    if (token == null) {
      Navigator.pushNamed(context, '/login');
    }
    _presenter.invoiceList(token, page, size);
  }

  @override
  void onLoadInvoiceComplete(List<Invoice> items) {
    setState(() {
      _isLoading = false;
      invoiceData = items;
      print(invoiceData);
    });
  }

  @override
  void onLoadInvoiceError() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: appBarTitle('การเรียกเก็บเงินสงเคราะห์'),
          flexibleSpace: appBarBackground(),
        ),
        backgroundColor: Color(0xFFE5E5E5),
        body: ListView(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 20),
              decoration: BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      const Color(0xFFFFFFFF),
                      const Color(0xFFE5E5E5),
                    ],
                    begin: const FractionalOffset(0.0, 0.5),
                    end: const FractionalOffset(0.0, 1.0),
                    stops: [0.5, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Column(children: [
                Container(
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Column(children: [
                          Container(
                              padding: EdgeInsets.only(
                                  left: 11, right: 11, bottom: 20),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.white),
                              child: Row(children: <Widget>[
                                Container(
                                    margin: EdgeInsets.only(right: 13),
                                    width: 60.0,
                                    height: 60.0,
                                    decoration: new BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: new DecorationImage(
                                            fit: BoxFit.fill,
                                            image: new AssetImage(
                                                "assets/images/mockup2.png")))),
                                Expanded(
                                    child: new Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                      Text('สวัสดี',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              color: Color(0xFFEFA746),
                                              fontFamily: 'SukhumvitText',
                                              fontSize: 18,
                                              height: 1.4)),
                                      Text('คุณ สมชาย',
                                          style: TextStyle(
                                              color: Color(0xFF000000),
                                              fontFamily: 'SukhumvitText',
                                              fontSize: 18,
                                              height: 1)),
                                      Text('เลขสมาชิก : 1124112567357',
                                          style: TextStyle(
                                              color: Color(0xFFACB3BF),
                                              fontFamily: 'SukhumvitText',
                                              fontSize: 12,
                                              height: 1.3))
                                    ])),
                                Container(
                                    child: Icon(
                                  Icons.navigate_next,
                                  color: Color(0xFFC4C4C4),
                                  size: 35.0,
                                  semanticLabel:
                                      'Text to announce in accessibility modes',
                                ))
                              ]))
                        ]))),
                Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text('ยอดเรียกเก็บรายเดือน',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFEFA746),
                              fontFamily: 'SukhumvitText',
                              fontSize: 16)),
                    )),
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 2.0, color: const Color(0xFFEFA746)),
                        borderRadius: new BorderRadius.all(
                          Radius.circular(10.0),
                        )),
                    child: Column(children: [
                      Container(
                          child: Row(children: [
                        Container(
                            margin: EdgeInsets.only(left: 5, right: 10),
                            child: Icon(
                              Icons.wysiwyg,
                              color: Color(0xFFEFA746),
                            )),
                        Container(
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, '/invoice_history');
                                },
                                child: Text('ปี 2563 คงเหลือ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF50555C),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 18))))
                      ])),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: dotWidget(
                            (MediaQuery.of(context).size.width - 60),
                            10,
                            5,
                            2,
                            0xFFACB3BF),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 40),
                          alignment: Alignment.topRight,
                          child: Text('424 บาท',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000000),
                                  fontFamily: 'SukhumvitText',
                                  fontSize: 34,
                                  height: 0.1))),
                      Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(right: 3),
                                    child: Icon(
                                      Icons.update,
                                      size: 16,
                                      color: Color(0xFFACB3BF),
                                    )),
                                Container(
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, '/invoice_history');
                                        },
                                        child: Text('ดูรายการที่ผ่านมา',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xFFACB3BF),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 14,
                                                height: 1))))
                              ]))
                    ]))
              ]),
            ),
            Container(
                child: Container(
                    padding: EdgeInsets.only(
                        top: 20, left: 15, right: 15, bottom: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(bottom: 15),
                              child: Container(
                                child: Text('ยอดค้างชำระ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFEFA746),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 16)),
                              )),
                          Container(child: cardList())
                        ])))
          ],
          //bottomNavigationBar: navigationBottomBar(context),
        ));
  }

  Widget cardList() {
    return Column(
        children: newsData
            .map((item) => Card(
                elevation: 4,
                margin: EdgeInsets.only(bottom: 12),
                child: ClipPath(
                    clipper: ShapeBorderClipper(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4))),
                    child: Container(
                        padding:
                            EdgeInsets.only(top: 17, bottom: 17, right: 20),
                        decoration: BoxDecoration(
                            border: Border(
                                left: BorderSide(
                                    color: Color(0xFFFF0000), width: 10))),
                        child: Row(children: [
                          Container(
                              margin: EdgeInsets.only(left: 13, right: 8),
                              child: Icon(
                                Icons.error_outline,
                                size: 20,
                                color: Color(0xFFACB3BF),
                              )),
                          Expanded(
                              child: Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(item['title'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF000000),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 18)),
                                        Text(item['shortDescripton'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF50555C),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 12)),
                                      ]))),
                          Container(
                              child: Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(item['price'].toString() + ' บาท',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFFFF0000),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 20)),
                                      ])))
                        ])))))
            .toList());
  }
}
