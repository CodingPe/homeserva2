import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ConciergeServices extends StatefulWidget {
  const ConciergeServices({Key? key}) : super(key: key);

  @override
  State<ConciergeServices> createState() => _ConciergeServicesState();
}

class _ConciergeServicesState extends State<ConciergeServices> {
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