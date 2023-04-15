import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AccessCards extends StatefulWidget {
  const AccessCards({Key? key}) : super(key: key);

  @override
  State<AccessCards> createState() => _AccessCardsState();
}

class _AccessCardsState extends State<AccessCards> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController ic = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String? _gender = 'male';
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  String? _relationship = 'family';
  TextEditingController carPlate = TextEditingController();
  bool _isEnable = false;
  TextEditingController remark = TextEditingController();

  final List<String> owner = <String>[
    '-- Select --',
  ];

  final List<String> apply = <String>[
    'Own use',
    'Someone else',
  ];

  final List<String> card = <String>[
    '-- Select --',
    'PARKING-ONLY ACCESS CARD',
    'LIFT-ONLY ACCESS CARD',
    'PARKING AND LIFT ACCESS CARD',
    'LIFT AND FACILITY ACCESS CARD',
    'PARKING,LIFT,AND FACILITY ACCESS CARD',
  ];

  final List<String> parkingBay = <String>[
    'No parking bay available',
  ];

  String? selectedOwner;
  String? selectedApply;
  String? selectedCard = '-- Select --';
  String? selectedParkingBay;

  void showAddNewAccessDialog() {
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
                            child: ScrollConfiguration(
                              behavior: const ScrollBehavior().copyWith(overscroll: false),
                              child: ListView(
                                children:  [
                                  const Center(
                                    child: Text("New Access Card",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
                                  ),
                                  const SizedBox(height: 15),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text("Owner",style: TextStyle(fontSize: 14)),
                                      const SizedBox(height: 2),
                                      Container(
                                        width: 300,
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
                                          value: owner.first,
                                          items: owner.map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Text('   $value',),
                                          )).toList(),
                                          onChanged: (String? value) {
                                            setState(() {
                                              selectedOwner = value;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text('Name'),
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
                                          ),),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text('IC/Passport No.'),
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
                                            controller: ic,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              suffixIcon: ic.text.isNotEmpty
                                                  ? IconButton(
                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                onPressed: () {
                                                  setState(() {
                                                    ic.clear();
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
                                      const SizedBox(height: 10),
                                      Row(
                                        children: [
                                          Expanded(
                                              flex: 4,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children:  [
                                                  const Text("Date of Birth",style: TextStyle(fontSize: 14)),
                                                  const SizedBox(height: 2),
                                                  GestureDetector(
                                                    onTap: () async {
                                                      DateTime? pickedDate = await showDatePicker(
                                                        context: context,
                                                        initialDate: selectedDate,
                                                        firstDate: DateTime(1900),
                                                        lastDate: DateTime(2028),
                                                      );
                                                      if (pickedDate != null && pickedDate != selectedDate)
                                                        setState(() {
                                                          selectedDate = pickedDate;
                                                        });
                                                    },
                                                    child: Container(
                                                        width: 300,
                                                        height: 50,
                                                        decoration: BoxDecoration(
                                                          border: Border.all(color: Colors.grey),
                                                          borderRadius: BorderRadius.circular(5),
                                                          color: Colors.white, // set background color to white
                                                        ),
                                                        child: Align(
                                                          alignment: Alignment.centerLeft,
                                                          child: Text(
                                                            '  ${DateFormat('d MMMM yyyy').format(selectedDate)}',
                                                            style: const TextStyle(fontSize: 12,color: Colors.black), // format date as "day month year"
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
                                              flex: 7,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children:  [
                                                  const Text("Gender",style: TextStyle(fontSize: 14)),
                                                  const SizedBox(height: 2),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 1,
                                                        child: RadioListTile(
                                                          contentPadding: const EdgeInsets.all(0),
                                                          title: const Text('Male',style: TextStyle(fontSize: 10)),
                                                          value: 'male',
                                                          groupValue: _gender,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _gender = value as String?;
                                                            });
                                                          },
                                                          dense: true, // add this line to make the RadioListTile smaller
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: RadioListTile(
                                                          contentPadding: const EdgeInsets.all(0),
                                                          title: const Text('Female',style: TextStyle(fontSize: 10)),
                                                          value: 'female',
                                                          groupValue: _gender,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _gender = value as String?;
                                                            });
                                                          },
                                                          dense: true, // add this line to make the RadioListTile smaller
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ))
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      const Text('Mobile Phone No.'),
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
                                          ),),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text('Email Address'),
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
                                          ),),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text('Relationship'),
                                      const SizedBox(height: 2),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: RadioListTile(
                                              contentPadding: const EdgeInsets.all(0),
                                              title: const Text('Family',style: TextStyle(fontSize: 13)),
                                              value: 'family',
                                              groupValue: _relationship,
                                              onChanged: (value) {
                                                setState(() {
                                                  _relationship = value as String?;
                                                });
                                              },
                                              dense: true, // add this line to make the RadioListTile smaller
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: RadioListTile(
                                              contentPadding: const EdgeInsets.all(0),
                                              title: const Text('Tenant',style: TextStyle(fontSize: 13)),
                                              value: 'tenant',
                                              groupValue: _relationship,
                                              onChanged: (value) {
                                                setState(() {
                                                  _relationship = value as String?;
                                                });
                                              },
                                              dense: true, // add this line to make the RadioListTile smaller
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: RadioListTile(
                                              contentPadding: const EdgeInsets.all(0),
                                              title: const Text('Others',style: TextStyle(fontSize: 13)),
                                              value: 'others',
                                              groupValue: _relationship,
                                              onChanged: (value) {
                                                setState(() {
                                                  _relationship = value as String?;
                                                });
                                              },
                                              dense: true, // add this line to make the RadioListTile smaller
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      const Text('Card Type'),
                                      const SizedBox(height: 2),
                                      Container(
                                        width: 300,
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
                                          value: card.first,
                                          items: card.map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Text('   $value',),
                                          )).toList(),
                                          onChanged: (String? value) {
                                            setState(() {
                                              selectedCard = value;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      if (selectedCard == '-- Select --')
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text('RM130.00 / Month, due immediately on the 1st day of every quarter, deposit RM80.00'),
                                            const SizedBox(height: 10),
                                            const Text('Remark'),
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
                                                ),),
                                            ),
                                          ],
                                        )
                                      else if (selectedCard == 'PARKING-ONLY ACCESS CARD')
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            const Text('Parking Bay to be Reserved'),
                                            const SizedBox(height: 2),
                                            Container(
                                              width: 300,
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
                                                value: parkingBay.first,
                                                items: parkingBay.map((value) => DropdownMenuItem(
                                                  value: value,
                                                  child: Text('   $value',),
                                                )).toList(),
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    selectedParkingBay = value;
                                                  });
                                                },
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            const Text('RM130.00 / Month, due immediately on the 1st day of every quarter, deposit RM80.00'),
                                            const SizedBox(height: 10),
                                            const Text('Car Plate No.'),
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
                                                  controller: carPlate,
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    suffixIcon: carPlate.text.isNotEmpty
                                                        ? IconButton(
                                                      icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                      onPressed: () {
                                                        setState(() {
                                                          carPlate.clear();
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
                                            const SizedBox(height: 10),
                                            CheckboxListTile(
                                              title: const Text('Enable car plate recognition for access controls'),
                                              value: _isEnable,
                                              onChanged: (bool? value) {
                                                setState(() {
                                                  _isEnable = value!;
                                                });
                                              },
                                              controlAffinity: ListTileControlAffinity.leading,
                                            ),
                                            const SizedBox(height: 15),
                                            const Text('Remark'),
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
                                                ),),
                                            ),
                                          ],
                                        )
                                      else if (selectedCard == 'LIFT-ONLY ACCESS CARD')
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Text('Parking Bay to be Reserved'),
                                              const SizedBox(height: 2),
                                              Container(
                                                width: 300,
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
                                                  value: parkingBay.first,
                                                  items: parkingBay.map((value) => DropdownMenuItem(
                                                    value: value,
                                                    child: Text('   $value',),
                                                  )).toList(),
                                                  onChanged: (String? value) {
                                                    setState(() {
                                                      selectedParkingBay = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                              const SizedBox(height: 5),
                                              const Text('RM0.00 / Month, due immediately on the 1st day of every quarter, deposit RM80.00'),
                                              const SizedBox(height: 10),
                                              const Text('Car Plate No.'),
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
                                                    controller: carPlate,
                                                    decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      suffixIcon: carPlate.text.isNotEmpty
                                                          ? IconButton(
                                                        icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                        onPressed: () {
                                                          setState(() {
                                                            carPlate.clear();
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
                                              const SizedBox(height: 10),
                                              CheckboxListTile(
                                                title: const Text('Enable car plate recognition for access controls'),
                                                value: _isEnable,
                                                onChanged: (bool? value) {
                                                  setState(() {
                                                    _isEnable = value!;
                                                  });
                                                },
                                                controlAffinity: ListTileControlAffinity.leading,
                                              ),
                                              const SizedBox(height: 15),
                                              const Text('Remark'),
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
                                                  ),),
                                              ),
                                            ],
                                          )
                                        else if (selectedCard == 'PARKING AND LIFT ACCESS CARD')
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text('Parking Bay to be Reserved'),
                                                const SizedBox(height: 2),
                                                Container(
                                                  width: 300,
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
                                                    value: parkingBay.first,
                                                    items: parkingBay.map((value) => DropdownMenuItem(
                                                      value: value,
                                                      child: Text('   $value',),
                                                    )).toList(),
                                                    onChanged: (String? value) {
                                                      setState(() {
                                                        selectedParkingBay = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                const SizedBox(height: 5),
                                                const Text('RM0.00 / Month, due immediately on the 1st day of every quarter, deposit RM80.00'),
                                                const SizedBox(height: 10),
                                                const Text('Car Plate No.'),
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
                                                      controller: carPlate,
                                                      decoration: InputDecoration(
                                                        border: InputBorder.none,
                                                        suffixIcon: carPlate.text.isNotEmpty
                                                            ? IconButton(
                                                          icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                          onPressed: () {
                                                            setState(() {
                                                              carPlate.clear();
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
                                                const SizedBox(height: 10),
                                                CheckboxListTile(
                                                  title: const Text('Enable car plate recognition for access controls'),
                                                  value: _isEnable,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      _isEnable = value!;
                                                    });
                                                  },
                                                  controlAffinity: ListTileControlAffinity.leading,
                                                ),
                                                const SizedBox(height: 15),
                                                const Text('Remark'),
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
                                                    ),),
                                                ),
                                              ],
                                            )
                                          else if (selectedCard == 'LIFT AND FACILITY ACCESS CARD')
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text('Parking Bay to be Reserved'),
                                                  const SizedBox(height: 2),
                                                  Container(
                                                    width: 300,
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
                                                      value: parkingBay.first,
                                                      items: parkingBay.map((value) => DropdownMenuItem(
                                                        value: value,
                                                        child: Text('   $value',),
                                                      )).toList(),
                                                      onChanged: (String? value) {
                                                        setState(() {
                                                          selectedParkingBay = value;
                                                        });
                                                      },
                                                    ),
                                                  ),
                                                  const SizedBox(height: 5),
                                                  const Text('RM100.00 / Month, due immediately on the 1st day of every quarter, deposit RM80.00'),
                                                  const SizedBox(height: 10),
                                                  const Text('Car Plate No.'),
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
                                                        controller: carPlate,
                                                        decoration: InputDecoration(
                                                          border: InputBorder.none,
                                                          suffixIcon: carPlate.text.isNotEmpty
                                                              ? IconButton(
                                                            icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                            onPressed: () {
                                                              setState(() {
                                                                carPlate.clear();
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
                                                  const SizedBox(height: 10),
                                                  CheckboxListTile(
                                                    title: const Text('Enable car plate recognition for access controls'),
                                                    value: _isEnable,
                                                    onChanged: (bool? value) {
                                                      setState(() {
                                                        _isEnable = value!;
                                                      });
                                                    },
                                                    controlAffinity: ListTileControlAffinity.leading,
                                                  ),
                                                  const SizedBox(height: 15),
                                                  const Text('Remark'),
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
                                                      ),),
                                                  ),
                                                ],
                                              )
                                            else if (selectedCard == 'PARKING,LIFT,AND FACILITY ACCESS CARD')
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    const Text('Parking Bay to be Reserved'),
                                                    const SizedBox(height: 2),
                                                    Container(
                                                      width: 300,
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
                                                        value: parkingBay.first,
                                                        items: parkingBay.map((value) => DropdownMenuItem(
                                                          value: value,
                                                          child: Text('   $value',),
                                                        )).toList(),
                                                        onChanged: (String? value) {
                                                          setState(() {
                                                            selectedParkingBay = value;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    const Text('RM100.00 / Month, due immediately on the 1st day of every quarter, deposit RM80.00'),
                                                    const SizedBox(height: 10),
                                                    const Text('Car Plate No.'),
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
                                                          controller: carPlate,
                                                          decoration: InputDecoration(
                                                            border: InputBorder.none,
                                                            suffixIcon: carPlate.text.isNotEmpty
                                                                ? IconButton(
                                                              icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                              onPressed: () {
                                                                setState(() {
                                                                  carPlate.clear();
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
                                                    const SizedBox(height: 10),
                                                    CheckboxListTile(
                                                      title: const Text('Enable car plate recognition for access controls'),
                                                      value: _isEnable,
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          _isEnable = value!;
                                                        });
                                                      },
                                                      controlAffinity: ListTileControlAffinity.leading,
                                                    ),
                                                    const SizedBox(height: 15),
                                                    const Text('Remark'),
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
                                                        ),),
                                                    ),
                                                  ],
                                                )
                                    ],
                                  ),
                                  const SizedBox(height: 25),
                                  TextButton(
                                    onPressed: (){
                                      Navigator.pop(context);
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      primary: Colors.white,
                                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                              ),
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
        title: const Text('Access Cards',style: TextStyle(fontWeight: FontWeight.bold),),
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
            showAddNewAccessDialog();
          },
          child: const SizedBox(
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text(
                'New Access Card',
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