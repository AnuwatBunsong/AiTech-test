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
        backgroundColor: Color(0xFFFFFFFF),
        body: ListView(children: [Container()]));
  }
}
