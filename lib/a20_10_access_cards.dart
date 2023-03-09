import 'dart:io';
import 'package:flutter/material.dart';

class accesscards extends StatefulWidget {
  const accesscards({Key? key}) : super(key: key);

  @override
  State<accesscards> createState() => _accesscardsState();
}

class _accesscardsState extends State<accesscards> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Access Cards',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}