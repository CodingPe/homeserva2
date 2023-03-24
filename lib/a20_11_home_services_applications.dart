import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:group_button/group_button.dart';

class HomeServicesApplications extends StatefulWidget {
  const HomeServicesApplications({Key? key}) : super(key: key);

  @override
  State<HomeServicesApplications> createState() => _HomeServicesApplicationsState();
}

class _HomeServicesApplicationsState extends State<HomeServicesApplications> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedStartDate = DateTime.now();
  DateTime selectedEndDate = DateTime.now();
  TextEditingController companyName = TextEditingController();
  TextEditingController workerName = TextEditingController();
  TextEditingController workerPhone = TextEditingController();
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController remark = TextEditingController();
  final List<String> service = <String>[
    'Move-In',
    'Move-Out',
    'Repair/Maintenance',
    'Minor Renovation',
    'Major Renovation',
    'Installation',
    'Disassembly/Dismantling',
    'Other',
  ];

  List<String> space = ['Item 1', 'Item 2', 'Item 3'];
  List<bool> selected = [false, false, false];

  String? selectedSpace;
  String? selectedService;
  String property = 'D-5-19';

  void showAddHomeServicesApplicationsDialog() {
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
                                  child: Text("New Application",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
                                ),
                                const SizedBox(height: 7),
                                const Text('Property No.',style: TextStyle(fontSize: 14)),
                                const SizedBox(height: 5),
                                const Text('D-5-19',style: TextStyle(fontSize: 16)),
                                const SizedBox(height: 7),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    const Text("Space Involved",style: TextStyle(fontSize: 14)),
                                    const SizedBox(height: 2),
                                    const SizedBox(height: 10),
                                    const Text("Service",style: TextStyle(fontSize: 14)),
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
                                        value: service.first,
                                        items: service.map((value) => DropdownMenuItem(
                                          value: value,
                                          child: Text('   $value',),
                                        )).toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedService = value;
                                          });
                                        },
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
                                                const Text("Start Date",style: TextStyle(fontSize: 14)),
                                                const SizedBox(height: 2),
                                                GestureDetector(
                                                  onTap: () async {
                                                    DateTime? pickedDate = await showDatePicker(
                                                      context: context,
                                                      initialDate: selectedStartDate,
                                                      firstDate: DateTime.now(),
                                                      lastDate: DateTime(2028),
                                                    );
                                                    if (pickedDate != null && pickedDate != selectedStartDate)
                                                      setState(() {
                                                        selectedStartDate = pickedDate;
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
                                                          '  ${DateFormat('d MMMM yyyy').format(selectedStartDate)}',
                                                          style: const TextStyle(fontSize: 16,color: Colors.black), // format date as "day month year"
                                                        ),
                                                      )
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
                                                const Text("End Date",style: TextStyle(fontSize: 14)),
                                                const SizedBox(height: 2),
                                                GestureDetector(
                                                  onTap: () async {
                                                    DateTime? pickedDate = await showDatePicker(
                                                      context: context,
                                                      initialDate: selectedEndDate,
                                                      firstDate: DateTime.now(),
                                                      lastDate: DateTime(2028),
                                                    );
                                                    if (pickedDate != null && pickedDate != selectedEndDate)
                                                      setState(() {
                                                        selectedEndDate = pickedDate;
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
                                                          '  ${DateFormat('d MMMM yyyy').format(selectedEndDate)}',
                                                          style: const TextStyle(fontSize: 16,color: Colors.black), // format date as "day month year"
                                                        ),
                                                      )
                                                  ),
                                                ),
                                              ],
                                            ))
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Service Company Name",style: TextStyle(fontSize: 14)),
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
                                            controller: companyName,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixIcon: companyName.text.isNotEmpty
                                                  ? IconButton(
                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                onPressed: () {
                                                  setState(() {
                                                    companyName.clear();
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
                                    const Text("Worker-In-Charge Name",style: TextStyle(fontSize: 14)),
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
                                            controller: workerName,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixIcon: workerName.text.isNotEmpty
                                                  ? IconButton(
                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                onPressed: () {
                                                  setState(() {
                                                    workerName.clear();
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
                                                const Text("Worker-In-Charge Mobile No",style: TextStyle(fontSize: 14)),
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
                                                        controller: workerPhone,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          suffixIcon: workerPhone.text.isNotEmpty
                                                              ? IconButton(
                                                            icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                            onPressed: () {
                                                              setState(() {
                                                                workerPhone.clear();
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
                                                const Text("Vehicle Number",style: TextStyle(fontSize: 14)),
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
                                                        controller: vehicleNumber,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          suffixIcon: vehicleNumber.text.isNotEmpty
                                                              ? IconButton(
                                                            icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                            onPressed: () {
                                                              setState(() {
                                                                vehicleNumber.clear();
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
                                            ))
                                      ],
                                    ),
                                    const SizedBox(height: 10),
                                    const Text("Service Company Name",style: TextStyle(fontSize: 14)),
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
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20),
                                TextButton(
                                  onPressed: (){
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Contractor Service Applications',style: TextStyle(fontWeight: FontWeight.w300),),
          actions: [
            IconButton(onPressed: showAddHomeServicesApplicationsDialog, icon: const Icon(Icons.add)),
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
          children: const [

          ],
        ),
      ),
    );
  }
}