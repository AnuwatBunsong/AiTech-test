import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cremation/data/notification_data.dart';
import 'package:intl/intl.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  NotificationDataRepository dbNotification = new NotificationDataRepository();

  void initNotifications() async {
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(onDidReceiveLocalNotification: null);
    final MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  PushNotificationService(this._firebaseMessaging);

  void fcmSubscribe() {
    _firebaseMessaging.subscribeToTopic('all_dev');
  }

  void fcmUnSubscribe() {
    _firebaseMessaging.unsubscribeFromTopic('all_dev');
  }

  Future initialise() async {
    if (Platform.isIOS) {
      _firebaseMessaging
          .requestNotificationPermissions(IosNotificationSettings());
    }

    String token = await _firebaseMessaging.getToken();
    print("FirebaseMessaging token: $token");

    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print("onMessage: $message");
          initNotifications();
          String sender;
          String parsedMessage;
          if (Platform.isAndroid) {
            sender = message['notification']['title'];
            parsedMessage = message['notification']['body'];
          }
          if (Platform.isIOS) {
            sender = message['title'];
            parsedMessage = message['body'];
          }
          pushNotification(sender, parsedMessage);

          /*_localNotification.initNotifications();
          _localNotification.pushNotification(
              message['data']['title'], message['data']['body']);*/
          createNotification(sender, parsedMessage);
        },
        onBackgroundMessage: Platform.isIOS ? null : myBackgroundMessageHandler,
        onLaunch: (Map<String, dynamic> message) async {
          print("onLaunch: $message");
          return;
        },
        onResume: (Map<String, dynamic> message) async {
          print("onResume: $message");
          return;
        });
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(
            sound: true, badge: true, alert: true, provisional: false));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      //print("Settings registered: $settings");
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
    await flutterLocalNotificationsPlugin.show(msgId, message['data']['title'],
        message['data']['body'], platformChannelSpecifics,
        payload: 'item x');
    return Future<void>.value();
  }

  Future pushNotification(String title, String body) async {
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
        .show(1, title, body, platformChannelSpecifics, payload: 'item x');
  }

  static Future selectNotification(String payload) async {
    // some action...
    print(payload);
  }

  void createNotification(title, description) {
    print(title);
    final now = new DateTime.now();
    String formatDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    dynamic item = {
      'title': title,
      'description': description,
      'created_date': formatDate
    };

    dbNotification.insert(item).then((data) {
      print(data);
    }).catchError((e) {
      print(e);
    });
  }
}
