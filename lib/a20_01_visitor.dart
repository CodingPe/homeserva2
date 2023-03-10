import 'package:flutter/material.dart';

class Visitor extends StatefulWidget {
  const Visitor({Key? key}) : super(key: key);

  @override
  State<Visitor> createState() => _VisitorState();
}

class _VisitorState extends State<Visitor> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Visitor',style: TextStyle(fontWeight: FontWeight.w300),),
            bottom: const TabBar(
              indicatorColor: Colors.black,
              indicatorWeight: 5,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Registrations',
                ),
                Tab(
                  text: 'Checked-In',
                ),
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.black))
            ],
          ),
          body: Column(
            children: [
              const Text('Visitors')
            ],
          )
      )
  );
}