import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Visitor extends StatefulWidget {
  const Visitor({Key? key}) : super(key: key);

  @override
  State<Visitor> createState() => _VisitorState();
}

class _VisitorState extends State<Visitor> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TextEditingController name = TextEditingController();
  TextEditingController nRIC = TextEditingController();
  TextEditingController passport = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController whatsapp = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController vehiclePlate = TextEditingController();
  final List<String> parkingLot = <String>[
    'None',
    'Visitor Parking',
    'A-Level G-100',
  ];
  final List<String> type = <String>[
    '--Select--',
    'Family',
    'Contractor',
    'Food Delivery',
    'Parcel Delivery',
    'Teacher',
    'School Bus',
    'Public Transport',
    'Mover',
    'Property Agent',
    'Long Term',
    'Delivery Lorry'
  ];
  final List<String> validity = <String>[
    '--Select--',
    '15 mins',
    '30 Mins',
    '1 hour',
    '2 hour',
    '3 hour',
    'Until end-time of today',
    'Until end-time of tomorrow',
    'Until end of the day',
    'Until end of tomorrow',
    'Long Term (custom start and end date-time'
  ];
  final List<String> times = List.generate(288, (index) {
    final hour = index ~/ 12;
    final minute = (index % 12) * 5;
    final time = TimeOfDay(hour: hour, minute: minute);
    final formattedTime = DateFormat.jm().format(DateTime(2000, 1, 1, time.hour, time.minute));
    return formattedTime;
  });
  TextEditingController remark = TextEditingController();

  String? selectedParkingLot;
  String? selectedType;
  String? selectedValidity;
  String? selectedTimes;
  String property = 'D-5-19';

Future getVisitorsData() async {
  var url = 'https://peterapi.vyrox.com/viewvisitorsdata.php';
  var response = await http.get(Uri.parse(url));
  return json.decode(response.body);
}

Future<void> _addVisitor() async {
  const url = 'https://peterapi.vyrox.com/addvisitors.php';
  try {
    final response = await http.post(Uri.parse(url), body: {
      'property': property,
      'date': selectedDate!,
      'name': name.text,
      'nRIC': nRIC.text,
      'passport': passport.text,
      'mobilePhone': phone.text,
      'email': email.text,
      'vehiclePlate': vehiclePlate.text,
      'parkingLot': selectedParkingLot!,
      'type': selectedType!,
      'validity': selectedValidity!,
      'validFrom': selectedTimes!,
      'remark': remark.text,
    });
    if (response.statusCode == 200) {
      name.clear();
      nRIC.clear();
    } else {
      throw Exception('Failed to add visitor');
    }
  } catch (e) {
    print('Error adding visitor: $e');
  }
}

void showAddVisitorDialog() {
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
                          children: [
                            const Center(
                              child: Text("New Visitor",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
                            ),
                            const SizedBox(height: 7),
                            const Text('Property No.',style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 5),
                            const Text('D-5-19',style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 7),
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 650,
                              width: 320,
                              color: const Color.fromARGB(255, 248, 248, 248),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 10),
                                  const Text("Appointment Date",style: TextStyle(fontSize: 14)),
                                  const SizedBox(height: 2),
                                  GestureDetector(
                                      onTap: () async {
                                        DateTime? pickedDate = await showDatePicker(
                                          context: context,
                                          initialDate: selectedDate,
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2028),
                                        );
                                        if (pickedDate != null && pickedDate != selectedDate)
                                          setState(() {
                                            selectedDate = pickedDate;
                                          });
                                      },
                                      child: Container(
                                          width: 300,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            border: Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.white, // set background color to white
                                          ),
                                          child: Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              '  ${DateFormat('d MMMM yyyy').format(selectedDate)}',
                                              style: const TextStyle(fontSize: 16,color: Colors.black), // format date as "day month year"
                                            ),
                                          )
                                      ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text("Visitor Name",style: TextStyle(fontSize: 14)),
                                  const SizedBox(height: 2),
                                  Container(
                                      width: 300,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: TextFormField(
                                          controller: name,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixIcon: name.text.isNotEmpty
                                                ? IconButton(
                                              icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                              onPressed: () {
                                                setState(() {
                                                  name.clear();
                                                });
                                              },
                                            )
                                                : null,
                                          ),
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              const Text("NRIC",style: TextStyle(fontSize: 14)),
                                              const SizedBox(height: 2),
                                              Container(
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.grey),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 5),
                                                  child: TextFormField(
                                                  controller: nRIC,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    suffixIcon: nRIC.text.isNotEmpty
                                                        ? IconButton(
                                                      icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                      onPressed: () {
                                                        setState(() {
                                                          nRIC.clear();
                                                        });
                                                      },
                                                    )
                                                        : null,
                                                  ),
                                                  onChanged: (value) {
                                                    setState(() {});
                                                  },
                                                ),),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container()),
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              const Text("Passport No.",style: TextStyle(fontSize: 14)),
                                              const SizedBox(height: 2),
                                              Container(
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.grey),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 5),
                                                  child: TextFormField(
                                                    controller: passport,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      suffixIcon: passport.text.isNotEmpty
                                                          ? IconButton(
                                                        icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                        onPressed: () {
                                                          setState(() {
                                                            passport.clear();
                                                          });
                                                        },
                                                      )
                                                          : null,
                                                    ),
                                                    onChanged: (value) {
                                                      setState(() {});
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              const Text("Mobile Phone No.",style: TextStyle(fontSize: 14)),
                                              const SizedBox(height: 2),
                                              Container(
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.grey),
                                                ),
                                                child: Padding(
                                                    padding: const EdgeInsets.only(left: 5),
                                                    child: TextFormField(
                                                      controller: phone,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        suffixIcon: phone.text.isNotEmpty
                                                            ? IconButton(
                                                          icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                          onPressed: () {
                                                            setState(() {
                                                              phone.clear();
                                                            });
                                                          },
                                                        )
                                                            : null,
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {});
                                                      },
                                                    ),
                                                )
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container()),
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              const Text("WhatsApp",style: TextStyle(fontSize: 14)),
                                              const SizedBox(height: 2),
                                              Container(
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.grey),
                                                ),
                                                child: Padding(
                                                    padding: const EdgeInsets.only(left: 5),
                                                    child: TextFormField(
                                                      controller: whatsapp,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        suffixIcon: whatsapp.text.isNotEmpty
                                                            ? IconButton(
                                                          icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                          onPressed: () {
                                                            setState(() {
                                                              whatsapp.clear();
                                                            });
                                                          },
                                                        )
                                                            : null,
                                                      ),
                                                      onChanged: (value) {
                                                        setState(() {});
                                                      },
                                                    ),),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  const Text("Email Address",style: TextStyle(fontSize: 14)),
                                  const SizedBox(height: 2),
                                  Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: TextFormField(
                                          controller: email,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            suffixIcon: email.text.isNotEmpty
                                                ? IconButton(
                                              icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                              onPressed: () {
                                                setState(() {
                                                  email.clear();
                                                });
                                              },
                                            )
                                                : null,
                                          ),
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                        ),
                                    )
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              const Text("Vehicle Plate No.",style: TextStyle(fontSize: 14)),
                                              const SizedBox(height: 2),
                                              Container(
                                                width: 300,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.grey),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.only(left: 5),
                                                  child: TextFormField(
                                                    controller: vehiclePlate,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      suffixIcon: vehiclePlate.text.isNotEmpty
                                                          ? IconButton(
                                                        icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                        onPressed: () {
                                                          setState(() {
                                                            vehiclePlate.clear();
                                                          });
                                                        },
                                                      )
                                                          : null,
                                                    ),
                                                    onChanged: (value) {
                                                      setState(() {});
                                                    },
                                                  ),
                                                )
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container()),
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              const Text("Parking Lot",style: TextStyle(fontSize: 14)),
                                              const SizedBox(height: 2),
                                              Container(
                                                width: 250,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.grey),
                                                ),
                                                child: DropdownButtonFormField(
                                                  decoration: const InputDecoration(
                                                      border: InputBorder.none,
                                                  ),
                                                  isExpanded: true,
                                                  value: parkingLot.first,
                                                  items: parkingLot.map((value) => DropdownMenuItem(
                                                    value: value,
                                                    child: Text('   $value',),
                                                  )).toList(),
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedParkingLot = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              const Text("Visitor Type",style: TextStyle(fontSize: 14)),
                                              const SizedBox(height: 2),
                                              Container(
                                                  width: 250,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(5),
                                                    border: Border.all(color: Colors.grey),
                                                  ),
                                                  child: DropdownButtonFormField(
                                                    decoration: const InputDecoration(
                                                        border: InputBorder.none,
                                                    ),
                                                    isExpanded: true,
                                                    value: type.first,
                                                    items: type.map((value) => DropdownMenuItem(
                                                      value: value,
                                                      child: Text('   $value',),
                                                    )).toList(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        selectedType = value;
                                                      });
                                                    },
                                                  ),
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container()),
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              const Text("Visitor Pass Validity",style: TextStyle(fontSize: 14)),
                                              const SizedBox(height: 2),
                                              Container(
                                                width: 250,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.grey),
                                                ),
                                                child: DropdownButtonFormField(
                                                  decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  isExpanded: true,
                                                  value: validity.first,
                                                  items: validity.map((value) => DropdownMenuItem(
                                                    value: value,
                                                    child: Text('   $value',),
                                                  )).toList(),
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedValidity = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children:  [
                                              const Text("Valid From",style: TextStyle(fontSize: 14)),
                                              const SizedBox(height: 2),
                                              Container(
                                                width: 250,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(5),
                                                  border: Border.all(color: Colors.grey),
                                                ),
                                                child: DropdownButtonFormField<String>(
                                                  decoration: const InputDecoration(
                                                    border: InputBorder.none,
                                                  ),
                                                  isExpanded: true,
                                                  value: selectedTimes,
                                                  items: times.map((time) => DropdownMenuItem(value: time, child: Text('  $time'))).toList(),
                                                  onChanged: (value) => setState(() => selectedTimes = value),
                                                )
                                              ),
                                            ],
                                          )),
                                      Expanded(
                                          flex: 1,
                                          child: Container()),
                                      Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: const [

                                            ],
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 17),
                            const Text('QR Key',style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 7),
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 150,
                              width: 320,
                              color: const Color.fromARGB(255, 248, 248, 248),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [

                                ],
                              ),
                            ),
                            const SizedBox(height: 17),
                            const Text('Remark',style: TextStyle(fontSize: 14)),
                            const SizedBox(height: 7),
                            Container(
                              padding: const EdgeInsets.all(10),
                              height: 70,
                              width: 320,
                              color: const Color.fromARGB(255, 248, 248, 248),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 300,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(color: Colors.grey),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: TextFormField(
                                        controller: remark,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          suffixIcon: remark.text.isNotEmpty
                                              ? IconButton(
                                            icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                            onPressed: () {
                                              setState(() {
                                                remark.clear();
                                              });
                                            },
                                          )
                                              : null,
                                        ),
                                        onChanged: (value) {
                                          setState(() {});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          TextButton(
                        onPressed: (){
                          _addVisitor;
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          primary: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                           child: const Text(
                            'Add',
                            style: TextStyle(fontSize: 16),
                         ),
                       )
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
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Visitor',style: TextStyle(fontWeight: FontWeight.w300),),
            bottom: const TabBar(
              indicatorColor: Colors.black,
              indicatorWeight: 5,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              tabs: [
                Tab(
                  text: 'Registrations',
                ),
                Tab(
                  text: 'Checked-In',
                ),
              ],
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search, color: Colors.black),),
              IconButton(onPressed: showAddVisitorDialog, icon: const Icon(Icons.add,color: Colors.black,))
            ],
          ),
          body: TabBarView(
            children: [
              Scrollbar(
                child: FutureBuilder(
                  future: getVisitorsData(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) print(snapshot.error);
                    return snapshot.hasData
                        ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List list = snapshot.data;
                          return Padding(
                              padding: const EdgeInsets.all(20),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Row(children: [
                                    ClipRRect(
                                        borderRadius:
                                        BorderRadius.circular(12.0),
                                        child: Image.network(
                                            list[index]['Photo'],
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.cover)),
                                    const SizedBox(width: 16),
                                    Expanded(
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                list[index]['Name'],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20),
                                              ),
                                              const SizedBox(height: 10),
                                              Text(
                                                list[index]['Phone'],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    color: Color.fromARGB(
                                                        255, 66, 72, 82),
                                                    fontSize: 13),
                                              ),
                                              Text(
                                                list[index]['ValidFrom'],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w200,
                                                    color: Color.fromARGB(
                                                        255, 66, 72, 82),
                                                    fontSize: 13),
                                              )
                                            ]))
                                  ])));
                        })
                        : const Center(
                      child: Text(
                        "No visitor yet",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 66, 72, 82),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Center(
                child: Text('Testing'),
              )
            ],
          ),
      )
  );
}