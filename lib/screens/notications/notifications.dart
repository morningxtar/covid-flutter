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
      body: Text('data'),
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
