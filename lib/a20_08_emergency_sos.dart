import 'dart:io';
import 'package:flutter/material.dart';

class emergencysos extends StatefulWidget {
  const emergencysos({Key? key}) : super(key: key);

  @override
  State<emergencysos> createState() => _emergencysosState();
}

class _emergencysosState extends State<emergencysos> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency SOS',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}