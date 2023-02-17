import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeserva_2/a00_00_directory.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userLogin = TextEditingController();
  final TextEditingController _passLogin = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
            child: Center(
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
              //Text
              const Text(
                "HOMESERVA",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const Text(
                "Manage like Pro",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // Email
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.white,
                          width: 5.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                            left: 3.0,
                          ),
                          child: TextFormField(
                              controller: _userLogin,
                              decoration: const InputDecoration(
                                prefixIcon:
                                    Icon(Icons.mail, color: Colors.black),
                                border: InputBorder.none,
                                hintText: 'Email',
                              ))))),
              const SizedBox(height: 10.0),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(
                          color: Colors.white,
                          width: 5.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                          padding: const EdgeInsets.only(
                            left: 3.0,
                          ),
                          child: TextFormField(
                              controller: _passLogin,
                              obscureText: _obscureText,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.key,
                                      color: Colors.black),
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  suffixIcon: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .end, // added line
                                          mainAxisSize:
                                              MainAxisSize.min, // added line
                                          children: [
                                            IconButton(
                                              onPressed: _passLogin.clear,
                                              icon: const Icon(
                                                Icons.clear,
                                                color: Colors.grey,
                                              ),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _obscureText =
                                                        !_obscureText;
                                                  });
                                                },
                                                child: Icon(
                                                  _obscureText
                                                      ? Icons.visibility_off
                                                      : Icons.visibility,
                                                  color: Colors.grey,
                                                ))
                                          ]))))))),
              const SizedBox(height: 20.0),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: GestureDetector(
                      onTap: () => [
                            // SignIn Function
                            // Navigator.push(context, MaterialPageRoute(builder: (context) => const MainPage())),
                            LoginJsonPost().makePostRequest_01(
                                _userLogin.text.toLowerCase(), _passLogin.text),
                          ],
                      child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            border: Border.all(
                              color: Colors.blue,
                              width: 5.0,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: const Center(
                              child: Text('Sign In',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  )))))),
              const SizedBox(height: 1),
              //Forgot Password
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50.0,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      textDirection: TextDirection.ltr,
                      children: [
                        TextButton(
                            child: const Text("Reset Password"),
                            onPressed: () {
                              //Navigator to ScreenPage(Testing Folder.Alex demo)
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MainPage()));
                            })
                      ]))
            ])))));
  }
}
