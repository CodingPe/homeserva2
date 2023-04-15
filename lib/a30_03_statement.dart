
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
          actions: [
            GestureDetector(
              onTap: (){},
              child: const Icon(Icons.file_download_outlined,color: Colors.black,),
            ),
            const SizedBox(width: 15),
          ],
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
                      child: Text('In\nRM0.00',textAlign: TextAlign.center,),
                    ),
                    Tab(
                      child: Text('Out\nRM3213.90',textAlign: TextAlign.center,),
                    ),
                    Tab(
                      child: Text('Balance\nRM3213.90',textAlign: TextAlign.center,),
                    ),
                  ],
                ),
                Container(
                  height: 0.7,
                  color: Colors.black,
                )
              ],
            ),
          )
        ),
        body: const TabBarView(
          physics: NeverScrollableScrollPhysics(),
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