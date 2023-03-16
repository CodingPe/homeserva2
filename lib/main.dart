import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homeserva_2/a00_00_directory.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; //push notification必定需要安裝的package //push notification must be installed package
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'dart:convert';
import 'firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

//? flutter_local_notifications
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  //'This channel is used for important notifications.', // description
  importance: Importance.high,
  playSound: true,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

//? flutter_local_notifications

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await Hive.initFlutter();
  await Hive.openBox('TokenBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    noRotation();
    statusBar();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SMARTSERVA',
      theme: ThemeData(
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 11.8),
            bodyText2: TextStyle(fontSize: 11.8),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            toolbarHeight: 45.8,
            backgroundColor: CupertinoColors.systemGrey6,
            foregroundColor: CupertinoColors.black,
            elevation: 0.8,
          )),
      home: const LoginUser(), // refer to (6.)
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final FirebaseMessaging _messaging;

  Future<void> requestAndRegisterNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    //? flutter_local_notifications by Peter.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    //? foreground notification by Peter.
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    NotificationSettings settings = await _messaging.requestPermission(
        alert: true, badge: true, provisional: true, sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      String? token = await _messaging.getToken();
      print("The token is " + token!);
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("Received message: ${message.notification!.body}");
      // You can add your own code here to handle the message
    });
  }

  @override
  void initState() {
    super.initState();
    requestAndRegisterNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              //channel.description,
              icon: 'launch_background',
            )));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> data = const [
      Dashboard(),
      Functions(),
      Accounting(),
      Notifications(),
      Me(),
    ];

    const double iconSize = 22.8;

    return Scaffold(
        body: CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              backgroundColor: CupertinoColors.systemGrey6,
              activeColor: CupertinoColors.activeBlue,
              inactiveColor: Colors.grey,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home, size: iconSize),
                    label: "Dashboard"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.grid_view_outlined, size: iconSize),
                    label: "Functions"),
                BottomNavigationBarItem(
                    icon:
                        Icon(Icons.insert_chart_outlined_sharp, size: iconSize),
                    label: "Accounting"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications_active_outlined,
                        size: iconSize),
                    label: "Notification"),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person, size: iconSize),
                    label: "Me"),
              ],
            ),
            tabBuilder: (context, index) {
              return CupertinoTabView(builder: (context) {
                return data[index];
              });
            }));
  }
}
