import 'dart:io';
import 'package:flutter/material.dart';

class facilitybookings extends StatefulWidget {
  const facilitybookings({Key? key}) : super(key: key);

  @override
  State<facilitybookings> createState() => _facilitybookingsState();
}

class _facilitybookingsState extends State<facilitybookings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Facility Bookings',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}