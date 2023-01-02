import 'package:flutter/material.dart';

class Functions extends StatelessWidget {
  const Functions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Functions"),
      ),
      body: const Center(
        child: Text("Functions"),
      ),
    );
  }
}
