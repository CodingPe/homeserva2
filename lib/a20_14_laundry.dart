import 'dart:io';
import 'package:flutter/material.dart';

class laundry extends StatefulWidget {
  const laundry({Key? key}) : super(key: key);

  @override
  State<laundry> createState() => _laundryState();
}

class _laundryState extends State<laundry> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laundry',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}