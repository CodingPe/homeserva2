
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
                      child: Text('Pending\nRM0.00',textAlign: TextAlign.center,),
                    ),
                    Tab(
                      child: Text('Paid\nRM0.00',textAlign: TextAlign.center,),
                    ),
                    Tab(
                      child: Text('Refunding',textAlign: TextAlign.center,),
                    ),
                    Tab(
                      child: Text('Refunded',textAlign: TextAlign.center,),
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