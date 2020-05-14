import 'package:covid19stat/screens/appbar.dart';
import 'package:covid19stat/screens/drawer.dart' as prefix0;
import 'package:covid19stat/screens/statistiques/first_stat_slide.dart';
import 'package:covid19stat/screens/statistiques/second_stat_slide.dart';
import 'package:covid19stat/screens/statistiques/third_stat_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';



class Statistiques extends StatefulWidget {
  @override
  StatistiqueState createState() => StatistiqueState();
}

class StatistiqueState extends State<Statistiques> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  PageController _controller = PageController(
    initialPage: 0,
  );
  double currentPage = 0;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        currentPage = 0;
      });
    });
    super.initState();
  }

  Widget Statistique() {
    ScreenUtil.instance = ScreenUtil.getInstance()
      ..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: new PageView(
        controller: _controller,
        children: [
          firstStatistiquePage(context),
          secondStatistiquePage(context),
          thirdStatistiquePage(context),
        ],
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
