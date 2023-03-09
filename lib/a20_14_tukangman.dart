import 'dart:io';
import 'package:flutter/material.dart';

class tukangman extends StatefulWidget {
  const tukangman({Key? key}) : super(key: key);

  @override
  State<tukangman> createState() => _tukangmanState();
}

class _tukangmanState extends State<tukangman> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TukangMan',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}