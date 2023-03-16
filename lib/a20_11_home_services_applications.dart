import 'package:flutter/material.dart';

class HomeServicesApplications extends StatefulWidget {
  const HomeServicesApplications({Key? key}) : super(key: key);

  @override
  State<HomeServicesApplications> createState() => _HomeServicesApplicationsState();
}

class _HomeServicesApplicationsState extends State<HomeServicesApplications> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Services Applications',style: TextStyle(fontWeight: FontWeight.w300,fontSize: 18),),
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
                "No application found",
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