import 'package:covid19stat/screens/appbar.dart';
import 'package:covid19stat/screens/drawer.dart' as prefix0;
import 'package:covid19stat/screens/statistiques/first%20stat%20slide.dart';
import 'package:covid19stat/screens/statistiques/second%20stat%20slide.dart';
import 'package:covid19stat/screens/statistiques/third%20stat%20slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';



class Statistiques extends StatefulWidget {
  @override
  StatistiqueState createState() => StatistiqueState();
}

class StatistiqueState extends State<Statistiques> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  SwiperController controller;
  List<SwiperController> controllers;
  List<Widget> widgetList = [];

  PageController _controller = PageController(
    initialPage: 0,
  );
  double currentPage = 0;

  @override
  void initState() {
    print(widgetList);
    controller = new SwiperController();
    super.initState();
  }

  Widget Statistique() {
    ScreenUtil.instance = ScreenUtil.getInstance()
      ..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    widgetList.add(firstStatistiquePage(context));
    widgetList.add(secondStatistiquePage(context));
    widgetList.add(thirdStatistiquePage(context));
    print(widgetList);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: new Swiper(
        loop: false,
        itemCount: widgetList.length,
        controller: controller,
        pagination: new SwiperPagination(),
        itemBuilder: (BuildContext context, int index) {
          return widgetList[index];
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _globalKey,
      appBar: appbar('Statistique'),
      drawer: prefix0.drawer(context),
      body: Statistique(),
    );
  }
}
