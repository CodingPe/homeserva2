import 'dart:io';
import 'package:flutter/material.dart';

class marketplace extends StatefulWidget {
  const marketplace({Key? key}) : super(key: key);

  @override
  State<marketplace> createState() => _marketplaceState();
}

class _marketplaceState extends State<marketplace> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 4,
    child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Marketplace',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        bottom: const TabBar(
          indicatorColor: Colors.black,
          indicatorWeight: 5,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              text: 'Items',
            ),
            Tab(
              text: 'Foods',
            ),
            Tab(
              text: 'Services',
            ),
            Tab(
              text: 'Others',
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.black))
        ],
      ),
      body: TabBarView(
        children: [
          const Center(
            child: Text('Items'),
          ),
          const Center(
            child: Text('Foods'),
          ),
          const Center(
            child: Text('Services'),
          ),
          const Center(
            child: Text('Others'),
          ),
        ],
      ),
    ),
  );
}