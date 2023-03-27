import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class AboutNotification {
  List<Widget> items = <Widget>[];

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
      //TODO: fetch latest notification from database, and insert into items.
      items.insert(
          0,
          ListTile(
            leading: const Icon(Icons.notifications),
            title: items.isEmpty
                ? Text('Testing ${items.length + 1}')
                : Text('Testing ${items.length}'),
            subtitle: const Text('Testing'),
          ));
      if (items.length == 1) {
        items.add(const SizedBox(
          height: 100,
          child: Center(
              child: Text('- No more notifications -',
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w300))),
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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

class DetailNotificationsPage extends StatelessWidget {
  final List list;
  final int index;

  const DetailNotificationsPage(
      {Key? key, required this.list, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(list[index]['Title'],
              style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
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
              Text(list[index]['Body'], textAlign: TextAlign.center),
              const SizedBox(height: 16.0),
              Text(list[index]['Time'],
                  style: const TextStyle(fontWeight: FontWeight.w300)),
              const SizedBox(height: 16.0),
              //可以繼續加自己想要的東西在Column裡面
            ]))));
  }
}
