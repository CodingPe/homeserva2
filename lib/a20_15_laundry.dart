import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class Laundry extends StatefulWidget {
  const Laundry({Key? key}) : super(key: key);

  @override
  State<Laundry> createState() => _LaundryState();
}

class _LaundryState extends State<Laundry> {
  File? _image;

  Future<void> _getImageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  void showScanQRDialog() {
    showDialog(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (context, setState) {
          return Center(
            child: Container(
              constraints: const BoxConstraints(minWidth: 500),
              margin: const EdgeInsets.all(20),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20), // Set the desired radius here
                ),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  color: Colors.grey[200],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Scan QR Code', style: TextStyle(fontSize: 20)),
                      const SizedBox(height: 20),
                      const Text(
                          'Please scan the QR Code of the amenity and make payment to start using.'),
                      const SizedBox(height: 15),
                      TextButton(
                        onPressed: () {
                          _getImageFromCamera();
                          Navigator.pop(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          primary: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 6),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Text(
                          'Ok',
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
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
          'Laundry',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Column(
            children: [
              const TabBar(
                indicatorColor: Color.fromARGB(255, 2, 122, 252),
                indicatorWeight: 2,
                labelColor: Color.fromARGB(255, 2, 122, 252),
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: 'Availability',
                  ),
                  Tab(
                    text: 'Running',
                  ),
                  Tab(
                    text: 'Ended',
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
        actions: [
          GestureDetector(onTap: showScanQRDialog, child: const Icon(Icons.add, color: Colors.black)),
          const SizedBox(width: 15)
        ],
      ),
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            children: [
              ListTile(
                leading: const Image(
                  image: AssetImage('assets/icons/laundry.png'),
                ),
                title: const Text(
                  'Washer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: const Text(
                  'LG1',
                  style: TextStyle(fontSize: 14),
                ),
                trailing: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'RM 1.00 / Minute\n',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Available',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                onTap: () {
                  // Handle tile tap
                },
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage('assets/icons/laundry.png'),
                ),
                title: const Text(
                  'Dryer',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: const Text(
                  'Level 27',
                  style: TextStyle(fontSize: 14),
                ),
                trailing: const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'RM 10.00 / Hour\n',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: 'Available',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                onTap: () {
                  // Handle tile tap
                },
              ),
            ],
          ),
          const Center(
            child: Text('Running'),
          ),
          const Center(
            child: Text('Ended'),
          ),
        ],
      ),
    ),
  );
}