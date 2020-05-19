import 'dart:ui';

import 'package:covid19stat/apis/fetchDatas.dart';
import 'package:covid19stat/models/FigureAge.dart';
import 'package:covid19stat/models/Figures.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

Widget thirdStatistiquePage(
    BuildContext context, Future<FigureAge> futureFigureAge, Future<List<Figures>> futureFigures) {
  ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
  ScreenUtil.instance =
      ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

  GoogleMapController mapController;

  final LatLng _center = const LatLng(5.37796973150617, -3.96620526419914);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<Circle> circlesOr = [];

  return Container(
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text('Répartition des cas confirmées par tranche d\'âge'),
        ),
        FutureBuilder<FigureAge>(
          future: futureFigureAge,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                padding: EdgeInsets.only(left: 5),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Image.asset(
                                'assets/images/tranche1.jpg',
                                width: MediaQuery.of(context).size.width / 8,
                                height: MediaQuery.of(context).size.height / 10,
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                snapshot.data.pourc_nbre_0_30 + '%',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(239, 124, 1, 1)),
                              ),
                              Text(
                                'De 0\n à 30 ans',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(35, 35, 35, 1)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/tranche2.jpg',
                                width: MediaQuery.of(context).size.width / 8,
                                height: MediaQuery.of(context).size.height / 10,
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                snapshot.data.pourc_nbre_31_50 + '%',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(80, 176, 75, 1)),
                              ),
                              Text(
                                'De 31\n à 50 ans',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(35, 35, 35, 1)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                'assets/images/tranche3.jpg',
                                width: MediaQuery.of(context).size.width / 8,
                                height: MediaQuery.of(context).size.height / 10,
                              )
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                snapshot.data.pourc_nbre_51_plus + '%',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(191, 192, 193, 1)),
                              ),
                              Text(
                                'De 51\n et plus',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(36, 35, 35, 1)),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
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
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 3),
          child: Text(
            'Répartition géographique des cas confirmés',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Row(
            children: <Widget>[
              FutureBuilder<List<Figures>>(
                future: futureFigures,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    snapshot.data.map((commune) {
                      circlesOr.add(
                          Circle(
                              circleId: CircleId(commune.id.toString()),
                              center: LatLng(commune.x, commune.y),
                              fillColor: Color.fromARGB(70, 150, 50, 50),
                              strokeColor: Colors.red,
                              radius: 1000,
                              strokeWidth: 1,consumeTapEvents: true
                          )
                      );
                    }).toList();
                    Set<Circle> circles = Set.from(circlesOr);
                    return Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: MediaQuery.of(context).size.height / 3.5,
                      child: GoogleMap(
                        zoomControlsEnabled: true,
                        zoomGesturesEnabled: true,
                        rotateGesturesEnabled: true,
                        scrollGesturesEnabled: true,
                        tiltGesturesEnabled: true,
                        trafficEnabled: true,
                        onMapCreated: _onMapCreated,
                        mapToolbarEnabled: true,
                        initialCameraPosition: CameraPosition(
                          target: _center,
                          zoom: 10,
                        ),
                        circles: circles,
                      ),
                    );
                  }
                  else if (snapshot.hasError) {
                    print("${snapshot.error}");
                    return CircularProgressIndicator();
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2.2,
                height: MediaQuery.of(context).size.height / 3.5,
                color: Color.fromRGBO(227, 234, 240, 1),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: AutoSizeText(
                      'Au 29 Avril 2020, 16 districts sur les\n 29 districts sanitaires affectés depuis\n'
                      ' le debut de la pandemie, sont actifs :\n Les 10 districts d`\'Abidjan\n'
                      '- Adiaké\n - Agboville\n - Akoupé\n - Duékoué\n - GrandBassam\n - San Pédro'
                      '\n\n 95% des cas confirmés sont dans la\n région d\'Abidjan'
                      '\n\n 39% dans cas confirmés sont localisés\n dans le disstrict de Cocody Bingerville',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            'Services spécifiques',
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 5, right: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Cocody',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(59, 170, 53, 1)),
                          ),
                          Text(
                            ' (Saint Jean)',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 50),
                      Row(
                        children: <Widget>[
                          Text(
                            'Marcory',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(59, 170, 53, 1)),
                          ),
                          Text(
                            ' (Cap Sud)',
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          'Treicheville',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(59, 170, 53, 1)),
                        ),
                        Text(
                          ' (Gare de Bondoukou)',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height / 50),
                    Row(
                      children: <Widget>[
                        Text(
                          'Yopougon',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(59, 170, 53, 1)),
                        ),
                        Text(
                          ' (BAE)',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
