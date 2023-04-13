import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:transporters_android/functions/firebase_services.dart';
import 'package:transporters_android/functions/services.dart';

import 'package:transporters_android/views/login.dart';

void main() async {
  /// Initilizing firebase messaging for notifications
  await FirebaseService.initializeFirebase();
  await FirebaseService.getDeviceToken();
  await FirebaseService.initializeFirebaseMessaging();
  await FirebaseService.initializeFlutterLocalNotifications();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

    final pushNotification = PushNotificationService(_firebaseMessaging);
    pushNotification.initialise();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.purple[900],
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
