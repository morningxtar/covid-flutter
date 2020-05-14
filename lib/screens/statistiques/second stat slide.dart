import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget secondStatistiquePage(BuildContext context) {
  ScreenUtil.instance = ScreenUtil.getInstance()
    ..init(context);
  ScreenUtil.instance =
      ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

  return Container(
    child: Column(
      children: <Widget>[
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height / 10,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Colors.white,
        ),
        Container(
          height: MediaQuery
              .of(context)
              .size
              .height / 12,
          width: MediaQuery
              .of(context)
              .size
              .width,
          color: Color.fromRGBO(59, 170, 53, 0.8),
          child: Text(
            'Point de la situation COVID-19\n 01 Mai 2020',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 18),
          ),
        ),
      ],
    ),
  );
}