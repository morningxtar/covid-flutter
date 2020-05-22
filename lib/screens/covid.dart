import 'package:covid19stat/apis/fetchDatas.dart';
import 'package:covid19stat/models/FigureCI.dart';
import 'package:covid19stat/screens/notications/notifications.dart';
import 'package:covid19stat/screens/statistiques/statistiques.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

ThemeData appTheme = ThemeData(
  fontFamily: 'Oxygen'
);

class Covid extends StatefulWidget {

  @override
  _CovidState createState() => _CovidState();
}

class _CovidState extends State<Covid> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    Future<FigureCI> futureFigure = fetchFigure();

    return MaterialApp(
      title: 'Stop Covid',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: new Statistiques(),
      localizationsDelegates: [
        // this line is important
        RefreshLocalizations.delegate,
      ],
    );
  }

}