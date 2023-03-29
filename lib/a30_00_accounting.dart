import 'package:flutter/material.dart';

class Accounting extends StatelessWidget {
  const Accounting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Accounting',style: TextStyle(fontWeight: FontWeight.w300),),
          bottom: const TabBar(
            indicatorColor: Colors.black,
            indicatorWeight: 5,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: 'Documents',
              ),
              Tab(
                text: 'Overview',
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
        body: TabBarView(
          children: [
            Column(
              children: [
                const SizedBox(height: 15),
                GridView.count(
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const BouncingScrollPhysics(),
                    crossAxisSpacing: 20,
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    children: [
                      _buildGridViewItem('Invoices',
                          onTap: () => (){}),
                      _buildGridViewItem('Payments',
                          onTap: () => (){}),
                      _buildGridViewItem('Statement',
                          onTap: () => (){}),
                      _buildGridViewItem('Deposits',
                          onTap: () => (){}),
                      _buildGridViewItem('Advances',
                          onTap: () => (){}),
                    ])
              ],
            ),
            const Center(
              child: Text('Overview'),
            )
          ],
        ),
      )
  );
}

Widget _buildGridViewItem(String label,
    {required VoidCallback onTap}) {
  return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            color: Colors.white,
          ),
          child: Center(
            child: Text(
                label,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.center),
          ),
        ),
      ]
      )
  );
}
