import 'dart:io';
import 'package:flutter/material.dart';

class subuser extends StatefulWidget {
  const subuser({Key? key}) : super(key: key);

  @override
  State<subuser> createState() => _subuserState();
}

class _subuserState extends State<subuser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub-User Accounts',style: TextStyle(fontWeight: FontWeight.w300),),
        actions: [
          CircleAvatar(
            backgroundColor: Colors.red,
            child: FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {},
              child: const Text('SOS',style: TextStyle(color: Colors.white,fontSize: 13),)
            ),
          ),
          const SizedBox(width: 10)
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "No sub-user account found",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 66, 72, 82),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}