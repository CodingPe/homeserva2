import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homeserva_2/a00_00_directory.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; //push notification必定需要安裝的package //push notification must be installed package
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:badges/badges.dart' as badges;

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint("Handling a background message: ${message.messageId}");
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
            bodyLarge: TextStyle(fontSize: 11.8),
            bodyMedium: TextStyle(fontSize: 11.8),
          ),
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            toolbarHeight: 45.8,
            backgroundColor: CupertinoColors.systemGrey6,
            foregroundColor: CupertinoColors.black,
            elevation: 0.8,
          )),
      home: const MainAction(), // refer to (6.)
    );
  }
}

class MainAction extends StatefulWidget {
  const MainAction({super.key});

  @override
  State<MainAction> createState() => _MainActionState();
}

class _MainActionState extends State<MainAction> {
  final tokenBox = Hive.box('TokenBox');
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 0), () {
      if (tokenBox.get(1) == '' || tokenBox.get(1) == null) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginUser()));
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const MainPage()));
      }
    });
    // return cupertinoActivityIndicator(), until tokenBox.get(1) is ready.
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
            child: CupertinoActivityIndicator(
                radius: 15, color: CupertinoColors.activeBlue)));
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  MainPageState createState() => MainPageState();
}

class MainPageState extends State<MainPage> with AboutNotification {
  late final FirebaseMessaging _messaging;
  Future<void> requestAndRegisterNotification() async {
    await Firebase.initializeApp();
    _messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    //? flutter_local_notifications by Peter.
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    //? foreground notification by Peter.
    await _messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: false,
      sound: true,
    );

    NotificationSettings settings = await _messaging.requestPermission(
        alert: true, badge: false, provisional: true, sound: true);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      debugPrint('User granted permission');
      String? token = await _messaging.getToken();
      debugPrint("The token is $token");
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      debugPrint("Received message: ${message.notification!.body}");
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
              // icon: 'launch_background',
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
                  icon: Icon(Icons.insert_chart_outlined_sharp, size: iconSize),
                  label: "Accounting"),
              BottomNavigationBarItem(icon: BadgeIcon(), label: "Notification"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.person, size: iconSize),
                  label: "Me"),
            ],
          ),
          tabBuilder: (context, index) {
            return CupertinoTabView(builder: (context) {
              return data[index];
            });
          }),
    );
  }
}

class BadgeIcon extends StatefulWidget {
  const BadgeIcon({super.key});

  @override
  State<BadgeIcon> createState() => _BadgeIconState();
}

class _BadgeIconState extends State<BadgeIcon> with AboutNotification {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //!notification no refresh
    return ValueListenableBuilder<int>(
        valueListenable: abc,
        builder: (context, value, _) => badges.Badge(
              badgeContent: Text(value.toString(),
                  style: const TextStyle(color: Colors.white, fontSize: 10)),
              child: const Icon(
                Icons.notifications_active_outlined,
                size: 22.8,
              ),
            ),
        child: const Icon(
          Icons.notifications_active_outlined,
          size: 22.8,
        ));
  }
}
