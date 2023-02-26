import 'dart:convert';
import 'package:homeserva_2/a00_00_directory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

canLogin(context) {
  navigateAndFinish(context, MainPage());
}

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  LoginUserState createState() => LoginUserState();
}

class LoginUserState extends State<LoginUser> {
//Hive Box
  final _tokenBox = Hive.box('TokenBox');
  // For CircularProgressIndicator.
  bool loadingVisible = false;
  // Getting value from TextField widget.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  String? _token;

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((String? token) {
      setState(() {
        _token = token;
      });
    });
  }

  Future userLogin() async {
    String email = emailController.text;
    String password = passwordController.text;
    // Showing CircularProgressIndicator.
    setState(() {
      loadingVisible = true;
    });

    Uri url = Uri.parse('https://peterapi.vyrox.com/login_user.php');
    var data = {
      'loginCode': 'vyrox',
      'email': email,
      'password': password,
      'fcm_token': _token
    };
    var response = await http.post(url, body: json.encode(data));
    var message = jsonDecode(response.body);

    if (message['login'] == 'Login Matched') {
      setState(() {
        loadingVisible = false;
      });
      Hive.box('TokenBox').put(1, message['token']);
      debugPrint('Token: ${_tokenBox.get(1)}');
      canLogin(context);
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        loadingVisible = false;
      });
      // Showing Alert Dialog with Response JSON Message.
      Navigator.of(context).restorablePush(loginDialogBuilder);
      debugPrint('Login = ${message['login']}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: SafeArea(
              child: Center(
                  child: Column(children: [
                //TODO: add homeserva icon and text.
                AspectRatio(
                  aspectRatio: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 50, left: 20, right: 20, bottom: 5),
                    child: Image.asset('assets/icons/homeserva_logo.png'),
                  ),
                ),
                const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('HOMESERVA',
                        style: TextStyle(
                            fontSize: 38.8, fontWeight: FontWeight.bold))),
                const SizedBox(
                  height: 20,
                  width: double.maxFinite,
                ),
                //TODO: beautify UI
                //TODO: Email Vaildate, null validate, hint
                Container(
                    width: 280,
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.teal,
                            ),
                          ),
                          hintText: 'Enter Your Email Here'),
                    )),
//TODO: Email Vaildate, null validate, hint, clear button, visibility button
                Container(
                    width: 280,
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Your Password Here'),
                    )),
                bigButton('Login', userLogin),
                Visibility(
                    visible: loadingVisible,
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 30),
                        child: const CupertinoActivityIndicator())),
              ])),
            )));
  }
}

Route<Object?> loginDialogBuilder(
  BuildContext context,
  Object? arguments,
) {
  return CupertinoDialogRoute<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
            title: const Text('Login Failed'),
            content: const Text(
                'Invalid password or username, \n Please try again.'),
            actions: <Widget>[
              CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  child: const Text('Ok'))
            ]);
      });
}

//TODO: Disbale button if email and password is null.
Widget bigButton(name, action) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    child: SizedBox(
        height: 52,
        width: double.infinity,
        child: Center(
            child: CupertinoButton.filled(
          minSize: 400,
          onPressed: action,
          child: Text(name),
        ))),
  );
}
