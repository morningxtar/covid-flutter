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

import '../../splash_screen.dart';
import 'first_stat_slide.dart';
import 'second_stat_slide.dart';
import 'third_stat_slide.dart';

class Statistiques extends StatefulWidget {
  @override
  _StatistiquesState createState() => _StatistiquesState();
}

class _StatistiquesState extends State<Statistiques> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  SwiperController controller;
  List<SwiperController> controllers;
  List<Widget> widgetList = [];

  Future<FigureCI> futureFigure;

  Future<List<FigureGlobals>> futureFigureGlobal;

  Future<FigureSex> futureFigureSex;

  Future<FigureAge> futureFigureAge;

  Future<List<Figures>> futureFigures;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      futureFigure = fetchFigure();
      futureFigureGlobal = fetchFigureGlobal();
      futureFigureSex = fetchFigureSex();
      futureFigureAge = fetchFigureAge();
      futureFigures = fetchFigures();
    });
  }

  Widget Statistique(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: SizedBox(
        child: Swiper(
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
            return Center(child: widgetList[index]);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    print(date);
    widgetList.add(firstStatistiquePage(context, futureFigure, figureTest, futureFigureGlobal));
    widgetList.add(
        secondStatistiquePage(context, futureFigureGlobal, futureFigureSex));
    widgetList.add(thirdStatistiquePage(
        context, futureFigureAge, figures));
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
                  child: (date != null)
                      ? header('Point de la situation COVID-19\n' + date)
                      : FutureBuilder<FigureCI>(
                          future: futureFigure,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return header('Point de la situation COVID-19\n' +
                                  snapshot.data.date_update);
                            } else
                              return header('Chargement ...');
                          },
                        )),
              body: Statistique(context))),
    );
  }
}
