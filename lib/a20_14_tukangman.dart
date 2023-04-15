import 'package:flutter/material.dart';

class TukangMan extends StatefulWidget {
  const TukangMan({Key? key}) : super(key: key);

  @override
  State<TukangMan> createState() => _TukangManState();
}

class _TukangManState extends State<TukangMan> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TukangMan',style: TextStyle(fontWeight: FontWeight.bold),),
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