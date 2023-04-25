import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:transporters_android/constants.dart';
import 'package:transporters_android/functions/firebase_services.dart';
import 'package:transporters_android/functions/services.dart';
import 'package:transporters_android/home.dart';
import 'package:transporters_android/stores/item_type_store.dart';
import 'package:transporters_android/stores/place_order_store.dart';
import 'package:transporters_android/stores/size_selector_store.dart';

import 'package:transporters_android/views/login.dart';

void main() async {
  /// Initilizing firebase messaging for notifications
  await FirebaseService.initializeFirebase();
  await FirebaseService.getDeviceToken();
  await FirebaseService.initializeFirebaseMessaging();
  await FirebaseService.initializeFlutterLocalNotifications();

  const storage = FlutterSecureStorage();
  String? token = await storage.read(key: 'token');

  GetIt getIt = GetIt.instance;
  getIt.registerSingleton<ItemTypeStore>(ItemTypeStore());
  getIt.registerSingleton<SizeSelectorStore>(SizeSelectorStore());
  getIt.registerSingleton<PlaceOrderStore>(PlaceOrderStore());

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
    print('Token is: $token');
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
        appBarTheme: const AppBarTheme(
          color: primaryColor,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? const Home() : const LoginPage(),
    );
  }
}
