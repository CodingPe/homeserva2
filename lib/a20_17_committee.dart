import 'dart:io';
import 'package:flutter/material.dart';

class committee extends StatefulWidget {
  const committee({Key? key}) : super(key: key);

  @override
  State<committee> createState() => _committeeState();
}

class _committeeState extends State<committee> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Committee',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}