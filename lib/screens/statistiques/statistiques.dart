import 'package:covid19stat/apis/fetchDatas.dart';
import 'package:covid19stat/models/FigureAge.dart';
import 'package:covid19stat/models/FigureCI.dart';
import 'package:covid19stat/models/FigureGlobals.dart';
import 'package:covid19stat/models/FigureSex.dart';
import 'package:covid19stat/models/Figures.dart';
import 'package:covid19stat/screens/appbar.dart';
import 'package:covid19stat/screens/drawer.dart' as prefix0;
import 'package:covid19stat/screens/footer.dart';
import 'package:covid19stat/screens/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'first_stat_slide.dart';
import 'second_stat_slide.dart';
import 'third_stat_slide.dart';

class Statistiques extends StatelessWidget {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  SwiperController controller;
  List<SwiperController> controllers;
  List<Widget> widgetList = [];

  Future<FigureCI> futureFigure = fetchFigure();
  Future<List<FigureGlobals>> futureFigureGlobal = fetchFigureGlobal();
  Future<FigureSex> futureFigureSex = fetchFigureSex();
  Future<FigureAge> futureFigureAge = fetchFigureAge();
  Future<List<Figures>> futureFigures = fetchFigures();
  List<Circle> circles = [];

  Widget Statistique(BuildContext context) {
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
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  activeColor: Color.fromRGBO(84, 84, 84, 1),
                  activeSize: 10,
                  space: 2,
                  color: Colors.grey.shade200)),
          itemBuilder: (BuildContext context, int index) {
            return widgetList[index];
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    figures.map((e) {
      circles.add(
          Circle(
              circleId: CircleId(e.id.toString()),
              center: LatLng(double.parse(e.y),
                  double.parse(e.x)),
              fillColor: Color.fromARGB(70, 150, 50, 50),
              strokeColor: Colors.red,
              radius: 1000,
              strokeWidth: 1,
              consumeTapEvents: true
          )
      );
    });

    circles.add(
        Circle(
            circleId: CircleId('r'),
            center: LatLng(5.37796973150617,
                -3.96620526419914),
            fillColor: Color.fromARGB(70, 150, 50, 50),
            strokeColor: Colors.red,
            radius: 1000,
            strokeWidth: 1,
            consumeTapEvents: true
        )
    );

    widgetList.add(firstStatistiquePage(context, futureFigure));
    widgetList.add(
        secondStatistiquePage(context, futureFigureGlobal, futureFigureSex));
    widgetList.add(thirdStatistiquePage(context, futureFigureAge, futureFigures, circles, figures));
    return new Scaffold(
      key: _globalKey,
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
                  child: FutureBuilder<FigureCI>(
                    future: futureFigure,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return header('Point de la situation COVID-19\n' +
                            date);
                      }
                      else if (snapshot.hasError) {
                        print("${snapshot.error}");
                        return CircularProgressIndicator();
                        return Text("${snapshot.error}");
                      }
                      return CircularProgressIndicator();
                    },
                  )),
              body: Statistique(context))),
    );
  }
}
