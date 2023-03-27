import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future getNotificationsData() async {
  var url = 'https://peterapi.vyrox.com/viewnotificationsdata.php';
  var response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}

//to create a notification page, which can pull to show cupertinoactivitycircle with bouncing effect, and fetch latest notification, pull_to_refresh_flutter3

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Color> colors = <Color>[
    CupertinoColors.systemYellow,
    CupertinoColors.systemOrange,
    CupertinoColors.systemPink,
  ];
  List<Widget> items = <Widget>[
    Container(color: CupertinoColors.systemPink, height: 80.0),
    Container(color: CupertinoColors.systemOrange, height: 80.0),
    Container(color: CupertinoColors.systemYellow, height: 80.0),
  ];

  Future<void> aa() async {
    await Future<void>.delayed(
      const Duration(milliseconds: 1000),
    );
    setState(() {
      //TODO: fetch latest notification from database, and insert into items.
      // items.insert(
      //   0,
      //   Container(color: colors[items.length % 3], height: 80.0),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            onRefresh: aa,
          ),
          SliverList(
            //TODO: fetch notification from database, and insert into items.
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => items[index],
              childCount: items.length,
            ),
          ),
        ],
      ),
    );
  }
}
