import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key, String? a});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Dashboard"),
      ),
      body: const Center(
        child: Text("Dashboard"),
      ),
    );
  }
}
