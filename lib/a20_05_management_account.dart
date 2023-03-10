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
        title: const Text('Management Account',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}