import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm;

  PushNotificationService(this._fcm);

  Future initialise() async {
    if (Platform.isIOS) {
      _fcm.requestPermission();
    }

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // Create a notification channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'default_channel', // ID
      'Default Channel', // Title
      importance: Importance.max,
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    // Request permission for notifications
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');

    // If you want to test the push notification locally,
    // you need to get the token and input to the Firebase console
    // https://console.firebase.google.com/project/YOUR_PROJECT_ID/notification/compose
    String? token = await _fcm.getToken();
    print("FirebaseMessaging token: $token");

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      print("WE ARE HERE");
      if (notification != null && android != null) {
        var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
          'default_channel', // ID
          'Default Channel', // Title
          importance: Importance.max,
          priority: Priority.high,
        );
        var platformChannelSpecifics =
            new NotificationDetails(android: androidPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
          0, // Notification ID
          message.notification!.title, // Notification Title
          message.notification!.body, // Notification Body
          platformChannelSpecifics,
          payload: message.data['route'], // Payload
        );

        print('onMessage: ${message.notification!.title}');
      }
    });
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if (value != null) {
        print('onLaunch: ${value.notification!.title}');
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenedApp event was published!');
    });
  }
}
