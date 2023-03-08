import 'dart:io';
import 'package:flutter/material.dart';

class managementaccount extends StatefulWidget {
  const managementaccount({Key? key}) : super(key: key);

  @override
  State<managementaccount> createState() => _managementaccountState();
}

class _managementaccountState extends State<managementaccount> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Management Account',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}