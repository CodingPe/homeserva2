import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:slide_to_act/slide_to_act.dart';
import 'dart:async';
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
  int _countdown = 0;
  bool _countdownEnded = false;
  bool _isPressed = false;
  Timer? _timer;
  bool _isAmbulance = true;
  bool _isPolice = true;
  bool _isFireFighter = true;
  TextEditingController remark = TextEditingController();
  final List<String> unit = <String>[
    'D-5-19',
  ];
  String? selectedUnit;

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_countdown == 0) {
          _countdownEnded = true;
          _timer?.cancel();
        } else {
          _countdown--;
        }
      });
    });
  }

  void _showSOSAccessDialog() {
    setState(() {
      _isPressed = false;
      _countdown = 0;
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("SOS Alert"),
          content: const Text("The SOS alarm has been successfully called!"),
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.clear),
            )
          ],
        );
      },
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

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
        title: const Text('Dashboard',
            style: TextStyle(fontWeight: FontWeight.bold)),
        shape:
            Border(bottom: BorderSide(color: Colors.grey.shade100, width: 1)),
        elevation: 0.5,
        actions: [
          SizedBox(
            width: 35,
            height: 35,
            child: CircleAvatar(
              backgroundColor: Colors.red,
              child: GestureDetector(
                onTapDown: (_) {
                  setState(() {
                    _isPressed = false;
                    _countdown = 3;
                    _countdownEnded = false; // set flag to false
                  });
                },
                onLongPressStart: (_) {
                  setState(() {
                    _isPressed = true;
                  });
                  _startTimer();
                },
                onLongPressEnd: (_) {
                  setState(() {
                    _isPressed = false;
                    _timer?.cancel();
                    if (_countdownEnded) {
                      _isPressed = true;
                      _countdown = 1;
                    }
                  });
                },
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  width: 100,
                  height: 100,
                  child: const Center(
                    child: Text(
                      "SOS",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10)
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 0.7,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(children: <Widget>[
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
                    behavior:
                        const ScrollBehavior().copyWith(overscroll: false),
                    child: Scrollbar(
                      child: FutureBuilder(
                        future: getAnnouncementData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {}
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
                                                      list: list,
                                                      index: index));
                                            },
                                            child: Row(children: [
                                              ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.network(
                                                      list[index]['Photo'],
                                                      width: 70,
                                                      height: 70,
                                                      fit: BoxFit.cover)),
                                              const SizedBox(width: 16),
                                              Expanded(
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                    Text(
                                                      list[index]['Title'],
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 20),
                                                    ),
                                                    const SizedBox(height: 10),
                                                    Text(
                                                      list[index]['Time'],
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.w200,
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
          ]),
          if (_isPressed)
            Container(
              color: const Color.fromARGB(255, 51, 51, 51).withOpacity(0.8),
            ),
          if (!_countdownEnded)
            Center(
              child: AnimatedOpacity(
                opacity: _isPressed ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: IgnorePointer(
                  ignoring: true,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Center(
                      child: Column(
                        children: [
                          const Text(
                            'Emergency SOS',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 40,
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            _countdown.toString(),
                            style: const TextStyle(
                              fontSize: 120,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 30),
                          AnimatedContainer(
                            duration: const Duration(seconds: 1),
                            width: MediaQuery.of(context).size.width *
                                _countdown /
                                3,
                            height: 10,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 40),
                          const Text(
                            'Initializing...',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          if (_countdownEnded)
            Center(
              child: AnimatedOpacity(
                opacity: _isPressed ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      key: _formKey,
                      child: ScrollConfiguration(
                          behavior: const ScrollBehavior()
                              .copyWith(overscroll: false),
                          child: ListView(
                            children: [
                              const Center(
                                child: Text(
                                  'Emergency SOS',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 40),
                              const Text(
                                'I need help from',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                ),
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isAmbulance = !_isAmbulance;
                                  });
                                },
                                child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: _isAmbulance
                                          ? Colors.white
                                          : Colors.red,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Center(
                                      child: Text(
                                        'Ambulance',
                                        style: TextStyle(
                                          color: _isAmbulance
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isPolice = !_isPolice;
                                  });
                                },
                                child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color:
                                          _isPolice ? Colors.white : Colors.red,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Center(
                                      child: Text(
                                        'Police',
                                        style: TextStyle(
                                          color: _isPolice
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isFireFighter = !_isFireFighter;
                                  });
                                },
                                child: Container(
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: _isFireFighter
                                          ? Colors.white
                                          : Colors.red,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Center(
                                      child: Text(
                                        'Fire Fighter',
                                        style: TextStyle(
                                          color: _isFireFighter
                                              ? Colors.black
                                              : Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                width: 300,
                                height: 60,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Center(
                                    child: TextFormField(
                                      controller: remark,
                                      decoration: InputDecoration(
                                        hintText: 'Remark',
                                        border: InputBorder.none,
                                        suffixIcon: remark.text.isNotEmpty
                                            ? IconButton(
                                                icon: const Icon(
                                                  Icons.clear,
                                                  color: Colors.grey,
                                                  size: 20,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    remark.clear();
                                                  });
                                                },
                                              )
                                            : null,
                                      ),
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: DropdownButtonFormField(
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    isExpanded: true,
                                    value: unit.first,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedUnit = newValue!;
                                      });
                                    },
                                    items: unit
                                        .map((value) => DropdownMenuItem(
                                              value: value,
                                              child: Text(
                                                '   $value',
                                              ),
                                            ))
                                        .toList(),
                                  )),
                              const SizedBox(height: 15),
                              Center(
                                child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SlideAction(
                                      borderRadius: 30,
                                      elevation: 0,
                                      innerColor: Colors.red,
                                      outerColor: Colors.white,
                                      sliderButtonIcon: const Icon(
                                        Icons.sos,
                                        color: Colors.white,
                                      ),
                                      text: '       Slide to Request',
                                      onSubmit: () {
                                        _showSOSAccessDialog();
                                      },
                                    )),
                              )
                            ],
                          ))),
                ),
              ),
            ),
        ],
      ),
    );
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