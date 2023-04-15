
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
          title: const Text(
            'Invoices',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Column(
              children: [
                const TabBar(
                  indicatorColor: Color.fromARGB(255, 2, 122, 252),
                  indicatorWeight: 3,
                  labelColor: Color.fromARGB(255, 2, 122, 252),
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      child: Text('Outstanding\nRM 0.00',textAlign: TextAlign.center,),
                    ),
                    Tab(
                      child: Text('Overdue\nRM 0.00',textAlign: TextAlign.center,),
                    ),
                    Tab(
                      child: Text('Fully Paid'),
                    ),
                  ],
                ),
                Container(
                  height: 0.7,
                  color: Colors.black,
                )
              ],
            ),
          ),
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
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