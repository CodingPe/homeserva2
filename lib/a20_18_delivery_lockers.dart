import 'dart:io';
import 'package:flutter/material.dart';

class deliverylockers extends StatefulWidget {
  const deliverylockers({Key? key}) : super(key: key);

  @override
  State<deliverylockers> createState() => _deliverylockersState();
}

class _deliverylockersState extends State<deliverylockers> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delivery Lockers',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}