import 'package:flutter/cupertino.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

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
                  }))),
    );
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
