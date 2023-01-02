import 'package:flutter/material.dart';

class Accounting extends StatelessWidget {
  const Accounting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Accounting"),
      ),
      body: const Center(
        child: Text("Accounting"),
      ),
    );
  }
}
