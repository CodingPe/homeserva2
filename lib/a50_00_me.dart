import 'package:flutter/material.dart';
import 'package:homeserva_2/a00_00_directory.dart';
import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Me extends StatefulWidget {
  const Me({Key? key}) : super(key: key);

  @override
  State<Me> createState() => _MeState();
}

class _MeState extends State<Me> {
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
              onTap: (){
                Navigator.of(context).pop();
              },
              child: const Icon(Icons.clear),
            )
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          title: const Text("Me"),
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
            ]
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Container(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(children: [
                      Center(
                          child: Container(
                              padding: const EdgeInsets.all(0.8),
                              child: const CircleAvatar(
                                radius: 68,
                                backgroundImage: NetworkImage(
                                    'https://newdemo.homeserva.com/images/pic_1.png'),
                              ))),
                      const SizedBox(height: 30),
                      MeBlock1(),
                      const MeBlock2(),
                      const SizedBox(height: 30),
                      const ChangePasswordButton(),
                      const LogoutButton(),
                      const WebContentTPD(),
                      const LastAgreed(),
                    ]))),
            if (_isPressed)
              Container(
                color: const Color.fromARGB(255, 51, 51, 51).withOpacity(0.8),
              ),
            if (!_countdownEnded)
              Center(
                child: AnimatedOpacity(
                  opacity: _isPressed ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 200),
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
                            width: MediaQuery.of(context).size.width * _countdown / 3,
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
                            behavior: const ScrollBehavior().copyWith(overscroll: false),
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
                                        color: _isAmbulance ? Colors.white : Colors.red,
                                        border: Border.all(color: Colors.black),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      child: Center(
                                        child: Text(
                                          'Ambulance',
                                          style: TextStyle(
                                            color: _isAmbulance ? Colors.black : Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                  ),
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
                                        color: _isPolice ? Colors.white : Colors.red,
                                        border: Border.all(color: Colors.black),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      child: Center(
                                        child: Text(
                                          'Police',
                                          style: TextStyle(
                                            color: _isPolice ? Colors.black : Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                  ),
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
                                        color: _isFireFighter ? Colors.white : Colors.red,
                                        border: Border.all(color: Colors.black),
                                      ),
                                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                      child: Center(
                                        child: Text(
                                          'Fire Fighter',
                                          style: TextStyle(
                                            color: _isFireFighter ? Colors.black : Colors.white,
                                            fontSize: 20,
                                          ),
                                        ),
                                      )
                                  ),
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
                                            icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
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
                                      onChanged: (String? newValue){
                                        setState(() {
                                          selectedUnit = newValue!;
                                        });
                                      },
                                      items: unit.map((value) => DropdownMenuItem(
                                        value: value,
                                        child: Text('   $value',),
                                      )).toList(),
                                    )
                                ),
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
                                        onSubmit: (){
                                          _showSOSAccessDialog();
                                        },
                                      )),
                                )
                              ],
                            )
                        )
                    ),
                  ),
                ),
              ),

          ],
        ));
  }
}

class LastAgreed extends StatelessWidget {
  const LastAgreed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      SizedBox(height: 10),
      Text(
        "Agreed on 02-Jan-2023 7:50AM",
        style: TextStyle(color: Colors.grey),
      ),
      SizedBox(height: 10),
    ]);
  }
}
