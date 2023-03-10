import 'package:flutter/material.dart';

class TenantAccounts extends StatefulWidget {
  const TenantAccounts({Key? key}) : super(key: key);

  @override
  State<TenantAccounts> createState() => _TenantAccountsState();
}

class _TenantAccountsState extends State<TenantAccounts> {
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