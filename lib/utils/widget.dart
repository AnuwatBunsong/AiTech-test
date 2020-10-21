import 'package:flutter/material.dart';

Widget appBarBackground() {
  return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: <Color>[Color(0xFFEFA746), Color(0xFFF0C984)])));
}

Widget appBarTitle(String value) {
  return Text(value,
      style: TextStyle(
        color: Color(0xFFFFFFFF),
        fontFamily: 'SukhumvitText',
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ));
}

Widget dotWidget(double totalWidth, double dashWidth, double emptyWidth,
    double dashHeight, color) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(
      totalWidth ~/ (dashWidth + emptyWidth),
      (_) => Container(
        width: dashWidth,
        height: dashHeight,
        color: Color(color),
        margin: EdgeInsets.only(left: emptyWidth / 2, right: emptyWidth / 2),
      ),
    ),
  );
}
