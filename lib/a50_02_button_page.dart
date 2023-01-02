import 'package:flutter/cupertino.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String changePassword = '          Change Password         ';
    return SizedBox(
        height: 60,
        child: Center(
            child: CupertinoButton.filled(
                child: Text(changePassword), onPressed: () {})));
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String logout = '                     Logout                    ';
    return SizedBox(
        height: 60,
        child: Center(
            child:
                CupertinoButton.filled(child: Text(logout), onPressed: () {})));
  }
}
