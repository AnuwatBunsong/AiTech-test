import 'package:flutter/material.dart';
import 'package:cremation/view/splash_screen.dart';
import 'package:cremation/view/login.dart';
import 'package:cremation/view/home.dart';
import 'package:cremation/view/notification.dart';
import 'package:cremation/view/menu.dart';
import 'package:cremation/view/news.dart';
import 'package:cremation/view/news_detail.dart';
import 'package:cremation/view/profile.dart';
import 'package:cremation/view/billing.dart';
import 'package:cremation/view/billing_history.dart';
import 'package:cremation/view/billing_detail.dart';

final routes = {
  '/': (BuildContext context) => new SplashScreen(),
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
  '/notification': (BuildContext context) => new NotificationPage(),
  '/menu': (BuildContext context) => new Menu(),
  '/news': (BuildContext context) => new NewsPage(),
  '/news_detail': (BuildContext context) => new NewsDetailPage(),
  '/profile': (BuildContext context) => new ProfilePage(),
  '/billing': (BuildContext context) => new BillingPage(),
  '/billing_history': (BuildContext context) => new BillingHistoryPage(),
  '/billing_detail': (BuildContext context) => new BillingDetailPage(),
};
