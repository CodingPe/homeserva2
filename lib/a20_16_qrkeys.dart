import 'package:flutter/material.dart';

class QRKeys extends StatefulWidget {
  const QRKeys({Key? key}) : super(key: key);

  @override
  State<QRKeys> createState() => _QRKeysState();
}

class _QRKeysState extends State<QRKeys> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              title: const Text('QR-Keys',style: TextStyle(fontWeight: FontWeight.w300),),
              bottom: const TabBar(
                indicatorColor: Color.fromARGB(255, 2, 122, 252),
                indicatorWeight: 2,
                labelColor: Color.fromARGB(255, 2, 122, 252),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Pending',
                  ),
                  Tab(
                    text: 'Active',
                  ),
                  Tab(
                    text: 'Inactive',
                  ),
                ],
              )

          ),
          body: Column(
            children: [

            ],
          )
      )
  );
}