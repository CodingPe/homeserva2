import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:homeserva_2/a00_00_directory.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
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
      title: 'HOMESERVA',
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
      home: const MainPage(), // refer to (6.)
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
