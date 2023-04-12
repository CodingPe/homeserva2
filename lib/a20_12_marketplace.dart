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
          style: TextStyle(fontWeight: FontWeight.bold),
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
          IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.black))
        ],
      ),
      body: const TabBarView(
        children: [
           Center(
            child: Text('Items'),
          ),
           Center(
            child: Text('Foods'),
          ),
           Center(
            child: Text('Services'),
          ),
           Center(
            child: Text('Others'),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: () {},
          child: const SizedBox(
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text(
                'New New Listing',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}