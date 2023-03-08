import 'dart:io';
import 'package:flutter/material.dart';

class meetingminutes extends StatefulWidget {
  const meetingminutes({Key? key}) : super(key: key);

  @override
  State<meetingminutes> createState() => _meetingminutesState();
}

class _meetingminutesState extends State<meetingminutes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Minutes',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}