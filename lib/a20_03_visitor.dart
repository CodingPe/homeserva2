import 'dart:io';
import 'package:flutter/material.dart';

class visitor extends StatefulWidget {
  const visitor({Key? key}) : super(key: key);

  @override
  State<visitor> createState() => _visitorState();
}

class _visitorState extends State<visitor> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visitor',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}