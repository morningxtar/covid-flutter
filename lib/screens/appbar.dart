import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget appbar(String onglet){
  return AppBar(
    title: new Text(onglet,
        style: TextStyle(
            fontFamily: "Poppins-Bold",
            //color: appTheme.primaryColor,
            //fontSize: ScreenUtil.getInstance().setSp(46),
            letterSpacing: .9,
            fontWeight: FontWeight.bold)), backgroundColor: Color.fromRGBO(227, 234, 240, 0.8),
    actions: <Widget>[],
  );
}