import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging;

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
    //print("FirebaseMessaging token: $token");

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        return;
      },
      /*onBackgroundMessage: myBackgroundMessageHandler,*/
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
  }
}
