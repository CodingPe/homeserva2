import 'dart:io';
import 'package:flutter/material.dart';

class homeservicesapplications extends StatefulWidget {
  const homeservicesapplications({Key? key}) : super(key: key);

  @override
  State<homeservicesapplications> createState() => _homeservicesapplicationsState();
}

class _homeservicesapplicationsState extends State<homeservicesapplications> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Services Applications',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}