import 'dart:io';
import 'package:flutter/material.dart';

class emergencynumbers extends StatefulWidget {
  const emergencynumbers({Key? key}) : super(key: key);

  @override
  State<emergencynumbers> createState() => _emergencynumbersState();
}

class _emergencynumbersState extends State<emergencynumbers> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Numbers',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}