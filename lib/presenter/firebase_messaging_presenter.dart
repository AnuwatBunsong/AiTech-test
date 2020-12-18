import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cremation/presenter/local_notification_presenter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/*Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  if (message.containsKey('data')) {
    // Handle data message
    final dynamic data = message['data'];
  }

  if (message.containsKey('notification')) {
    // Handle notification message
    final dynamic notification = message['notification'];
  }

  // Or do other work.
}*/

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging;
  final LocalNotifications _localNotification = LocalNotifications();

  PushNotificationService(this._firebaseMessaging);

  Future initialise() async {
    /*if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(IosNotificationSettings());
    }*/

    String token = await _firebaseMessaging.getToken();
    print("FirebaseMessaging token: $token");

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        _localNotification.initNotifications();
        _localNotification.pushNotification(
            message['notification']['title'], message['notification']['body']);
      },
      onBackgroundMessage: Platform.isIOS ? null : myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        return;
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        return;
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) async {
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    print("myBackgroundMessageHandler message: $message");
    int msgId = int.tryParse(message["data"]["msgId"].toString()) ?? 0;
    print("msgId $msgId");
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'push_messages: 0',
      'push_messages: push_messages',
      'push_messages: A new Flutter project',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
      enableVibration: true,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin
        .show(1, 'abc', 'def', platformChannelSpecifics, payload: 'item x');
    return Future<void>.value();
  }
}
