import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:transporters_android/functions/firebase_services.dart';
import 'package:transporters_android/functions/services.dart';
import 'package:transporters_android/stores/item_type_store.dart';
import 'package:transporters_android/views/home_page.dart';

import 'package:transporters_android/views/login.dart';

void main() async {
  /// Initilizing firebase messaging for notifications
  await FirebaseService.initializeFirebase();
  await FirebaseService.getDeviceToken();
  await FirebaseService.initializeFirebaseMessaging();
  await FirebaseService.initializeFlutterLocalNotifications();

  final storage = new FlutterSecureStorage();
  String? token = await storage.read(key: 'token');

  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<ItemTypeStore>(ItemTypeStore());

  runApp(MyApp(
    token: token ?? '',
  ));
}

class MyApp extends StatelessWidget {
  final String token;
  const MyApp({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = false;
    if (token != '') {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }

    final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    final pushNotification = PushNotificationService(_firebaseMessaging);
    pushNotification.initialise();
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.purple[900],
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? Homepage() : const LoginPage(),
    );
  }
}
