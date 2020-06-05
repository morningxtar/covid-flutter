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

  Timer timer;
  double progressValue;
  @override
  void initState() {
    super.initState();
    fetchFigure();
    fetchFigures();
    fetchFigureGlobal();
    fetchFigureSex();
    fetchFigureAge();
    fetchFigures();
    //progressValueFonc();
    Timer(Duration(seconds: 5), () {
      NavigationUtils.pushReplacement(context, Covid());
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 25,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Image.asset(
                      'assets/images/minis.jpg',
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.width / 7,
                      alignment: Alignment.center,
                    ),
                  ),
                  Expanded(
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.width / 7,
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 80,
              ),
              Image.asset(
                'assets/images/logstop.jpg',
                height: MediaQuery.of(context).size.height / 4,
                alignment: Alignment.center,
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Image.asset(
                        'assets/images/proeg.jpg',
                      ),
                    )
                  ],
                ),
              ),
              Text("Alerte Santé - Plateforme de suivi Covid 19"),
              MyLinearProgressIndicator(backgroundColor: Colors.grey, value: progressValue, valueColor: AlwaysStoppedAnimation<Color>(Colors.greenAccent),),
              Text("Chargement en cours..."),
              Text("@SaH Analytics International"),
            ],
          ),
        ),
      ),
    );
  }

  progressValueFonc(){
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {

        setState(() {
          progressValue = t.tick.toDouble();

        });
    });
  }
}



const double _kMyLinearProgressIndicatorHeight = 6.0;

class MyLinearProgressIndicator extends LinearProgressIndicator
    implements PreferredSizeWidget {
  MyLinearProgressIndicator({
    Key key,
    double value,
    Color backgroundColor,
    Animation<Color> valueColor,
  }) : super(
          key: key,
          value: value,
          backgroundColor: backgroundColor,
          valueColor: valueColor,
        ) {
    preferredSize = Size(double.infinity, _kMyLinearProgressIndicatorHeight);
  }

  @override
  Size preferredSize;
}
