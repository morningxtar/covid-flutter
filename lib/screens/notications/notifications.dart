import 'package:covid19stat/screens/appbar.dart';
import 'package:covid19stat/screens/drawer.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Notifications extends StatefulWidget {
  static final String routeName = 'notification';

  Notifications();

  @override
  NotificationState createState() => NotificationState();
}

class NotificationState extends State<Notifications> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  PageController _controller = PageController(
    initialPage: 0,
  );
  double currentPage = 0;

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        currentPage = 0;
      });
    });
    super.initState();
  }

  Widget notification() {
    ScreenUtil.instance = ScreenUtil.getInstance()
      ..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: new PageView(
        controller: _controller,
        children: [

        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _globalKey,
      appBar: appbar('Notification'),
      drawer: prefix0.drawer(context),
      body: Notifications(),
    );
  }
}
