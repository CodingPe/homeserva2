import 'dart:io';
import 'package:flutter/material.dart';

class conciergeservices extends StatefulWidget {
  const conciergeservices({Key? key}) : super(key: key);

  @override
  State<conciergeservices> createState() => _conciergeservicesState();
}

class _conciergeservicesState extends State<conciergeservices> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Concierge Services',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}