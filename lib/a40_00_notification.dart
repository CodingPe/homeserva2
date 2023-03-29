import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:badges/badges.dart' as badges;
import 'dart:convert';

abstract class AboutNotification {
  Box badgeBox = Hive.box('TokenBox');
  List<Widget> items = <Widget>[];
  ValueNotifier<int> abc = ValueNotifier<int>(Hive.box('TokenBox').get(2) ?? 0);

  Future getNotificationsData() async {
    var url = 'https://peterapi.vyrox.com/viewnotificationsdata.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }
}

//to create a notification page, which can pull to show cupertinoctivitycircle with bouncing effect, and fetch latest notification, pull_to_refresh_flutter3

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => NotificationsState();
}

class NotificationsState extends State<Notifications> with AboutNotification {
  Future<void> refreshAction() async {
    await Future<void>.delayed(
      const Duration(milliseconds: 1000),
    );
    setState(() {
      badgeBox.put(2, items.length + 1);
      abc.value = badgeBox.get(2);
      //!notification no refresh
      print('notificationCount: ${Hive.box('TokenBox').get(2)}');
      items.insert(
          0,
          ListTile(
            leading: const Icon(Icons.notifications),
            title: Text('Testing ${items.length + 1}'),
            subtitle: const Text('Testing'),
          ));
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var box = Hive.box('TokenBox');
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.home),
          title: const Text('Notifications'),
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
                            style: TextStyle(
                                color: Colors.white, fontSize: 11))))),
            const SizedBox(width: 10),
          ]),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: refreshAction,
          ),
          items.isEmpty
              ? const EmptyList()
              : SliverList(
                  //TODO: fetch notification from database, and insert into items.
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, index) => items[index],
                      childCount: items.length)),
        ],
      ),
    );
  }
}

class EmptyList extends StatelessWidget {
  const EmptyList({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
        child: Center(
            child: Text('- No notification -',
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300))));
  }
}
