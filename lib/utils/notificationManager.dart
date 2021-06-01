import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:foi_et_verite/screen/notificationScreen.dart';
import 'package:foi_et_verite/utils/route.dart';

class NotificationManager {
  FlutterLocalNotificationsPlugin notif = new FlutterLocalNotificationsPlugin();
  var settingsAndroid;
  var initializationSettings;
  var platformChannelSpecifics;
  var androidPlatformChannelSpecifics;

  initnotification() async {
    androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'channel_ID', 'channel name', 'channel description',
        importance: Importance.max, priority: Priority.high, ticker: 'ticher');
    platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
  }

  initNotificationSetting(BuildContext context) async {
    settingsAndroid = AndroidInitializationSettings('ic_launcher');
    initializationSettings = InitializationSettings(android: settingsAndroid);
    notif.initialize(initializationSettings, onSelectNotification: (val) async {
      pushNewPage(NotificationScreen(), context);
      print(val);
    });
  }

  showNotification() async {
    initnotification();
    await notif.show(0, 'Foi et vérité', "Nouveau", platformChannelSpecifics,
        payload: 'foietverite');
  }
}
