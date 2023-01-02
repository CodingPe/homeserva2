import 'package:flutter/cupertino.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String logout = '                     Logout                    ';
    return SizedBox(
        height: 60,
        child: Center(
            child: CupertinoButton.filled(
                child: Text(logout),
                onPressed: () {
                  Navigator.of(context).restorablePush(dialogBuilder);
                })));
  }
}

Route<Object?> dialogBuilder(BuildContext context, Object? arguments) {
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
                  },
                  isDestructiveAction: true,
                  child: const Text('Yes'))
            ]);
      });
}
