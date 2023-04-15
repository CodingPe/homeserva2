import 'package:flutter/material.dart';

class FacilityBookings extends StatefulWidget {
  const FacilityBookings({Key? key}) : super(key: key);

  @override
  State<FacilityBookings> createState() => _FacilityBookingsState();
}

class _FacilityBookingsState extends State<FacilityBookings> {
  final _formKey = GlobalKey<FormState>();

  void showAddNewBookingDialog() {
    showDialog(
        context: context,
        builder: (ctx) => StatefulBuilder(
            builder: (context,setState){
              return Center(
                child: Container(
                    constraints: const BoxConstraints(
                        minWidth: 500
                    ),
                    margin: const EdgeInsets.all(10),
                    child: Card(
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child:  Form(
                            key: _formKey,
                            child: ListView(
                              children: const [
                                Center(
                                  child: Text("New Booking",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
                                ),
                                SizedBox(height: 7),
                              ],
                            )
                        ),
                      ),
                    )
                ),
              );
            }
        )
    );
  }

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
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: Colors.black,
            height: 0.7,
          ),
        ),
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: () {
            showAddNewBookingDialog();
          },
          child: const SizedBox(
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text(
                'New Booking',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
