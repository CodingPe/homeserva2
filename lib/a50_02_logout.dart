import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:homeserva_2/a00_00_directory.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    String changePassword = 'Logout';
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
        child: SizedBox(
            height: 52,
            width: double.infinity,
            child: Center(
                child: CupertinoButton.filled(
                    minSize: 400,
                    child: Text(changePassword),
                    onPressed: () {
                      Navigator.of(context).restorablePush(dialogBuilder);
                    }))));
  }
}

Route<Object?> dialogBuilder(BuildContext context, Object? arguments) {
  final tokenBox = Hive.box('TokenBox');
  return CupertinoDialogRoute<void>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure to proceed logout?'),
            actions: <Widget>[
              CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  isDefaultAction: true,
                  child: const Text('No')),
              CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.of(context, rootNavigator: true).push(
                        MaterialPageRoute(
                            builder: (context) => const LoginUser()));
                    tokenBox.put(1, '');
                    //TODO: return logout and clear token to server.
                  },
                  isDestructiveAction: true,
                  child: const Text('Yes'))
            ]);
      });
}
