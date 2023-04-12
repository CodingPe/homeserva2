
import 'package:flutter/material.dart';

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {

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
          title: const Text('Payments',style: TextStyle(fontWeight: FontWeight.bold),),
          bottom: const TabBar(
            indicatorColor: Color.fromARGB(255, 2, 122, 252),
            indicatorWeight: 3,
            labelColor: Color.fromARGB(255, 2, 122, 252),
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: 'In',
              ),
              Tab(
                text: 'Out',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('Pending Verification'),
            ),
            Center(
              child: Text('Verified'),
            ),
          ],
        ),
      )
  );
}