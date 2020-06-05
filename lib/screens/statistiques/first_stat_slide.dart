import 'package:covid19stat/apis/fetchDatas.dart';
import 'package:covid19stat/models/FigureCI.dart';
import 'package:covid19stat/models/FigureGlobals.dart';
import 'package:covid19stat/screens/statistiques/second_stat_slide.dart';
import 'package:covid19stat/screens/statistiques/second_stat_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Widget firstStatistiquePage(
    BuildContext context, futureFigure, FigureCI figureTest, Future<List<FigureGlobals>> futureFigureGlobal) {
  ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
  ScreenUtil.instance =
      ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
//  return FutureBuilder<FigureCI>(
//    future: futureFigure,
//    builder: (context, snapshot) {
//      if (snapshot.hasData) {
  return (figureTest != null)
      ? Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 30),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/standorange.jpg',
                            width: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 13,
                          ),
                          Text(
                            figureTest.nouveau_cas_confirme.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(239, 124, 1, 1),
                                fontSize:
                                    MediaQuery.of(context).size.width / 16),
                          ),
                          Text(
                            'nouveaux cas\n confirmés',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(239, 124, 1, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/standgreen.jpg',
                            width: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 13,
                          ),
                          Text(
                            figureTest.nouveau_cas_gueri.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(59, 170, 53, 1),
                                fontSize:
                                    MediaQuery.of(context).size.width / 16),
                          ),
                          Text(
                            'nouveaux\n guéris',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(59, 170, 53, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/standblack.jpg',
                            width: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 13,
                          ),
                          Text(
                            figureTest.nouveau_cas_deces.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Color.fromRGBO(40, 40, 40, 1),
                                fontSize:
                                    MediaQuery.of(context).size.width / 16),
                          ),
                          Text(
                            'nouveaux\n décès',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              color: Color.fromRGBO(40, 40, 40, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 55),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Nombre\n d\'échantillons\n prélévés',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 10,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 7,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(59, 170, 53, 1),
                                shape: BoxShape.circle),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/echantil.jpg',
                                  width: MediaQuery.of(context).size.width / 10,
                                  height: MediaQuery.of(context).size.height / 13,
                                ),
                                (nombre == null)
                                    ? FutureBuilder<List<FigureGlobals>>(
                                  future: futureFigureGlobal,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        snapshot.data[3].nombre_prelevement,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize: MediaQuery.of(context)
                                                .size
                                                .width /
                                                35),
                                      );
                                    } else if (snapshot.hasError) {
                                      print("${snapshot.error}");
                                      return CircularProgressIndicator();
                                      return Text("${snapshot.error}");
                                    }
                                    // By default, show a loading spinner.
                                    return CircularProgressIndicator();
                                  },
                                )
                                    : Text(
                                  nombre,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize:
                                      MediaQuery.of(context).size.width / 35),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Nombre\n de personnes\n en traitement',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 10,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.height / 7,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(205, 215, 223, 1),
                          shape: BoxShape.circle),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            figureTest.cas_actif.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(35, 35, 35, 1),
                                fontSize:
                                    MediaQuery.of(context).size.width / 13),
                          ),
                          Text(
                            'personnes\n en traitement',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(35, 35, 35, 1),
                                fontSize:
                                    MediaQuery.of(context).size.width / 35),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                indent: 10,
                endIndent: 10,
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 45,
                    bottom: MediaQuery.of(context).size.height / 40),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 7,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(239, 124, 1, 0.8),
                            shape: BoxShape.circle),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              figureTest.cas_confirme.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 13),
                            ),
                            Text(
                              'cas\n confirmés',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 35),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 7,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(59, 170, 53, 1),
                            shape: BoxShape.circle),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              figureTest.cas_gueri.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 13),
                            ),
                            Text(
                              'personnes\n guéries',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 35),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width / 4,
                        height: MediaQuery.of(context).size.height / 7,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(40, 40, 40, 1),
                            shape: BoxShape.circle),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              figureTest.cas_deces.toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 13),
                            ),
                            Text(
                              'personnes\n décédées',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize:
                                      MediaQuery.of(context).size.width / 35),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Text(
                  'Sources : Ministère de la Santé et de l\'Hygiène publique',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(40, 40, 40, 1),
                      fontSize: MediaQuery.of(context).size.width / 34),
                ),
              )
            ],
          ),
        )
      : FutureBuilder(
          future: futureFigure,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 30),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/standorange.jpg',
                                  width: MediaQuery.of(context).size.width / 10,
                                  height:
                                      MediaQuery.of(context).size.height / 13,
                                ),
                                Text(
                                  snapshot.data.nouveau_cas_confirme.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromRGBO(239, 124, 1, 1),
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              16),
                                ),
                                Text(
                                  'nouveaux cas\n confirmés',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(239, 124, 1, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/standgreen.jpg',
                                  width: MediaQuery.of(context).size.width / 10,
                                  height:
                                      MediaQuery.of(context).size.height / 13,
                                ),
                                Text(
                                  snapshot.data.nouveau_cas_gueri.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromRGBO(59, 170, 53, 1),
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              16),
                                ),
                                Text(
                                  'nouveaux\n guéris',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(59, 170, 53, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/standblack.jpg',
                                  width: MediaQuery.of(context).size.width / 10,
                                  height:
                                      MediaQuery.of(context).size.height / 13,
                                ),
                                Text(
                                  snapshot.data.nouveau_cas_deces.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Color.fromRGBO(40, 40, 40, 1),
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              16),
                                ),
                                Text(
                                  'nouveaux\n décès',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    color: Color.fromRGBO(40, 40, 40, 1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 55),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Nombre d\'échantillons prélévés',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 10,
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width / 4,
                                  height: MediaQuery.of(context).size.height / 7,
                                  decoration: BoxDecoration(
                                      color: Color.fromRGBO(59, 170, 53, 1),
                                      shape: BoxShape.circle),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        'assets/images/echantil.jpg',
                                        width: MediaQuery.of(context).size.width / 10,
                                        height: MediaQuery.of(context).size.height / 13,
                                      ),
                                      (nombre == null)
                                          ? FutureBuilder<List<FigureGlobals>>(
                                        future: futureFigureGlobal,
                                        builder: (context, snapshot) {
                                          if (snapshot.hasData) {
                                            return Text(
                                              snapshot.data[3].nombre_prelevement,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                      35),
                                            );
                                          } else if (snapshot.hasError) {
                                            print("${snapshot.error}");
                                            return CircularProgressIndicator();
                                            return Text("${snapshot.error}");
                                          }
                                          // By default, show a loading spinner.
                                          return CircularProgressIndicator();
                                        },
                                      )
                                          : Text(
                                        nombre,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontSize:
                                            MediaQuery.of(context).size.width / 35),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.height / 7,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(205, 215, 223, 1),
                                shape: BoxShape.circle),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  snapshot.data.cas_actif.toString(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(35, 35, 35, 1),
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              13),
                                ),
                                Text(
                                  'personnes\n en traitement',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(35, 35, 35, 1),
                                      fontSize:
                                          MediaQuery.of(context).size.width /
                                              35),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      indent: 10,
                      endIndent: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 45,
                          bottom: MediaQuery.of(context).size.height / 40),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(239, 124, 1, 0.8),
                                  shape: BoxShape.circle),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.cas_confirme.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                13),
                                  ),
                                  Text(
                                    'cas\n confirmés',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                35),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(59, 170, 53, 1),
                                  shape: BoxShape.circle),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.cas_gueri.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                13),
                                  ),
                                  Text(
                                    'personnes\n guéries',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                35),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width / 4,
                              height: MediaQuery.of(context).size.height / 7,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(40, 40, 40, 1),
                                  shape: BoxShape.circle),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    snapshot.data.cas_deces.toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                13),
                                  ),
                                  Text(
                                    'personnes\n décédées',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                35),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Sources : Ministère de la Santé et de l\'Hygiène publique',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(40, 40, 40, 1),
                            fontSize: MediaQuery.of(context).size.width / 34),
                      ),
                    )
                  ],
                ),
              );
            } else if (snapshot.hasError) {
              print("${snapshot.error}");
              return CircularProgressIndicator();
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          },
        );
//      } else if (snapshot.hasError) {
//        print("${snapshot.error}");
//        return CircularProgressIndicator();
//        return Text("${snapshot.error}");
//      }
//      return CircularProgressIndicator();
//    },
//  );
}
