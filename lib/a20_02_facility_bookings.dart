import 'package:flutter/material.dart';

class FacilityBookings extends StatefulWidget {
  const FacilityBookings({Key? key}) : super(key: key);

  @override
  State<FacilityBookings> createState() => _FacilityBookingsState();
}

class _FacilityBookingsState extends State<FacilityBookings> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Facility Bookings',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
