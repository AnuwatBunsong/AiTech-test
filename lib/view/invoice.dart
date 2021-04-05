import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/presenter/invoice_presenter.dart';
import 'package:cremation/model/invoice_model.dart';
import 'package:cremation/presenter/profile_presenter.dart';
import 'package:cremation/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class InvoicePage extends StatefulWidget {
  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage>
    with AutomaticKeepAliveClientMixin<InvoicePage>
    implements InvoiceContract, ProfileContract {
  InvoicePresenter _presenter;
  ProfilePresenter _profilePresenter;
  List<Invoice> invoiceData;
  List<Invoice> searchInvoice;
  bool _isLoading = true;
  bool _isProfileLoading = true;
  int page = 0;
  int size = 0;
  int paidStatus = 0;
  var profileData;
  var titleInvoice = '';
  var priceTitleInvoice = 0;

  monthThai(int month) {
    switch (month) {
      case 1:
        return 'ม.ค.';
        break;
      case 2:
        return 'ก.พ.';
        break;
      case 3:
        return 'มี.ค.';
        break;
      case 4:
        return 'เม.ย.';
        break;
      case 5:
        return 'พ.ค.';
        break;
      case 6:
        return 'มิ.ย.';
        break;
      case 7:
        return 'ก.ค.';
        break;
      case 8:
        return 'ส.ค.';
        break;
      case 9:
        return 'ก.ย.';
        break;
      case 10:
        return 'ต.ค.';
        break;
      case 11:
        return 'พ.ย.';
        break;
      case 12:
        return 'ธ.ค.';
        break;
      default:
    }
  }

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
    _profilePresenter = ProfilePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    getProfile();
    _getInvoiceList();
    _getMonth();
  }

  _launchURLLine() async {
    const url = 'https://line.me/ti/p/%40chapanakij8813';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: false, forceWebView: false);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _getMonth() {
    DateTime now = new DateTime.now();

    titleInvoice = monthThai(now.month);
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

      bool searchValue = true;

      var searchInvoice =
          items.where((oldValue) => searchValue == (oldValue.showInvoice));

      if (searchInvoice.isNotEmpty) {
        var map1 = Map.fromIterable(searchInvoice,
            key: (e) => 0, value: (e) => e.amount);

        priceTitleInvoice = (map1[0] > 0) ? map1[0] : 0;
      }
    });
  }

  @override
  void onLoadInvoiceError() {}

  void getProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token');
    final String userData = prefs.getString('userData');
    if (userData == null) {
      if (token != null) {
        _profilePresenter.getProfile(token);
      } else {
        Navigator.pushNamed(context, '/login');
      }
    } else {
      profileData = json.decode(userData);
      _isProfileLoading = false;
    }
  }

  @override
  void getProfileSuccess(Profile items) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      'memberId': items.memberId,
      'firstName': items.firstName,
      'lastName': items.lastName,
      'image': items.image
    };
    prefs.setString('userData', json.encode(data));
    setState(() {
      profileData = data;
      _isProfileLoading = false;
    });
  }

  @override
  void getProfileError(error) {}

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                if (_isProfileLoading)
                  Center(
                      child: Padding(
                          padding: EdgeInsets.only(left: 16.0, right: 16.0),
                          child: CircularProgressIndicator()))
                else
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
                                              image: NetworkImage(
                                                  profileData['image']
                                                      .toString())))),
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
                                                fontSize: 22,
                                                height: 1.4)),
                                        Text(
                                            'คุณ ' +
                                                profileData['firstName']
                                                    .toString() +
                                                ' ' +
                                                profileData['lastName']
                                                    .toString(),
                                            style: TextStyle(
                                                color: Color(0xFF000000),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 22,
                                                height: 1)),
                                        Text(
                                            'เลขสมาชิก :  ' +
                                                profileData['memberId']
                                                    .toString(),
                                            style: TextStyle(
                                                color: Color(0xFFACB3BF),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 20,
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
                              fontSize: 20)),
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
                                child: Text(
                                    'เดือน ' +
                                        titleInvoice +
                                        ((priceTitleInvoice > 0)
                                            ? ' คงเหลือ'
                                            : ''),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xFF50555C),
                                        fontFamily: 'SukhumvitText',
                                        fontSize: 22))))
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
                          child: Text(
                              (priceTitleInvoice > 0)
                                  ? priceTitleInvoice.toString() + ' บาท'
                                  : '-',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF000000),
                                  fontFamily: 'SukhumvitText',
                                  fontSize: 38,
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
                                                fontSize: 18,
                                                height: 1))))
                              ]))
                    ]))
              ]),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                //ติดต่อ Call Center
                child: RaisedButton(
                    onPressed: () => _launchURLLine(),
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
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                      margin: EdgeInsets.only(right: 10),
                                      child: Text(
                                          "อัพโหลดรูปภาพสลิปหลักฐานการโอนเงิน",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontFamily: 'SukhumvitText',
                                            fontSize: 16,
                                          )))
                                ]))))),
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
                                        fontSize: 20)),
                              )),
                          if (_isLoading)
                            Center(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 16.0, right: 16.0),
                                    child: CircularProgressIndicator()))
                          else
                            Container(child: cardList())
                        ])))
          ],
          //bottomNavigationBar: navigationBottomBar(context),
        ));
  }

  Widget cardList() {
    return Column(
        children: invoiceData
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
                                        Text(
                                            item.month.toString() +
                                                ' ' +
                                                item.year.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFF000000),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 22)),
                                        Text(
                                            'กรุณาชำระภายในวันที่ ' +
                                                item.pay.toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF50555C),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 16)),
                                      ]))),
                          Container(
                              child: Container(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(item.amount.toString() + ' บาท',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Color(0xFFFF0000),
                                                fontFamily: 'SukhumvitText',
                                                fontSize: 24)),
                                      ])))
                        ])))))
            .toList());
  }

  @override
  bool get wantKeepAlive => true;
}
