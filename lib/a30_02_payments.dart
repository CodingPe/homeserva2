
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
                      child: Text('Pending Verification\nRM0.00',textAlign: TextAlign.center),
                    ),
                    Tab(
                      child: Text('Verified',textAlign: TextAlign.center),
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