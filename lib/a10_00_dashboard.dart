import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:homeserva_2/a00_00_directory.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

//push notification必定需要安裝的package //push notification must be installed package
//? firebase package not using at this file, dart:covert duplicated.
// import 'package:firebase_messaging/firebase_messaging.dart'; //push notification必定需要安裝的package //push notification must be installed package
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key, String? a});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  //! flutter_local_notifications can delete?
  @override
  void initState() {
    super.initState();
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
  //! flutter_local_notifications can delete?

  Future getAnnouncementData() async {
    var url = 'https://peterapi.vyrox.com/viewannouncementsdata.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  //使用這個來接受來自phpmyadmin的announcement table裡面的data
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.home),
          title: const Text("Dashboard"),
          actions: [
            SizedBox(
              width: 35,
              height: 35,
              child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () {},
                      child: const Text('SOS',
                          style:
                              TextStyle(color: Colors.white, fontSize: 11)))),
            ),
            const SizedBox(width: 10)
          ],
        ),
        body: Column(children: <Widget>[
          Container(
              margin: const EdgeInsets.only(top: 10, right: 160),
              child: RichText(
                  text: const TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.speaker_notes,
                        size: 20, color: Colors.black)),
                TextSpan(
                    text: "Announcements",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w200,
                        fontSize: 20))
              ]))),
          Expanded(
              flex: 8,
              child: ScrollConfiguration(
                  behavior: const ScrollBehavior().copyWith(overscroll: false),
                  child: Scrollbar(
                    child: FutureBuilder(
                      future: getAnnouncementData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return snapshot.hasData
                            ? ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              List list = snapshot.data;
                              return Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: GestureDetector(
                                      onTap: () {
                                        navigateAndFinish(
                                            context,
                                            DetailAnnouncementPage(
                                                list: list, index: index));
                                      },
                                      child: Row(children: [
                                        ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(12.0),
                                            child: Image.network(
                                                list[index]['Photo'],
                                                width: 70,
                                                height: 70,
                                                fit: BoxFit.cover)),
                                        const SizedBox(width: 16),
                                        Expanded(
                                            child: Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    list[index]['Title'],
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  const SizedBox(height: 10),
                                                  Text(
                                                    list[index]['Time'],
                                                    style: const TextStyle(
                                                        fontWeight: FontWeight.w200,
                                                        color: Color.fromARGB(
                                                            255, 66, 72, 82),
                                                        fontSize: 13),
                                                  )
                                                ]))
                                      ])));
                            })
                            : const Center(
                          child: Text(
                            "No announcements yet",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              color: Color.fromARGB(255, 66, 72, 82),
                            ),
                          ),
                        );
                      },
                    ),
                  )) //這個是announcement的futurebuilder 可以通過上面的flex改變大小
              ),
        ]));
  }
}

class DetailAnnouncementPage extends StatelessWidget {
  final List list;
  final int index;

  const DetailAnnouncementPage(
      {Key? key, required this.list, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(list[index]['Title'],
                style: const TextStyle(fontWeight: FontWeight.bold))),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: Column(children: <Widget>[
              Image.network(list[index]['Photo']),
              const SizedBox(height: 16.0),
              Text(list[index]['Title'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 30),
                  textAlign: TextAlign.center),
              const SizedBox(height: 16.0),
              Text(list[index]['Description'], textAlign: TextAlign.center),
              const SizedBox(height: 16.0),
              Text(list[index]['Time'],
                  style: const TextStyle(fontWeight: FontWeight.w300)),
              const SizedBox(height: 16.0)
            ]) //可以繼續加自己想要的東西在Column裡面
                )));
  }
} //當用戶點擊了announcement，他將會看到關於有關announcement的詳情，包括時間，主題，詳細內容和照片