import 'package:flutter/material.dart';

class AccessCards extends StatefulWidget {
  const AccessCards({Key? key}) : super(key: key);

  @override
  State<AccessCards> createState() => _AccessCardsState();
}

class _AccessCardsState extends State<AccessCards> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Access Cards',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}