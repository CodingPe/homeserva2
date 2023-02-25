import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class suggestions extends StatefulWidget {
  const suggestions({Key? key}) : super(key: key);

  @override
  State<suggestions> createState() => _suggestionsState();
}

class _suggestionsState extends State<suggestions> {
  TextEditingController category = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController display = TextEditingController();
  TextEditingController description = TextEditingController();
  String photo = '';
  final _formkey = GlobalKey<FormState>();
  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  String selectedTitle = '123';

  Future getsuggestionsData() async {
    var url = 'https://peterapi.vyrox.com/viewsuggestionsdata.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  void showAddContentDialog() {
    showDialog(
        context: context,
        builder: (ctx) => StatefulBuilder(
            builder: (context,setState){
              return Center(
                child: Container(
                    constraints: const BoxConstraints(
                        minWidth: 500
                    ),
                    margin: const EdgeInsets.all(20),
                    child: Card(
                      elevation: 10,
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: ListView(
                          children: [
                            Form(
                              key: _formkey,
                              child: Column(
                                children: [
                                  const Text("Category",style: TextStyle(fontWeight: FontWeight.bold),),
                                  const SizedBox(height: 6),
                                  Container(
                                    width: 250,
                                    child: DropdownButtonFormField(
                                      hint: const Text(" Select Category"),
                                      isExpanded: true,
                                      items: list.map((value) => DropdownMenuItem(
                                        child: Text(value,style: TextStyle(fontWeight: FontWeight.bold),),
                                        value: value,
                                      )).toList(),
                                      onChanged: (String? value) {
                                        // Update the state variable when the user selects an item
                                        setState(() {
                                          selectedTitle != value;
                                        });
                                      },
                                      validator: (value){
                                        if(value == null || value.isEmpty){
                                          return "Please select your Category";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    controller: title,
                                    decoration: InputDecoration(
                                      errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,color: Colors.red
                                          )
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(255, 252, 246, 245),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      labelText: 'Title',labelStyle: const TextStyle(color: Colors.black),
                                      hintText: 'Please write your title',
                                      prefixIcon: const Icon(Icons.star,color: Colors.black),
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Please fill your title";}
                                      return null;
                                    },
                                  ), //Title
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    controller: display,
                                    decoration: InputDecoration(
                                      errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,color: Colors.red
                                          )
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(255, 252, 246, 245),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      labelText: 'Display',labelStyle: const TextStyle(color: Colors.black),
                                      hintText: 'Please write your display',
                                      prefixIcon: const Icon(Icons.lock,color: Colors.black),
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Please fill your display";}
                                      return null;
                                    },
                                  ), //Display
                                  const SizedBox(height: 20),
                                  TextFormField(
                                    controller: description,
                                    decoration: InputDecoration(
                                      errorBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              width: 1,color: Colors.red
                                          )
                                      ),
                                      filled: true,
                                      fillColor: const Color.fromARGB(255, 252, 246, 245),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      labelText: 'Description',labelStyle: const TextStyle(color: Colors.black),
                                      hintText: 'Please write your Description',
                                      prefixIcon: const Icon(Icons.notes_outlined,color: Colors.black),
                                    ),
                                    validator: (value){
                                      if(value == null || value.isEmpty){
                                        return "Please fill your description";}
                                      return null;
                                    },
                                  ), // Description
                                  const SizedBox(height: 20),
                                  SizedBox(height: 10),
                                  const Text("Attachment(PDF, JPG or PNG format)"),
                                  const SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black
                                    ),
                                    child: TextButton.icon(onPressed: (){}, icon: Icon(Icons.camera,color: Colors.white,), label: Text("Upload picture",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.white),)),
                                  ),
                                  const SizedBox(height: 20),
                                  FloatingActionButton.extended(
                                    onPressed: () async {
                                      if (_formkey.currentState!.validate()) {
                                        final url = 'https://peterapi.vyrox.com/addsuggestions.php';
                                        try {
                                          final response = await http.post(Uri.parse(url), body: {
                                            'category': category.text,
                                            'title': title.text,
                                            'display': display.text,
                                            'description': description.text,
                                            'photo':photo
                                          });
                                          if (response.statusCode == 200) {
                                            // Request was successful
                                            Navigator.pop(context);
                                          } else {
                                            // Request failed
                                            throw Exception('Failed to add suggestion');
                                          }
                                        } catch (e) {
                                          // Handle any exceptions that occur during the request
                                          print('Error adding suggestion: $e');
                                        }
                                      }
                                    },
                                    backgroundColor: Colors.black,
                                    label: const Text('Login',
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
                                  )
                                ],
                              ),
                            ),
                          ],
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
    return WillPopScope(
      onWillPop: () => Future.value(false), // 按下返回鍵不執行任何動作
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Complaints",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              onPressed: showAddContentDialog,
              icon: Icon(Icons.add, color: Colors.white),
            )
          ],
        ),
        body: FutureBuilder(
          future: getsuggestionsData(),
          builder: (context, snapshot){
            if(snapshot.hasError) print(snapshot.error);
            return snapshot.hasData ? ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context,index){
                  List list = snapshot.data;
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(list: list, index: index),
                            ),
                          );
                        },
                        child: Row(children: [
                          ClipRRect(
                            borderRadius:
                            BorderRadius.circular(12.0),
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
                                    )
                                  ]))
                        ])
                    ),
                  );
                }
            ) : const Center(child: CircularProgressIndicator(),);
          },
        )
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final List list;
  final int index;

  const DetailPage({Key? key, required this.list, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(list[index]['Title'], style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.network(list[index]['Photo']),
              const SizedBox(height: 16.0),
              Text(list[index]['Category'],style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 30),textAlign: TextAlign.center,),
              const SizedBox(height: 16.0),
              Text(list[index]['Title'],textAlign: TextAlign.center,),
              const SizedBox(height: 16.0),
              Text(list[index]['Description'], style: const TextStyle(fontWeight: FontWeight.w300),),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}