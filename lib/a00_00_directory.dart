import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
export 'package:homeserva_2/main.dart';
export 'package:homeserva_2/a10_00_dashboard.dart';
export 'package:homeserva_2/a20_00_functions.dart';
export 'package:homeserva_2/a30_00_accounting.dart';
export 'package:homeserva_2/a40_00_notification.dart';
export 'package:homeserva_2/a50_00_me.dart';
export 'package:homeserva_2/a50_01_me_block.dart';
export 'package:homeserva_2/a50_02_change_password.dart';
export 'package:homeserva_2/a50_02_logout.dart';
export 'package:homeserva_2/a50_03_web_content_tpd.dart';
export 'package:homeserva_2/a60_01_login_2.dart';
export 'a61_01_login_handler.dart';
// export 'a60_00_login.dart';

void noRotation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

void statusBar() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
}

//Navigate Route Widget
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

//String letter capitalization extensions/methods.
extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}
