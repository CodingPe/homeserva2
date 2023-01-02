import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String changePassword = '          Change Password         ';
    return SizedBox(
        height: 60,
        child: Center(
            child: CupertinoButton.filled(
                child: Text(changePassword),
                onPressed: () {
                  Navigator.of(context).restorablePush(changePasswordDialog);
                })));
  }
}

Route<Object?> changePasswordDialog(BuildContext context, Object? arguments) {
  return CupertinoDialogRoute<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
            title: const Text('Change Password'),
            content: const CupertinoTextField(),
            actions: <Widget>[
              CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  isDefaultAction: false,
                  child: const Text('Cancel')),
              CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  child: const Text('Save'))
            ]);
      });
}
