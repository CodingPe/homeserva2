import 'dart:io';
import 'package:flutter/material.dart';

class qrkeys extends StatefulWidget {
  const qrkeys({Key? key}) : super(key: key);

  @override
  State<qrkeys> createState() => _qrkeysState();
}

class _qrkeysState extends State<qrkeys> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR-Keys',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}