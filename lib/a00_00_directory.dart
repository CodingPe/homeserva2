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
