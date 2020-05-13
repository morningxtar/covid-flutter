import 'package:covid19stat/screens/statistiques/statistiques.dart';
import 'package:flutter/material.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'Oxygen'
);

class Covid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid stats',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: new Statistiques(),
    );
  }

}