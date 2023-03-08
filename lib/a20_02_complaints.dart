import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class complaints extends StatefulWidget {
  const complaints({Key? key}) : super(key: key);

  @override
  State<complaints> createState() => _complaintsState();
}

class _complaintsState extends State<complaints> {
  TextEditingController category = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String photo = '';
  final _formkey = GlobalKey<FormState>();
  final List<String> list = <String>[
    'BBQ',
    'Guard',
    'GYM',
    'Lobby',
    'Management',
    'Sauna',
    'Spa Pool',
    'Swimming Pool',
  ];
  String? selectedTitle;
  String? _privacy;
  File? image;

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

  Future getcomplaintData() async {
    var url = 'https://peterapi.vyrox.com/viewcomplaintsdata.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  Future<void> _addcomplaint() async {
    final url = 'https://peterapi.vyrox.com/addcomplaints.php';
    try {
      final response = await http.post(Uri.parse(url), body: {
        'category': selectedTitle!,
        'title': title.text,
        'display': _privacy!,
        'description': description.text,
      });
      if (response.statusCode == 200) {
        category.clear();
        title.clear();
        description.clear();
      } else {
        throw Exception('Failed to add complaint');
      }
    } catch (e) {
      print('Error adding complaint: $e');
    }
  }

  void showAddContentDialog() {
    showDialog(
        context: context,
        builder: (ctx) => StatefulBuilder(builder: (context, setState) {
              return Center(
                child: Container(
                    constraints: const BoxConstraints(minWidth: 500),
                    margin: const EdgeInsets.all(20),
                    child: Card(
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: _formkey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const Text(
                                  "New Complaint",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 22),
                                ),
                                const SizedBox(height: 7),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Category"),
                                    const SizedBox(height: 2),
                                    Container(
                                      width: 250,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: DropdownButtonFormField(
                                        hint: const Text(" -- Select --"),
                                        isExpanded: true,
                                        value: selectedTitle,
                                        items: list
                                            .map((value) => DropdownMenuItem(
                                                  child: Text(
                                                    '   $value',
                                                  ),
                                                  value: value,
                                                ))
                                            .toList(),
                                        onChanged: (String? value) {
                                          setState(() {
                                            selectedTitle = value;
                                          });
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "Please select your Category";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Title"),
                                    const SizedBox(height: 2),
                                    Container(
                                        width: 250,
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.grey),
                                        ),
                                        child: TextFormField(
                                          controller: title,
                                          decoration: const InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please fill your title";
                                            }
                                            return null;
                                          },
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Display to"),
                                    const SizedBox(height: 2),
                                    Container(
                                      width: 250,
                                      child: RadioListTile(
                                        title: const Text('Public'),
                                        value: 'public',
                                        groupValue: _privacy,
                                        onChanged: (value) {
                                          setState(() {
                                            _privacy = value as String?;
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 250,
                                      child: RadioListTile(
                                        title: const Text('Private'),
                                        value: 'private',
                                        groupValue: _privacy,
                                        onChanged: (value) {
                                          setState(() {
                                            _privacy = value as String?;
                                          });
                                        },
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text("Description"),
                                    const SizedBox(height: 2),
                                    Container(
                                      width: 250,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                      ),
                                      child: Expanded(
                                        child: TextFormField(
                                          controller: description,
                                          decoration: const InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return "Please fill your description";
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                        "Attachment (PDF, JPG or PNG format)"),
                                    const SizedBox(height: 2),
                                    Container(
                                      width: 250,
                                      color: Colors.blue,
                                      child: TextButton(
                                          onPressed: () {
                                            pickImage();
                                          },
                                          child: const Text(
                                            "Upload",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )),
                                    ),
                                    const SizedBox(height: 7),
                                    Container(
                                      width: 250,
                                      color: Colors.blue,
                                      child: TextButton(
                                        onPressed: () {
                                          _addcomplaint();
                                          print(image);
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Add",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )),
              );
            }));
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => Future.value(false), // 按下返回鍵不執行任何動作
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "Complaints",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.black,
              ),
            ),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                onPressed: showAddContentDialog,
                icon: const Icon(Icons.add, color: Colors.black),
              )
            ],
          ),
          body: Scrollbar(
              child: FutureBuilder(
            future: getcomplaintData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.connectionState == ConnectionState.done &&
                      snapshot.data != null &&
                      snapshot.data.length > 0
                  ? ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        List list = snapshot.data;
                        if (list[index]['Display'] == 'public') {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ComplaintDetailPage(
                                        list: list, index: index),
                                  ),
                                );
                              },
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12.0),
                                    child: Image.network(
                                      list[index]['Photo'],
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          list[index]['Title'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          list[index]['Description'],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w200,
                                              color: Color.fromARGB(
                                                  255, 66, 72, 82),
                                              fontSize: 13),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          // If display is private, return an empty Container
                          return Container();
                        }
                      },
                    )
                  : const Center(
                      child: Text(
                        "No complaint yet",
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          color: Color.fromARGB(255, 66, 72, 82),
                        ),
                      ),
                    );
            },
          ))),
    );
  }
}

class ComplaintDetailPage extends StatelessWidget {
  final List list;
  final int index;

  const ComplaintDetailPage({Key? key, required this.list, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list[index]['Title'],
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.network(list[index]['Photo']),
              const SizedBox(height: 16.0),
              Text(
                list[index]['Category'],
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                list[index]['Title'],
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16.0),
              Text(
                list[index]['Description'],
                style: const TextStyle(fontWeight: FontWeight.w300),
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
