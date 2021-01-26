import 'package:flutter/material.dart';
import 'package:cremation/view/home.dart';
import 'package:cremation/view/invoice.dart';
import 'package:cremation/view/notification.dart';
import 'package:cremation/view/menu.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 1), curve: Curves.easeOut);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: new Scaffold(
          body: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _selectedIndex = index);
            },
            children: <Widget>[
              HomePage(),
              InvoicePage(),
              NotificationPage(),
              Menu(),
            ],
          ),
          bottomNavigationBar: navigationBottomBarTab(context),
        ));
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
                        currentIndex: _selectedIndex,
                        onTap: _onItemTapped,
                        selectedItemColor: Color(0xFFEFA746),
                        unselectedItemColor: Color(0xFFACB3BF),
                        backgroundColor: Colors.white,
                        type: BottomNavigationBarType.fixed,
                        selectedLabelStyle: TextStyle(
                            fontFamily: 'SukhumvitText', fontSize: 12.0),
                        unselectedLabelStyle: TextStyle(
                            fontFamily: 'SukhumvitText', fontSize: 12.0),
                        elevation: 0,
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Icon(Icons.home_outlined,
                                size: 31.0,
                                color: _selectedIndex == 0
                                    ? Color(activePage)
                                    : Color(inActivePage)),
                            label: 'หน้าแรก',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.wysiwyg,
                                size: 31.0,
                                color: _selectedIndex == 1
                                    ? Color(activePage)
                                    : Color(inActivePage)),
                            label: 'เรียกเก็บเงินสงเคราะห์',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.notifications,
                                size: 31.0,
                                color: _selectedIndex == 2
                                    ? Color(activePage)
                                    : Color(inActivePage)),
                            label: 'การแจ้งเตือน',
                          ),
                          BottomNavigationBarItem(
                            icon: Icon(Icons.menu,
                                size: 31.0,
                                color: _selectedIndex == 3
                                    ? Color(activePage)
                                    : Color(inActivePage)),
                            label: 'อื่นๆ',
                          )
                        ])))));
  }
}
