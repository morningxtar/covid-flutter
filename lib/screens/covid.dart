import 'package:covid19stat/screens/notications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'Oxygen'
);

class Covid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Covid stats',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: new Notifications(),
    );
  }

}