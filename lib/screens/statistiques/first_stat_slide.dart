import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget firstStatistiquePage(BuildContext context) {
  ScreenUtil.instance = ScreenUtil.getInstance()
    ..init(context);
  ScreenUtil.instance =
      ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

  return Container(
    child: Column(
      children: <Widget>[
        Container(
          padding:
          EdgeInsets.only(top: MediaQuery
              .of(context)
              .size
              .height / 30),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/standorange.jpg',
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 10,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 13,
                    ),
                    Text(
                      '58',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(239, 124, 1, 1),
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .width / 16),
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 10,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 13,
                    ),
                    Text(
                      '58',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(59, 170, 53, 1),
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .width / 16),
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
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 10,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height / 13,
                    ),
                    Text(
                      '58',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(40, 40, 40, 1),
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .width / 16),
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
          padding:
          EdgeInsets.only(top: MediaQuery
              .of(context)
              .size
              .height / 55),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Text(
                  'Soit un total\n général de :',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 4,
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 7,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(205, 215, 223, 1),
                    shape: BoxShape.circle),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '721',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(35, 35, 35, 1),
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .width / 13),
                    ),
                    Text(
                      'personne\n en traitement',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(35, 35, 35, 1),
                          fontSize: MediaQuery
                              .of(context)
                              .size
                              .width / 35),
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
          padding:
          EdgeInsets.only(top: MediaQuery
              .of(context)
              .size
              .height / 45, bottom: MediaQuery
              .of(context)
              .size
              .height / 40),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 4,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 7,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(239, 124, 1, 0.8),
                      shape: BoxShape.circle),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '1333',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 13),
                      ),
                      Text(
                        'cas\n confirmés',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 35),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 4,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 7,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(59, 170, 53, 1),
                      shape: BoxShape.circle),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '721',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 13),
                      ),
                      Text(
                        'personnes\n guéries',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 35),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 4,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 7,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(40, 40, 40, 1),
                      shape: BoxShape.circle),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '15',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 13),
                      ),
                      Text(
                        'personnes\n décédées',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 35),
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
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .width / 34),
          ),
        )
      ],
    ),
  );
}