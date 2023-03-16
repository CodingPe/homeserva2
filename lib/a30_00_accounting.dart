import 'package:flutter/material.dart';

class Accounting extends StatelessWidget {
  const Accounting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Accounting"),
          actions: [
            SizedBox(
              width: 35,
              height: 35,
              child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: FloatingActionButton(
                      backgroundColor: Colors.red,
                      onPressed: () {},
                      child: const Text('SOS',
                          style:
                          TextStyle(color: Colors.white, fontSize: 11)
                      )
                  )
              ),
            ),
            const SizedBox(width: 10)
          ]
      ),
      body: const Center(
        child: Text("Accounting"),
      ),
    );
  }
}
