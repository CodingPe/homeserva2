import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:homeserva_2/a00_00_directory.dart';
// ignore: unnecessary_import
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_messaging/firebase_messaging.dart'; //push notification必定需要安裝的package //push notification must be installed package
// ignore: depend_on_referenced_packages
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
  const MyApp({super.key});

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
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Functions(),
    Accounting(),
    Notifications(),
    Me(),
  ];

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

    return WillPopScope(
      onWillPop: () async {
        showDialog(
          context: context,
          builder: (context) =>  CupertinoAlertDialog(
            title: const Text('Confirm Exit'),
            content: const Text('Do you want to exit the app?'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(false),
                isDefaultAction: true,
                child: const Text('No'),
              ),
              CupertinoDialogAction(
                onPressed: (){
                  Navigator.of(context).pop(true);
                  SystemNavigator.pop();
                },
                isDestructiveAction: true,
                child: const Text('Yes'),
              ),
            ],
          ),
        );
        return false;
      },
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(width: 0.5,color: Color.fromARGB(255, 208, 207, 212)),
              )
          ),
          child: BottomNavigationBar(
            backgroundColor: const Color.fromARGB(255, 243, 242, 247),
            type: BottomNavigationBarType.fixed,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.grid_view_outlined),
                label: 'Functions',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart_outlined_sharp),
                label: 'Accounting',
              ),
              BottomNavigationBarItem(
                icon: BadgeIcon(),
                label: '  Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Me',
              ),
            ],
            selectedFontSize: 12,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
        ),
      )
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
        child: const Icon(Icons.notifications_active_outlined, size: 22.8));
  }
}