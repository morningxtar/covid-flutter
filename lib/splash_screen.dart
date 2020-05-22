import 'dart:async';

import 'package:covid19stat/apis/fetchDatas.dart';
import 'package:covid19stat/screens/covid.dart';
import 'package:covid19stat/screens/header.dart';
import 'package:covid19stat/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

import 'models/FigureCI.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}


class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    fetchFigure();
    fetchFigures();
    fetchFigureGlobal();
    fetchFigureSex();
    fetchFigureAge();
    fetchFigures();
    Timer(Duration(seconds: 3), () {
      NavigationUtils.pushReplacement(context, Covid());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(height: 25,),
            Row(
              children: <Widget>[
                Expanded(
                  child: Image.asset(
                    'assets/images/minis.jpg',
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.width / 7,alignment: Alignment.center,
                  ),
                ),
                Expanded(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: MediaQuery.of(context).size.width / 5,
                    height: MediaQuery.of(context).size.width / 7,alignment: Alignment.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 80,),
            Text("data"),
            Expanded(child: Row(children: <Widget>[Expanded(child: Image.asset(
              'assets/images/proeg.jpg',
            ),)],),),
            Text("Alerte Santé - Plateforme de suivi Covid 19"),
            CircularProgressIndicator(),
            Text("Chargement en cours..."),
            Text("@SaH Analytics International"),
            
            
            

          ],
        ),
      ),
    );
  }
}
