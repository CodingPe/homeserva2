import 'dart:io';
import 'package:flutter/material.dart';

class visitor extends StatefulWidget {
  const visitor({Key? key}) : super(key: key);

  @override
  State<visitor> createState() => _visitorState();
}

class _visitorState extends State<visitor> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Visitor',style: TextStyle(fontWeight: FontWeight.w300),),
            bottom: const TabBar(
              indicatorColor: Colors.black,
              indicatorWeight: 5,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Registrations',
                ),
                Tab(
                  text: 'Checked-In',
                ),
              ],
            )

          ),
          body: Column(
            children: [

            ],
          )
      )
  );
}