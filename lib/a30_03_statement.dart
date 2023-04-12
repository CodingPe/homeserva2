
import 'package:flutter/material.dart';

class Statement extends StatefulWidget {
  const Statement({Key? key}) : super(key: key);

  @override
  State<Statement> createState() => _StatementState();
}

class _StatementState extends State<Statement> {

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
          title: const Text('Statement',style: TextStyle(fontWeight: FontWeight.bold),),
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
              Tab(
                text: 'Balance',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Center(
              child: Text('In'),
            ),
            Center(
              child: Text('Out'),
            ),
            Center(
              child: Text('Balance'),
            ),
          ],
        ),
      )
  );
}