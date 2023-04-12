
import 'package:flutter/material.dart';

class Deposits extends StatefulWidget {
  const Deposits({Key? key}) : super(key: key);

  @override
  State<Deposits> createState() => _DepositsState();
}

class _DepositsState extends State<Deposits> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Deposits',style: TextStyle(fontWeight: FontWeight.bold),),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 2, 122, 252),
            indicatorWeight: 3,
            labelColor: Color.fromARGB(255, 2, 122, 252),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: 'Pending',
              ),
              Tab(
                text: 'Paid',
              ),
              Tab(
                text: 'Refunding',
              ),
              Tab(
                text: 'Refunded',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Pending'),
            ),
            Center(
              child: Text('Paid'),
            ),
            Center(
              child: Text('Refunding'),
            ),
            Center(
              child: Text('Refunded'),
            ),
          ],
        ),
      )
  );
}