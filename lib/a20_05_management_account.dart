import 'package:flutter/material.dart';

class ManagementAccount extends StatefulWidget {
  const ManagementAccount({Key? key}) : super(key: key);

  @override
  State<ManagementAccount> createState() => _ManagementAccountState();
}

class _ManagementAccountState extends State<ManagementAccount> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Management Account',style: TextStyle(fontWeight: FontWeight.bold),),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 0.7,
          ),
        ),
      ),
    );
  }
}