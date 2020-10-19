import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';

class NewsDetailPage extends StatefulWidget {
  @override
  _NewsDetailPageState createState() => _NewsDetailPageState();
}

class _NewsDetailPageState extends State<NewsDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(''),
          flexibleSpace: appBarBackground()),
      backgroundColor: Color(0xFFFFFFFF),
        body: ListView(
          children: [

          ]));
  }
}
