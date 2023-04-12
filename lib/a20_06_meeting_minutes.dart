import 'package:flutter/material.dart';

class MeetingMinutes extends StatefulWidget {
  const MeetingMinutes({Key? key}) : super(key: key);

  @override
  State<MeetingMinutes> createState() => _MeetingMinutesState();
}

class _MeetingMinutesState extends State<MeetingMinutes> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meeting Minutes',style: TextStyle(fontWeight: FontWeight.bold),),
      ),
    );
  }
}