import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  TextEditingController category = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  String photo = '';
  final _formKey = GlobalKey<FormState>();
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
  bool _buttonEnabled = false;

  void _validateInputs() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _buttonEnabled = true;
      });
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
    await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      image = pickedFile != null ? File(pickedFile.path) : null;
    });
  }

  Future getSuggestionsData() async {
    var url = 'https://peterapi.vyrox.com/viewsuggestionsdata.php';
    var response = await http.get(Uri.parse(url));
    return json.decode(response.body);
  }

  Future<void> _addSuggestion() async {
    const url = 'https://peterapi.vyrox.com/addsuggestions.php';
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
        throw Exception('Failed to add suggestion');
      }
    } catch (e) {
      print('Error adding suggestion: $e');
    }
  }

  void showAddSuggestionDialog() {
    showDialog(
        context: context,
        builder: (ctx) => StatefulBuilder(
            builder: (context,setState){
              return Center(
                child: Container(
                    height: 550,
                    constraints: const BoxConstraints(
                        minWidth: 500
                    ),
                    margin: const EdgeInsets.all(20),
                    child: Card(
                      shadowColor: Colors.blueGrey,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                            key: _formKey,
                            child: ScrollConfiguration(
                              behavior: const ScrollBehavior().copyWith(overscroll: false),
                              child: ListView(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Center(
                                        child: Text("New Suggestions",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22),),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text("Category",style: TextStyle(fontSize: 14)),
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
                                          value: list.first,
                                          items: list.map((value) => DropdownMenuItem(
                                            value: value,
                                            child: Text('   $value',),
                                          )).toList(),
                                          onChanged: (String? value) {
                                            setState(() {
                                              selectedTitle = value;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Text("Title",style: TextStyle(fontSize: 14)),
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
                                              controller: title,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                suffixIcon: title.text.isNotEmpty
                                                    ? IconButton(
                                                  icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                  onPressed: () {
                                                    setState(() {
                                                      title.clear();
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
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text("Display to"),
                                          const SizedBox(height: 2,width: 250),
                                          RadioListTile(
                                            title: const Text('Public'),
                                            value: 'public',
                                            groupValue: _privacy,
                                            onChanged: (value) {
                                              setState(() {
                                                _privacy = value as String?;
                                              }
                                              );
                                            },
                                          ),
                                          const SizedBox(width: 250,),
                                          RadioListTile(
                                            title: const Text('Private'),
                                            value: 'private',
                                            groupValue: _privacy,
                                            onChanged: (value) {
                                              setState(() {
                                                _privacy = value as String?;
                                              }
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      const Text("Description",style: TextStyle(fontSize: 14)),
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
                                              controller: description,
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                suffixIcon: description.text.isNotEmpty
                                                    ? IconButton(
                                                  icon: const Icon(Icons.clear, color: Colors.grey,size: 20,),
                                                  onPressed: () {
                                                    setState(() {
                                                      description.clear();
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
                                  ),
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    width: 300,
                                    height: 50,
                                    child: TextButton(
                                      onPressed: (){
                                        pickImage();
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        primary: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                          side: const BorderSide(color: Colors.grey),
                                        ),
                                      ),
                                      child: const Text(
                                        'Upload',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  SizedBox(
                                    width: 300,
                                    height: 50,
                                    child: TextButton(
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
  Widget build(BuildContext context) => DefaultTabController(
    length: 3,
    child: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Suggestions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Column(
            children: [
              const TabBar(
                indicatorColor: Color.fromARGB(255, 2, 122, 252),
                indicatorWeight: 3,
                labelColor: Color.fromARGB(255, 2, 122, 252),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'New',
                  ),
                  Tab(
                    text: 'Processing',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                ],
              ),
              Container(
                height: 0.7,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          ScrollConfiguration(
              behavior: const ScrollBehavior().copyWith(overscroll: false),
              child: Scrollbar(
                  child: FutureBuilder(
                    future: getSuggestionsData(),
                    builder: (context, snapshot){
                      if(snapshot.hasError) print(snapshot.error);
                      return snapshot.connectionState == ConnectionState.done && snapshot.data != null && snapshot.data.length > 0
                          ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          List list = snapshot.data;
                          if (list[index]['Display'] == 'public') {
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                              child: GestureDetector(
                                  onTap: () async {
                                    await showDialog(
                                      context: context,
                                      builder: (ctx) => StatefulBuilder(
                                        builder: (context, setState) {
                                          return Center(
                                            child: Container(
                                              constraints: const BoxConstraints(minWidth: 500),
                                              margin: const EdgeInsets.all(20),
                                              child: Card(
                                                elevation: 10,
                                                shadowColor: Colors.blueGrey,
                                                child: Container(
                                                  padding: const EdgeInsets.all(20),
                                                  color: Colors.grey[200],
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      const Text(
                                                        'Suggestion Detail',
                                                        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                                      ),
                                                      const SizedBox(height: 15),
                                                      ClipRRect(
                                                        borderRadius: BorderRadius.circular(12.0),
                                                        child: Image.network(
                                                          list[index]['Photo'],
                                                        ),
                                                      ),
                                                      const SizedBox(height: 15),
                                                      const Text(
                                                          'Unit\nD-5-19',
                                                          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)
                                                      ),
                                                      const SizedBox(height: 15),
                                                      Text(
                                                        'Category\n${list[index]['Category']}',
                                                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                                                      ),
                                                      const SizedBox(height: 15),
                                                      Text(
                                                        'Title\n${list[index]['Title']}',
                                                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                                                      ),
                                                      const SizedBox(height: 15),
                                                      Text(
                                                        'Show to\n${list[index]['Display']}',
                                                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                                                      ),
                                                      const SizedBox(height: 15),
                                                      Text(
                                                        'Description\n${list[index]['Description']}',
                                                        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: SizedBox(
                                      width: 300,
                                      height: 50,
                                      child: Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(12.0),
                                            child: Image.network(
                                              list[index]['Photo'],
                                              width: 48,
                                              height: 48,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  list[index]['Category'],
                                                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                                ),
                                                const SizedBox(height: 3),
                                                Text(
                                                  list[index]['Title'],
                                                  style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16,color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: const [
                                                Text(
                                                  '1 day outstanding\n',
                                                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13,color: Colors.grey),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                  )
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
                  )
              )),
          const Center(
            child: Text('Processing'),
          ),
          const Center(
            child: Text('Completed'),
          ),
        ],
      ),
      bottomNavigationBar: Material(
        color: Colors.blue,
        child: InkWell(
          onTap: () {
            showAddSuggestionDialog();
          },
          child: const SizedBox(
            height: 60,
            width: double.infinity,
            child: Center(
              child: Text(
                'New Suggestion',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}