import 'dart:convert';
import 'package:homeserva_2/a00_00_directory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';

class LoginJson {
  String? email;
  String? password;

  LoginJson(this.email, this.password);

  bool loadingVisible = false;
  Uri url = Uri.parse('https://peterapi.vyrox.com/login_user.php');
  late var data = {'loginCode': 'vyrox', 'email': email, 'password': password};
}

class LoginUser extends StatefulWidget {
  const LoginUser({super.key});

  @override
  LoginUserState createState() => LoginUserState();
}

class LoginUserState extends State<LoginUser> {
  late LoginJson login =
      LoginJson(emailController.text, passwordController.text);
//Hive Box
  final _tokenBox = Hive.box('TokenBox');
  // For CircularProgressIndicator.

  // Getting value from TextField widget.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future userLogin() async {
    // Showing CircularProgressIndicator.
    setState(() {
      login.loadingVisible = true;
    });
    http.Response response =
        await http.post(login.url, body: json.encode(login.data));
    var message = jsonDecode(response.body);

    if (response.statusCode >= 400) {
      debugPrint('No internet');
      return;
    } else {
      if (message['login'] == 'Login Matched') {
        setState(() {
          login.loadingVisible = false;
        });
        Hive.box('TokenBox').put(1, message['token']);
        debugPrint('Token: ${_tokenBox.get(1)}');
        navigateAndFinish(context, const Dashboard());
      } else {
        // If Email or Password did not Matched.
        // Hiding the CircularProgressIndicator.
        setState(() {
          login.loadingVisible = false;
        });
        // Showing Alert Dialog with Response JSON Message.
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text(message['login']),
                  actions: <Widget>[
                    ElevatedButton(
                        child: Text("OK"),
                        onPressed: () {
                          navigatorPop(context);
                        })
                  ]);
            });
        debugPrint('Login = ${message['login']}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Center(
                child: Column(children: [
      const Padding(
          padding: EdgeInsets.all(12.0),
          child: Text('User Login Form', style: TextStyle(fontSize: 21))),
      const Divider(),
      Container(
          width: 280,
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: emailController,
            decoration:
                const InputDecoration(hintText: 'Enter Your Email Here'),
          )),
      Container(
          width: 280,
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: passwordController,
            obscureText: true,
            decoration:
                const InputDecoration(hintText: 'Enter Your Password Here'),
          )),
      ElevatedButton(
        onPressed: userLogin,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[600]),
        child: const Text('Login'),
      ),
      Visibility(
          visible: login.loadingVisible,
          child: Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: const CircularProgressIndicator())),
    ]))));
  }
}

class ProfileScreen extends StatefulWidget {
// Creating String Var to Hold sent Email.

// Receiving Email using Constructor.
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
// User Logout Function.
  logout(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: const Text('Profile Screen'),
                automaticallyImplyLeading: false),
            body: Center(
                child: Column(children: [
              Container(
                  width: 280,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(', Login Successful!',
                      style: const TextStyle(fontSize: 15))),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginUser()));
                  },
                  child: Text('ok')),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    logout(context);
                  },
                  child: const Text('Click Here To Logout')),
            ]))));
  }
}
