import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

class SubUser extends StatefulWidget {
  const SubUser({Key? key}) : super(key: key);

  @override
  State<SubUser> createState() => _SubUserState();
}

class _SubUserState extends State<SubUser> {
  int _countdown = 0;
  late Timer _timer;
  bool _isPressed = false;

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    _countdown = 3;
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_countdown < 1) {
            timer.cancel();
            _showSOSDialog();
          } else {
            _countdown = _countdown - 1;
          }
        },
      ),
    );
  }

  void _showSOSDialog() {
    if (_countdown == 0) {
      setState(() {
        _isPressed = false;
        _countdown = 0;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("SOS Alert"),
            content: const Text("The SOS alarm has been successfully called!"),
            actions: <Widget>[
              GestureDetector(
                onTap: (){
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.clear),
              )
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final List<String> accountType = <String>[
    'Family',
    'Tenant',
  ];
  String? selectedAccountType;
  String? _entity = 'personal'; // set initial value to 'personal'

  //personal
  TextEditingController subUserName = TextEditingController();
  TextEditingController nRIC = TextEditingController();
  TextEditingController passport = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController alternativeContact = TextEditingController();
  TextEditingController whatsApp = TextEditingController();
  TextEditingController primaryEmail = TextEditingController();
  TextEditingController alternativeEmail = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String? _gender;
  File? image;
  bool _isAuto = false;

  //company
  TextEditingController companyName = TextEditingController();
  TextEditingController companyRegistration = TextEditingController();

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  void showAddNewSubUserAccountDialog() {
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
                                    child: Text("New Sub-User Account",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
                                  ),
                                  const SizedBox(height: 7),
                                  const Text('Property No.',style: TextStyle(fontSize: 14)),
                                  const SizedBox(height: 5),
                                  const Text('D-5-19/1',style: TextStyle(fontSize: 14)),
                                  const SizedBox(height: 10),
                                  const Text("Sub-User Account Type",style: TextStyle(fontSize: 14)),
                                  const SizedBox(height: 2),
                                  Container(
                                    width: 320,
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
                                      value: accountType.first,
                                      items: accountType.map((value) => DropdownMenuItem(
                                        value: value,
                                        child: Text('   $value',),
                                      )).toList(),
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedAccountType = value;
                                        });
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 14),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    color: const Color.fromARGB(255, 248, 248, 248),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text("Entity",style: TextStyle(fontSize: 14)),
                                        const SizedBox(height: 2),
                                        SizedBox(
                                          width: 250,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: RadioListTile(
                                                  contentPadding: const EdgeInsets.all(0),
                                                  title: const Text('Personal'),
                                                  value: 'personal',
                                                  groupValue: _entity,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _entity = value as String?;
                                                    });
                                                  },
                                                  dense: true, // add this line to make the RadioListTile smaller
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: RadioListTile(
                                                  contentPadding: const EdgeInsets.all(0),
                                                  title: const Text('Company'),
                                                  value: 'company',
                                                  groupValue: _entity,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      _entity = value as String?;
                                                    });
                                                  },
                                                  dense: true, // add this line to make the RadioListTile smaller
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            if (_entity == 'personal')
                                              Container(
                                                  padding: const EdgeInsets.all(10),
                                                  height: 1130,
                                                  width: 320,
                                                  color: const Color.fromARGB(255, 248, 248, 248),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text('Sub-User Name'),
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
                                                            controller: subUserName,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              suffixIcon: subUserName.text.isNotEmpty
                                                                  ? IconButton(
                                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    subUserName.clear();
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
                                                      const Text('NRIC'),
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
                                                      const SizedBox(height: 10),
                                                      const Text('Passport No.'),
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
                                                          ),),
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
                                                      const Text('Alternative Contact No.'),
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
                                                            controller: alternativeContact,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              suffixIcon: alternativeContact.text.isNotEmpty
                                                                  ? IconButton(
                                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    alternativeContact.clear();
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
                                                      const Text('WhatsApp'),
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
                                                            controller: whatsApp,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              suffixIcon: whatsApp.text.isNotEmpty
                                                                  ? IconButton(
                                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    whatsApp.clear();
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
                                                      const Text('Primary Email Address'),
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
                                                            controller: primaryEmail,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              suffixIcon: primaryEmail.text.isNotEmpty
                                                                  ? IconButton(
                                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    primaryEmail.clear();
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
                                                      const Text('Alternative Email Address'),
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
                                                            controller: alternativeEmail,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              suffixIcon: alternativeEmail.text.isNotEmpty
                                                                  ? IconButton(
                                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    alternativeEmail.clear();
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
                                                      const Text('Date of Birth'),
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
                                                                style: const TextStyle(fontSize: 16,color: Colors.black), // format date as "day month year"
                                                              ),
                                                            )
                                                        ),
                                                      ),
                                                      const SizedBox(height: 10),
                                                      const Text('Gender'),
                                                      const SizedBox(height: 2),
                                                      SizedBox(
                                                        width: 250,
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: RadioListTile(
                                                                contentPadding: const EdgeInsets.all(0),
                                                                title: const Text('Male'),
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
                                                                title: const Text('Female'),
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
                                                        ),
                                                      ),
                                                      const SizedBox(height: 15),
                                                      GridView.count(
                                                          crossAxisCount: 2,
                                                          mainAxisSpacing: 5,
                                                          shrinkWrap: true,
                                                          scrollDirection: Axis.vertical,
                                                          physics: const BouncingScrollPhysics(),
                                                          crossAxisSpacing: 8,
                                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                                          children: [
                                                            _buildGridViewItem('Profile Picture',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('NRIC (Front)',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('NRIC (Back)',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Passport',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Visa',
                                                                onTap: () => pickImage()),
                                                          ]),
                                                    ],
                                                  )
                                              )
                                            else if (_entity == 'company')
                                              Container(
                                                  padding: const EdgeInsets.all(10),
                                                  height: 1650,
                                                  width: 320,
                                                  color: const Color.fromARGB(255, 248, 248, 248),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text('Company Name'),
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
                                                          ),),
                                                      ),
                                                      const SizedBox(height: 10),
                                                      const Text('Company Registration No.'),
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
                                                            controller: companyRegistration,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              suffixIcon: companyRegistration.text.isNotEmpty
                                                                  ? IconButton(
                                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    companyRegistration.clear();
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
                                                      const Text('Sub-User Name'),
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
                                                            controller: subUserName,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              suffixIcon: subUserName.text.isNotEmpty
                                                                  ? IconButton(
                                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    subUserName.clear();
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
                                                      const Text('NRIC'),
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
                                                      const SizedBox(height: 10),
                                                      const Text('Passport No.'),
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
                                                          ),),
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
                                                      const Text('Alternative Contact No.'),
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
                                                            controller: alternativeContact,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              suffixIcon: alternativeContact.text.isNotEmpty
                                                                  ? IconButton(
                                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    alternativeContact.clear();
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
                                                      const Text('WhatsApp'),
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
                                                            controller: whatsApp,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              suffixIcon: whatsApp.text.isNotEmpty
                                                                  ? IconButton(
                                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    whatsApp.clear();
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
                                                      const Text('Primary Email Address'),
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
                                                            controller: primaryEmail,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              suffixIcon: primaryEmail.text.isNotEmpty
                                                                  ? IconButton(
                                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    primaryEmail.clear();
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
                                                      const Text('Alternative Email Address'),
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
                                                            controller: alternativeEmail,
                                                            decoration: InputDecoration(
                                                              border: InputBorder.none,
                                                              suffixIcon: alternativeEmail.text.isNotEmpty
                                                                  ? IconButton(
                                                                icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                                onPressed: () {
                                                                  setState(() {
                                                                    alternativeEmail.clear();
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
                                                      const Text('Date of Birth'),
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
                                                                style: const TextStyle(fontSize: 16,color: Colors.black), // format date as "day month year"
                                                              ),
                                                            )
                                                        ),
                                                      ),
                                                      const SizedBox(height: 10),
                                                      const Text('Gender'),
                                                      const SizedBox(height: 2),
                                                      SizedBox(
                                                        width: 250,
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              flex: 1,
                                                              child: RadioListTile(
                                                                contentPadding: const EdgeInsets.all(0),
                                                                title: const Text('Male'),
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
                                                                title: const Text('Female'),
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
                                                        ),
                                                      ),
                                                      const SizedBox(height: 15),
                                                      GridView.count(
                                                          crossAxisCount: 2,
                                                          mainAxisSpacing: 8,
                                                          shrinkWrap: true,
                                                          scrollDirection: Axis.vertical,
                                                          physics: const BouncingScrollPhysics(),
                                                          crossAxisSpacing: 8,
                                                          padding: const EdgeInsets.symmetric(horizontal: 20),
                                                          children: [
                                                            _buildGridViewItem('Logo',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Form 9',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Form 49',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Section 14',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Section 58',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Form 24',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Section 78',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Section 51',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Memorandum & Articles Association/Constitution',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Form 44',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Section 46(3)',
                                                                onTap: () => pickImage()),
                                                            _buildGridViewItem('Compiled (Multiple\nDocuments in One File',
                                                                onTap: () => pickImage()),
                                                          ]),
                                                    ],
                                                  )
                                              )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Container(
                                      height: 80,
                                      width: 250,
                                      color: const Color.fromARGB(255, 248, 248, 248),
                                      child: Center(
                                        child: CheckboxListTile(
                                          title: const Text('Auto-send temporary user account login password to primary email address'),
                                          value: _isAuto,
                                          onChanged: (bool? value) {
                                            setState(() {
                                              _isAuto = value!;
                                            });
                                          },
                                          controlAffinity: ListTileControlAffinity.leading,
                                        ),
                                      )
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
          title: const Text('Sub-User Accounts',style: TextStyle(fontWeight: FontWeight.w300),),
          actions: [
            IconButton(onPressed: showAddNewSubUserAccountDialog, icon: const Icon(Icons.add)),
            SizedBox(
              width: 35,
              height: 35,
              child: CircleAvatar(
                  backgroundColor: Colors.red,
                  child: GestureDetector(
                    onTapDown: (_) {
                      setState(() {
                        _countdown = 3;
                      });
                    },
                    onLongPressStart: (_) {
                      setState(() {
                        _isPressed = true;
                      });
                      _startTimer();
                    },
                    onLongPressEnd: (_) {
                      setState(() {
                        _isPressed = false;
                        _timer?.cancel();
                        _countdown = 1;
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      width: 100,
                      height: 100,
                      child: const Center(
                        child: Text(
                          "SOS",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
            ),
            const SizedBox(width: 10)
          ]
      ),
      body: Stack(
        children: [
          if (_isPressed)
            Container(
              color: const Color.fromARGB(255, 51, 51, 51).withOpacity(0.8),
            ),
          Center(
            child: AnimatedOpacity(
              opacity: _isPressed ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Center(
                  child: Column(
                    children: [
                      const Text(
                          'Emergency SOS',
                          style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 40
                          ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        _countdown.toString(),
                        style: const TextStyle(
                          fontSize: 120,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: MediaQuery.of(context).size.width * _countdown / 3, // Set the width of the slider based on the countdown value
                        height: 10,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        'Initializing...',
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: const Text(
                    "No sub-user account found",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Color.fromARGB(255, 66, 72, 82)
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

Widget _buildGridViewItem(String label,
    {required VoidCallback onTap}) {
  return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Container(
          height: 65,
          width: 65,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 204, 204, 204), width: 1),
            color: Colors.white,
          ),
          child: const Center(
            child: Icon(Icons.file_upload_outlined,size: 40,color: Color.fromARGB(255, 204, 204, 204),),
          ),
        ),
        const SizedBox(height: 8),
        Text(label,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w400),
            textAlign: TextAlign.center)
      ]
      )
  );
}