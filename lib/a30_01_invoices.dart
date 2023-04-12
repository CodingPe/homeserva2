
import 'package:flutter/material.dart';

class Invoices extends StatefulWidget {
  const Invoices({Key? key}) : super(key: key);

  @override
  State<Invoices> createState() => _InvoicesState();
}

class _InvoicesState extends State<Invoices> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Invoices',style: TextStyle(fontWeight: FontWeight.bold),),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 2, 122, 252),
            indicatorWeight: 3,
            labelColor: Color.fromARGB(255, 2, 122, 252),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: 'Outstanding',
              ),
              Tab(
                text: 'Overdue',
              ),
              Tab(
                text: 'Fully Paid',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Outstanding'),
            ),
            Center(
              child: Text('Overdue'),
            ),
            Center(
              child: Text('Fully Paid'),
            ),
          ],
        ),
      )
  );

}