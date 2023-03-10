import 'package:flutter/material.dart';

class Laundry extends StatefulWidget {
  const Laundry({Key? key}) : super(key: key);

  @override
  State<Laundry> createState() => _LaundryState();
}

class _LaundryState extends State<Laundry> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Laundry',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        bottom: const TabBar(
          indicatorColor: Colors.black,
          indicatorWeight: 5,
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          tabs: [
            Tab(
              text: 'Availability',
            ),
            Tab(
              text: 'Running',
            ),
            Tab(
              text: 'Ended',
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add, color: Colors.black))
        ],
      ),
      body: TabBarView(
        children: [
          Column(
            children: [
              ListTile(
                leading: const Image(
                  image: AssetImage('assets/icons/laundry.png'),
                ),
                title: const Text(
                  'Washer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: const Text(
                  'LG1',
                  style: TextStyle(fontSize: 14),
                ),
                trailing: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'RM 1.00 / Minute\n',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Available',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                onTap: () {
                  // Handle tile tap
                },
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage('assets/icons/laundry.png'),
                ),
                title: const Text(
                  'Dryer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: const Text(
                  'Level 27',
                  style: TextStyle(fontSize: 14),
                ),
                trailing: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'RM 10.00 / Hour\n',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Available',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                onTap: () {
                  // Handle tile tap
                },
              ),
            ],
          ),
          const Center(
            child: Text('Running'),
          ),
          const Center(
            child: Text('Ended'),
          ),
        ],
      ),
    ),
  );
}