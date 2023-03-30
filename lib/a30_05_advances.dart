
import 'package:flutter/material.dart';

class Advances extends StatefulWidget {
  const Advances({Key? key}) : super(key: key);

  @override
  State<Advances> createState() => _AdvancesState();
}

class _AdvancesState extends State<Advances> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Advances',style: TextStyle(fontWeight: FontWeight.w300),),
      ),
      body: const Center(
        child: Text('Advances'),
      ),
    );
  }
}