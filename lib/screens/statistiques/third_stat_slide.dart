import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


Widget thirdStatistiquePage(BuildContext context) {
  ScreenUtil.instance = ScreenUtil.getInstance()
    ..init(context);
  ScreenUtil.instance =
      ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

  GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  return Container(
    child: Column(
      children: <Widget>[
        Text('Répartition des cas confirmées par tranche d\'âge'),
        Container(
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 8,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 10,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '27%',
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 8,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 10,
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          '51%',
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
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 8,
                          height: MediaQuery
                              .of(context)
                              .size
                              .height / 10,
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '61%',
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
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom: 3),
          child: Text(
            'Répartition géographique des cas confirmés',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.height / 3,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                ),
              ),
              Container(
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10, bottom: 5),
          child: Text(
            'Services spécifiques',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}
