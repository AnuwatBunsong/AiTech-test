import 'package:flutter/material.dart';
import 'package:cremation/view/splash_screen.dart';
import 'package:cremation/view/login.dart';
import 'package:cremation/view/home.dart';

final routes = {
  '/': (BuildContext context) => new SplashScreen(),
  '/login': (BuildContext context) => new LoginPage(),
  '/home': (BuildContext context) => new HomePage(),
};
