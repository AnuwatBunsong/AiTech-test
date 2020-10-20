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

Widget navigationBottomBar(BuildContext context) {
  final currentPage = ModalRoute.of(context).settings.name;
  final inActivePage = 0xFFACB3BF;
  final activePage = 0xFFEFA746;

  void _onTap(int index) {
    switch (index) {
      case 0:
        {
          Navigator.pushNamed(context, '/home');
        }
        break;
      case 1:
        {
          Navigator.pushNamed(context, '/billing');
        }
        break;
      case 2:
        {
          Navigator.pushNamed(context, '/notification');
        }
        break;
      case 3:
        {
          Navigator.pushNamed(context, '/menu');
        }
        break;

      default:
        {
          Navigator.pushNamed(context, '/home');
        }
        break;
    }
  }

  List menu = [
    {'icon': Icons.home_outlined, 'title': "หน้าแรก", 'route': "/home"},
    {'icon': Icons.wysiwyg, 'title': "เงินสงเคราะห์สะสม", 'route': "/billing"},
    {
      'icon': Icons.notifications,
      'title': "การแจ้งเตือน",
      'route': "/notification"
    },
    {'icon': Icons.menu, 'title': "อื่นๆ", 'route': "/menu"}
  ];

  return Container(
      padding: EdgeInsets.only(left: 12, right: 12),
      child: BottomAppBar(
          color: Color.fromRGBO(66, 165, 245, 0),
          elevation: 0,
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: Offset(0.0, 1.0),
                    blurRadius: 2.0,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 6.0),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: Container(
                  padding: EdgeInsets.only(top: 5, left: 2.5, right: 2.5),
                  child: BottomNavigationBar(
                      onTap: _onTap,
                      backgroundColor: Colors.white,
                      type: BottomNavigationBarType.fixed,
                      elevation: 0,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                            icon: Icon(Icons.home_outlined,
                                size: 31.0,
                                color: currentPage == '/home'
                                    ? Color(activePage)
                                    : Color(inActivePage)),
                            title: new Text("หน้าแรก",
                                style: TextStyle(
                                    color: currentPage == '/home'
                                        ? Color(activePage)
                                        : Color(inActivePage),
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 12.0))),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.wysiwyg,
                                size: 31.0,
                                color: currentPage == '/billing'
                                    ? Color(activePage)
                                    : Color(inActivePage)),
                            title: new Text("เงินสงเคราะห์สะสม",
                                style: TextStyle(
                                    color: currentPage == '/billing'
                                        ? Color(activePage)
                                        : Color(inActivePage),
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 12.0))),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.notifications,
                                size: 31.0,
                                color: currentPage == '/notification'
                                    ? Color(activePage)
                                    : Color(inActivePage)),
                            title: new Text("การแจ้งเตือน",
                                style: TextStyle(
                                    color: currentPage == '/notification'
                                        ? Color(activePage)
                                        : Color(inActivePage),
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 12.0))),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.menu,
                                size: 31.0,
                                color: currentPage == '/menu'
                                    ? Color(activePage)
                                    : Color(inActivePage)),
                            title: new Text("อื่นๆ",
                                style: TextStyle(
                                    color: currentPage == '/menu'
                                        ? Color(activePage)
                                        : Color(inActivePage),
                                    fontFamily: 'SukhumvitText',
                                    fontSize: 12.0)))
                      ])))));
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
