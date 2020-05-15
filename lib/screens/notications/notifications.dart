import 'dart:ffi';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19stat/screens/appbar.dart';
import 'package:covid19stat/screens/drawer.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../footer.dart';
import '../header.dart';

class Notifications extends StatelessWidget {
  PageController _controller = PageController(
    initialPage: 0,
  );
  double currentPage = 0;

  Widget notification(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: ListView(
        children: <Widget>[
          notif(context),
          notif(context),
          notif(context),
          notif(context),
          notif(context),
          notif(context),
          notif(context),
        ],
      ),
    );
  }

  Widget notif(context) {
    return Card(
      child: Container(
        height: 130,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Text(
              "Propagation du couvre-feu",
              style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.w800,
                  fontSize: 17),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: AutoSizeText(
                'Le couvre-feu, instauré sur l\'ensemble\n'
                'du territoire le 24 mars 2020, est porogé\n'
                'pour une nouvelle période allant',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 9,
                      right: MediaQuery.of(context).size.width / 15),
                  child: AutoSizeText(
                    "du 25 avril au 8 mai 2020, de 21H à 5H",
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w800,
                        fontSize: 10),
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      shape: BoxShape.circle,
                      color: Color(0xFFffffff)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar('Statistique'),
      bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 28,
          color: Colors.white,
          child: footer(context)),
      drawer: prefix0.drawer(context),
      body: Scaffold(
          appBar: headerLogo(context),
          body: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: header('Alerte infos')),
              body: notification(context))),
    );
  }
}
