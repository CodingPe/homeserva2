import 'package:flutter/material.dart';

class EmergencySOS extends StatefulWidget {
  const EmergencySOS({Key? key}) : super(key: key);

  @override
  State<EmergencySOS> createState() => _EmergencySOSState();
}

class _EmergencySOSState extends State<EmergencySOS> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency SOS',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}