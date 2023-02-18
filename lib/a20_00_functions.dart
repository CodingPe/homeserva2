import 'package:flutter/material.dart';
import 'package:homeserva_2/a20_01_suggestions.dart';

class Functions extends StatelessWidget {
  const Functions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
        title: const Text("Functions"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20,left: 20),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20)
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const suggestions()),
                );
              },
              child: Image.asset(
                'assets/icons/suggestions.png',
                width: 100, // set the width of the image
                height: 100, // set the height of the image
              ),
            ),
          )
        ],
      )
    );
  }
}
