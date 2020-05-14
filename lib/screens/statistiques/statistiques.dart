import 'package:covid19stat/screens/appbar.dart';
import 'package:covid19stat/screens/drawer.dart' as prefix0;
import 'package:covid19stat/screens/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'first_stat_slide.dart';
import 'second_stat_slide.dart';
import 'third_stat_slide.dart';

class Statistiques extends StatefulWidget {
  @override
  StatistiqueState createState() => StatistiqueState();
}

class StatistiqueState extends State<Statistiques> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  SwiperController controller;
  List<SwiperController> controllers;
  List<Widget> widgetList = [];


  @override
  void initState() {

    controller = new SwiperController();
    super.initState();
  }

  Widget Statistique(BuildContext context) {
    print(widgetList);
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: SizedBox(
        child: new Swiper(
          loop: false,
          itemCount: widgetList.length,
          controller: controller,
          pagination: new SwiperPagination(),
          itemBuilder: (BuildContext context, int index) {
            return widgetList[index];
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    widgetList.add(firstStatistiquePage(context));
    widgetList.add(secondStatistiquePage(context));
    widgetList.add(thirdStatistiquePage(context));
    return new Scaffold(
      key: _globalKey,
      appBar: appbar('Statistique'),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height /30,
          child: Text('footer')),
      drawer: prefix0.drawer(context),
      body: Scaffold(
          appBar: headerLogo(context),
          body: Scaffold(
              appBar: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child:
                      header('Point de la situation COVID-19\n 01 Mai 2020')),
              body: Statistique(context))
      ),
    );
  }
}
