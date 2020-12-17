import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cremation/presenter/local_notification_presenter.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging;
  final LocalNotifications _localNotification = LocalNotifications();

  PushNotificationService(this._firebaseMessaging);

  static Future<dynamic> myBackgroundMessageHandler(
      Map<String, dynamic> message) {
    if (message.containsKey('data')) {
      // Handle data message
      final dynamic data = message['data'];
    }

    if (message.containsKey('notification')) {
      // Handle notification message
      final dynamic notification = message['notification'];
    }

    // Or do other work.
  }

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
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        return;
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        return;
      },
      /*onBackgroundMessage: myBackgroundMessageHandler*/
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
}
