import 'package:auto_size_text/auto_size_text.dart';
import 'package:covid19stat/apis/fetchDatas.dart';
import 'package:covid19stat/models/FigureCI.dart';
import 'package:covid19stat/models/alert.dart';
import 'package:covid19stat/screens/appbar.dart';
import 'package:covid19stat/screens/drawer.dart' as prefix0;
import 'package:covid19stat/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../footer.dart';
import '../header.dart';

class Notifications extends StatefulWidget {
  @override
  NotificationsState createState() => NotificationsState();
}

class NotificationsState extends State<Notifications> {
  // PageController _controller = PageController(
  //   initialPage: 0,
  // );
  double currentPage = 0;
  Future<List<Alert>> futureAlerts;

  @override
  void initState() {
    super.initState();
    futureAlerts = fetchAlerts();
  }

  Widget notification(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    print(alerts.length);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: (alerts.isNotEmpty)
          ? ListView.builder(
              itemCount: alerts.length,
              itemBuilder: (context, int index) {
                return notif(context, alerts[index]);
              },
            )
          : FutureBuilder<List<Alert>>(
          future: futureAlerts,
          builder: (context, snapshot) {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, int i){
                  return notif(context, snapshot.data[i]);
                },

              );
            }
            else
              return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget notif(context, Alert alert) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Center(
              child: Text(
                alert.title.toString(),
                style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.w800,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: AutoSizeText(
                alert.content.toString(),
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Center(
              child: AutoSizeText(
                alert.date.toString(),
                style: TextStyle(
                    color: Colors.red.shade300,
                    fontWeight: FontWeight.w800,
                    fontSize: 15),
              ),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  child: header('Alerte infos')),
              body: notification(context))),
    );
  }
}
