import 'dart:io';
import 'package:flutter/material.dart';

class tenantaccounts extends StatefulWidget {
  const tenantaccounts({Key? key}) : super(key: key);

  @override
  State<tenantaccounts> createState() => _tenantaccountsState();
}

class _tenantaccountsState extends State<tenantaccounts> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tenant Accounts',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
    );
  }
}