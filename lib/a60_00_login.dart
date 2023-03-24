import 'dart:convert';
import 'package:homeserva_2/a00_00_directory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

    Uri url = Uri.parse(
        'https://newdemo.homeserva.com/flutter_api/a01_00_user_login.php');
    var data = {
      'loginCode': 'vyrox',
      'email': email,
      'password': password,
      'fcm_token': _token ?? 'failed to get fcm token',
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
        body: Stack(children: [
      ScrollConfiguration(
        behavior: NoGlowScrollBehavior(),
        child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 50),
                child: Column(children: [
                  //TODO: add homeserva icon and text.
                  AspectRatio(
                    aspectRatio: 1.38,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 50, left: 20, right: 20, bottom: 10),
                      child: Image.asset('assets/icons/homeserva_logo.png'),
                    ),
                  ),
                  const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text('HOMESERVA',
                          style: TextStyle(
                              fontSize: 38.8, fontWeight: FontWeight.bold))),
                  const SizedBox(height: 20, width: double.maxFinite),
                  //TODO: beautify UI
                  //TODO: Email Vaildate, null validate, hint
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 2),
                      child: LoginInput(inputController: emailController)),
                  //TODO: Email Vaildate, null validate, hint, clear button, visibility button
                  Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 2),
                      child: PasswordInput(
                        inputController: passwordController,
                      )),
                  bigButton('Login', userLogin),
                  Visibility(
                      visible: loadingVisible,
                      child: Container(
                          margin: const EdgeInsets.only(bottom: 30),
                          child: const CupertinoActivityIndicator())),
                  const SizedBox(height: 10)
                ]))),
      ),
    ]));
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
          ))));
}

class LoginInput extends StatefulWidget {
  final TextEditingController inputController;
  const LoginInput({Key? key, required this.inputController}) : super(key: key);

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  bool _isTextFieldEmpty = true;

  @override
  void initState() {
    super.initState();
    widget.inputController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _isTextFieldEmpty = widget.inputController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.grey;
    const secondaryColor = CupertinoColors.activeBlue;
    const accentColor = Color(0xffffffff);
    const backgroundColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 5,
                color: Colors.blue.shade50),
          ]),
          child: TextFormField(
            //TODO: Text input not working.
            textInputAction: TextInputAction.next,
            controller: widget.inputController,
            onChanged: (value) {
              //Do something wi
            },
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(fontSize: 14, color: Colors.black),
            decoration: InputDecoration(
              // label: const Text("Email"),
              labelStyle: const TextStyle(color: primaryColor),
              prefixIcon: const Icon(Icons.email),
              suffixIcon: InkWell(
                  onTap: () {
                    widget.inputController.clear();
                  },
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.clear,
                            size: _isTextFieldEmpty ? 0 : 18,
                            color: primaryColor),
                        const SizedBox(width: 8),
                      ])),
              filled: true,
              fillColor: accentColor,
              hintText: 'enquiry@vyrox.com',
              hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: secondaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: errorColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor, width: 1.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class PasswordInput extends StatefulWidget {
  final TextEditingController inputController;
  const PasswordInput({
    Key? key,
    required this.inputController,
  }) : super(key: key);

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool pwdVisibility = false;
  bool _isTextFieldEmpty = true;

  @override
  void initState() {
    super.initState();
    widget.inputController.addListener(_onTextChanged);
  }

  void _onTextChanged() {
    setState(() {
      _isTextFieldEmpty = widget.inputController.text.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.grey;
    const secondaryColor = CupertinoColors.activeBlue;
    const accentColor = Color(0xffffffff);
    const backgroundColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Container(
          height: 50,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: const Offset(12, 26),
                blurRadius: 50,
                spreadRadius: 0,
                color: Colors.grey.withOpacity(.1)),
          ]),
          child: TextFormField(
              //TODO: cant become next, check textformfield.
              textInputAction: TextInputAction.none,
              obscureText: !pwdVisibility,
              controller: widget.inputController,
              onChanged: (value) {
                //Do something wi
              },
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: accentColor,
                  hintText: 'Enter your password here',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0.0, horizontal: 20.0),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: secondaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: errorColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: primaryColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  suffixIcon: Row(
                      mainAxisAlignment: MainAxisAlignment.end, // added line
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          onTap: () {
                            widget.inputController.clear();
                          },
                          child: Icon(
                            Icons.clear,
                            size: !_isTextFieldEmpty ? 18 : 0,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(width: 3),
                        InkWell(
                            onTap: () => setState(
                                  () => pwdVisibility = !pwdVisibility,
                                ),
                            child: Icon(
                                pwdVisibility
                                    ? Icons.visibility_rounded
                                    : Icons.visibility_off_outlined,
                                color: pwdVisibility
                                    ? secondaryColor
                                    : primaryColor,
                                size: 18)),
                        const SizedBox(width: 8),
                      ]))))
    ]);
  }
}

class PasswordInputSample extends StatefulWidget {
  final String hintText;
  final TextEditingController textEditingController;

  const PasswordInputSample(
      {required this.textEditingController, required this.hintText, Key? key})
      : super(key: key);

  @override
  State<PasswordInputSample> createState() => _PasswordInputSampleState();
}

class _PasswordInputSampleState extends State<PasswordInputSample> {
  bool pwdVisibility = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      textInputAction: TextInputAction.next,
      obscureText: !pwdVisibility,
      decoration: InputDecoration(
        hintText: widget.hintText,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        suffixIcon: InkWell(
          onTap: () => setState(
            () => pwdVisibility = !pwdVisibility,
          ),
          child: Icon(
            pwdVisibility
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Colors.grey.shade400,
            size: 18,
          ),
        ),
      ),
      validator: (val) {
        if (val!.isEmpty) {
          return 'Required';
        }
        return null;
      },
    );
  }
}
