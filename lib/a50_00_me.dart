import 'package:flutter/material.dart';
import 'package:homeserva_2/a00_00_directory.dart';

class Me extends StatelessWidget {
  const Me({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            AppBar(leading: const Icon(Icons.home), title: const Text("Me")),
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
                padding: const EdgeInsets.only(top: 10),
                child: Column(children: [
                  Center(
                      child: Container(
                          padding: const EdgeInsets.all(0.8),
                          child: const CircleAvatar(
                            radius: 68,
                            backgroundImage: NetworkImage(
                                'https://newdemo.homeserva.com/images/pic_1.png'),
                          ))),
                  const SizedBox(height: 30),
                  const MeBlock1(),
                  const MeBlock2(),
                  const SizedBox(height: 30),
                  const ChangePasswordButton(),
                  const LogoutButton(),
                  const WebContentTPD(),
                  const LastAgreed(),
                ]))));
  }
}

class LastAgreed extends StatelessWidget {
  const LastAgreed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      SizedBox(height: 10),
      Text(
        "Agreed on 01-Jan-2023 7:32AM",
        style: TextStyle(color: Colors.grey),
      ),
      SizedBox(height: 10),
    ]);
  }
}
