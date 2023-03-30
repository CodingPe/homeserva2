
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
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Invoices',style: TextStyle(fontWeight: FontWeight.w300),),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 5,
            labelColor: Colors.black,
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
          ],
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