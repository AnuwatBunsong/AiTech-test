import 'package:flutter/material.dart';
import 'package:cremation/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cremation/presenter/firebase_messaging_presenter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    final pushNotificationService = PushNotificationService(_firebaseMessaging);
    pushNotificationService.initialise();
    pushNotificationService.fcmSubscribe();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'cmph',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: routes,
    );
  }
}
