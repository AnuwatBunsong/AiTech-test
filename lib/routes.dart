import 'package:flutter/material.dart';
import 'package:cremation/view/splash_screen.dart';
import 'package:cremation/view/main_page.dart';
import 'package:cremation/view/login.dart';
import 'package:cremation/view/news.dart';
import 'package:cremation/view/profile.dart';
import 'package:cremation/view/billing_history.dart';
import 'package:cremation/view/billing_detail.dart';
import 'package:cremation/view/payment.dart';
import 'package:cremation/view/payment_success.dart';

final routes = {
  '/': (BuildContext context) => new SplashScreen(),
  '/main_page': (BuildContext context) => new MainPage(),
  '/login': (BuildContext context) => new LoginPage(),
  '/news': (BuildContext context) => new NewsPage(),
  '/profile': (BuildContext context) => new ProfilePage(),
  '/billing_history': (BuildContext context) => new BillingHistoryPage(),
  '/billing_detail': (BuildContext context) => new BillingDetailPage(),
  '/payment': (BuildContext context) => new PaymentPage(),
  '/payment_success': (BuildContext context) => new PaymentSuccessPage(),
};
