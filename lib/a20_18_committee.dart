import 'package:flutter/material.dart';

class Committee extends StatefulWidget {
  const Committee({Key? key}) : super(key: key);

  @override
  State<Committee> createState() => _CommitteeState();
}

class _CommitteeState extends State<Committee> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Committee',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}