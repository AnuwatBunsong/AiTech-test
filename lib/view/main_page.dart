import 'package:flutter/material.dart';
import 'package:cremation/utils/widget.dart';
import 'package:cremation/view/home.dart';
import 'package:cremation/view/billing.dart';
import 'package:cremation/view/notification.dart';
import 'package:cremation/view/menu.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  List<Widget> tabBarViews;
  List tabBar;
  final _activeDelete = false;

  Map<String, dynamic> data;

  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    controller.index = 0;
    tabBarViews = [
      HomePage(),
      BillingPage(),
      NotificationPage(data: data),
      Menu()
    ];
    tabBar = [
      {
        'pageTitle': 'หน้าแรก',
        'icon': false,
        'backPage': false,
        'backgroundColor': 0xFFFFFFFF
      },
      {
        'pageTitle': 'การเรียกเก็บเงินสงเคราะห์',
        'icon': false,
        'backPage': false,
        'backgroundColor': 0xFFE5E5E5
      },
      {
        'pageTitle': 'การแจ้งเตือน',
        'icon': true,
        'backPage': false,
        'backgroundColor': 0xFFFFFFFF
      },
      {
        'pageTitle': 'อื่นๆ',
        'icon': false,
        'backPage': false,
        'backgroundColor': 0xFFE5E5E5
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: tabBar[controller.index]['backPage'],
        centerTitle: true,
        title: appBarTitle(tabBar[controller.index]['pageTitle']),
        flexibleSpace: appBarBackground(),
        actions: <Widget>[
          if (!_activeDelete && controller.index == 2)
            IconButton(
              icon: new Icon(
                Icons.delete_outline,
              ),
              tooltip: 'Delete',
              onPressed: () {},
            )
        ],
      ),
      backgroundColor: Color(tabBar[controller.index]['backgroundColor']),
      body: TabBarView(
        children: tabBarViews,
        controller: controller,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: navigationBottomBarTab(context),
    );
  }

  Widget navigationBottomBarTab(BuildContext context) {
    final inActivePage = 0xFFACB3BF;
    final activePage = 0xFFEFA746;

    return Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        child: BottomAppBar(
            color: Color.fromRGBO(66, 165, 245, 0),
            elevation: 0,
            child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
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
                        onTap: (index) {
                          setState(() {
                            controller.index = index;
                          });
                        },
                        backgroundColor: Colors.white,
                        type: BottomNavigationBarType.fixed,
                        elevation: 0,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                              icon: Icon(Icons.home_outlined,
                                  size: 31.0,
                                  color: controller.index == 0
                                      ? Color(activePage)
                                      : Color(inActivePage)),
                              title: new Text("หน้าแรก",
                                  style: TextStyle(
                                      color: controller.index == 0
                                          ? Color(activePage)
                                          : Color(inActivePage),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 12.0))),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.wysiwyg,
                                  size: 31.0,
                                  color: controller.index == 1
                                      ? Color(activePage)
                                      : Color(inActivePage)),
                              title: new Text("เงินสงเคราะห์สะสม",
                                  style: TextStyle(
                                      color: controller.index == 1
                                          ? Color(activePage)
                                          : Color(inActivePage),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 12.0))),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.notifications,
                                  size: 31.0,
                                  color: controller.index == 2
                                      ? Color(activePage)
                                      : Color(inActivePage)),
                              title: new Text("การแจ้งเตือน",
                                  style: TextStyle(
                                      color: controller.index == 2
                                          ? Color(activePage)
                                          : Color(inActivePage),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 12.0))),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.menu,
                                  size: 31.0,
                                  color: controller.index == 3
                                      ? Color(activePage)
                                      : Color(inActivePage)),
                              title: new Text("อื่นๆ",
                                  style: TextStyle(
                                      color: controller.index == 3
                                          ? Color(activePage)
                                          : Color(inActivePage),
                                      fontFamily: 'SukhumvitText',
                                      fontSize: 12.0)))
                        ])))));
  }
}
