import 'package:flutter/material.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({Key? key}) : super(key: key);

  @override
  State<Marketplace> createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
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
          indicatorColor: Color.fromARGB(255, 2, 122, 252),
          indicatorWeight: 3,
          labelColor: Color.fromARGB(255, 2, 122, 252),
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