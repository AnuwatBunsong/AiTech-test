import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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

  Future<void> scheduleNotification() async {
    tz.initializeTimeZones();
    var date = new DateTime.now();
    var newDate = new DateTime(date.year, date.month + 1, date.day).toString();
    var dateParse = DateTime.parse(newDate);
    int year = dateParse.year;
    int month = dateParse.month;
    int id = 0;

    for (var i = year; i <= (year + 10); i++) {
      for (var t = month; t <= 12; t++) {
        id++;
        DateTime timezone = tz.TZDateTime.local(i, t, 1, 2, 0, 0, 0, 0);
        await flutterLocalNotificationsPlugin.zonedSchedule(
            id,
            'แจ้งเตือน',
            'แจ้งชำระยอดค้างชำระประจำเดือน มกราคม',
            timezone,
            const NotificationDetails(
                android: AndroidNotificationDetails(
                    '1', 'your channel name', 'your channel description')),
            androidAllowWhileIdle: true,
            uiLocalNotificationDateInterpretation:
                UILocalNotificationDateInterpretation.absoluteTime);
      }
    }
  }

  Future pushNotification(String title, String body) async {
    print(title);
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
    print(title);
    print(body);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin
        .show(1, title, body, platformChannelSpecifics, payload: 'item x');
  }

  Future selectNotification(String payload) async {
    // some action...
    print(payload);
  }
}
