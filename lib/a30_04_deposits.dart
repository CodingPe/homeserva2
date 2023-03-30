
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
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Deposits',style: TextStyle(fontWeight: FontWeight.w300),),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 5,
            labelColor: Colors.black,
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