import 'dart:ffi';

import 'package:covid19stat/screens/appbar.dart';
import 'package:covid19stat/screens/drawer.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Notifications extends StatelessWidget {

  PageController _controller = PageController(
    initialPage: 0,
  );
  double currentPage = 0;

  Widget notification(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()
      ..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: ListView(
        children: <Widget>[
          notif(context),
          notif(context),
          notif(context),
          notif(context),
          notif(context),
          notif(context),
          notif(context),
        ],
      ),
    );
  }

  Widget notif(context){
    return Card(
      child: Container(
        height: 160,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Text("Propagation du couvre-feu",style: TextStyle(color: Colors.orange,fontWeight: FontWeight.w800,fontSize:17),),
            SizedBox(height: 10,),
            Container(
                child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, uis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in eprehenderit in vose cillum djhd dihbd hibdi olore ",),
              ),
            SizedBox(height: 10,),
            Row(
              children: <Widget>[
                SizedBox(width: 30,),
                Text("du 25 avril au 8 mai 2020, de 21H à 5H",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize:17 ),),            
                Expanded(
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Icon(Icons.arrow_drop_down, size: 20,),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                        shape: BoxShape.circle,
                        color: Color(0xFFffffff)),
                  )
                )
              ],
            ),

            SizedBox(height: 10,),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appbar('Notification'),
      drawer: prefix0.drawer(context),
      body: notification(context),
    );
  }
}
