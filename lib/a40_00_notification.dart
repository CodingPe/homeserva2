import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  Future getNotificationsData() async {
    var url = 'https://peterapi.vyrox.com/viewnotificationsdata.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.home),
          title: const Text("Notification"),
        ),
        body: Scrollbar(child: Column(
          children: <Widget>[
            Expanded(
                flex: 8,
                child: FutureBuilder(
                  future: getNotificationsData(),
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
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailNotificationsPage(
                                                    list: list,
                                                    index: index)));
                                  },
                                  child: Row(children: [
                                    ClipRRect(
                                      borderRadius:
                                      BorderRadius.circular(12.0),
                                      child: Image.network(
                                        list[index]['Photo'],
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
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
                      child: Text("No notification yet",style: TextStyle(fontWeight: FontWeight.w200,color: Color.fromARGB(
                          255, 66, 72, 82),),),
                    );
                  },
                ) //這個是announcement的futurebuilder 可以通過上面的flex改變大小
            ),
          ],
        )));
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
              Text(
                list[index]['Title'],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                list[index]['Body'],
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                list[index]['Time'],
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 16.0),
            ]) //可以繼續加自己想要的東西在Column裡面
                )));
  }
}
