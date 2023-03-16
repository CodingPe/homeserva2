import 'package:flutter/material.dart';

class SubUser extends StatefulWidget {
  const SubUser({Key? key}) : super(key: key);

  @override
  State<SubUser> createState() => _SubUserState();
}

class _SubUserState extends State<SubUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub-User Accounts',style: TextStyle(fontWeight: FontWeight.w300),),
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
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: const Text(
                "No sub-user account found",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Color.fromARGB(255, 66, 72, 82),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}