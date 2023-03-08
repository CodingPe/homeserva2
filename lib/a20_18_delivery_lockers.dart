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
        title: const Text('Palazzo @ Ipoh Garden East',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "No delivery found",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 66, 72, 82),
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}