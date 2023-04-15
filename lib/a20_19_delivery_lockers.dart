import 'package:flutter/material.dart';

class DeliveryLockers extends StatefulWidget {
  const DeliveryLockers({Key? key}) : super(key: key);

  @override
  State<DeliveryLockers> createState() => _DeliveryLockersState();
}

class _DeliveryLockersState extends State<DeliveryLockers> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palazzo @ Ipoh Garden East',style: TextStyle(fontWeight: FontWeight.bold)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 0.7,
          ),
        ),
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