import 'package:flutter/material.dart';

class EmergencyNumbers extends StatefulWidget {
  const EmergencyNumbers({Key? key}) : super(key: key);

  @override
  State<EmergencyNumbers> createState() => _EmergencyNumbersState();
}

class _EmergencyNumbersState extends State<EmergencyNumbers> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Numbers',style: TextStyle(fontWeight: FontWeight.w300),),
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
          ]
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blueGrey.shade200,
                      width: 1
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Expanded(
                      flex: 2,
                      child: Text('Ambulance'),
                    ),
                    TextButton(
                      onPressed: (){},
                      child:  const Text(
                        '999',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        '5.00 km',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(width: 10,)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.blueGrey.shade200,
                        width: 1
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Expanded(
                      flex: 2,
                      child: Text('Fire Fighter'),
                    ),
                    TextButton(
                      onPressed: (){},
                      child:  const Text(
                        '999',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        '5.00 km',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(width: 10,)
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        color: Colors.blueGrey.shade200,
                        width: 1
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Expanded(
                      flex: 2,
                      child: Text('Police'),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: const Text(
                        '999',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Text(
                        '5.00 km',
                        textAlign: TextAlign.right,
                      ),
                    ),
                    const SizedBox(width: 10,)
                  ],
                ),
              ),
            ),
            Expanded(
                flex: 15,
                child: Container())
          ],
        ),
      ),
    );
  }
}