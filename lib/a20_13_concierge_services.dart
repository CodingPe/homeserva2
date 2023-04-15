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
        title: const Text('Concierge Services',style: TextStyle(fontWeight: FontWeight.bold),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 0.7,
          ),
        ),
      ),
    );
  }
}