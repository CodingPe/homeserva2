import 'package:flutter/material.dart';
import 'dart:async';

class SosButton extends StatefulWidget {
  const SosButton({Key? key}) : super(key: key);

  @override
  _SOSButtonState createState() => _SOSButtonState();
}

class _SOSButtonState extends State<SosButton> {
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
    if (_countdown == 0) {
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
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 35,
      height: 35,
      child: CircleAvatar(
        backgroundColor: Colors.red,
        child: GestureDetector(
          onTapDown: (_) {
            setState(() {
              _isPressed = false;
              _countdown = 3;
              _countdownEnded = false;
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
              _timer?.cancel();
              if (_countdownEnded) {
                _isPressed = true;
              } else {
                _isPressed = false;
              }
              _countdown = 0;
            });
          },
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            width: 100,
            height: 100,
            child: Center(
              child: Text(
                "SOS",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
