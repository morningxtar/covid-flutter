import 'package:covid19stat/models/FigureCI.dart';
import 'package:covid19stat/screens/bonasavoir/bon_a_savoir.dart';
import 'package:covid19stat/screens/statistiques/statistiques.dart';
import 'package:covid19stat/screens/zone_geo.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'notications/notifications.dart';

Widget drawer(BuildContext context) {
  return SizedBox(
    width: 300,
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/drawerhead.jpg"),
                    fit: BoxFit.contain)
            ),
            child: null,
          ),
          Visibility(
            visible: true,
            child: new ListTile(
              title: Text(
                "Statistiques",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    color: Color.fromRGBO(75, 75, 75, 0.8)),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Statistiques()),
                );
              },
              leading: Icon(
                Icons.dashboard,
                color: Color.fromRGBO(71, 71, 70, 0.8),
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: new ListTile(
              title: new Text(
                'Zones touchées',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    color: Color.fromRGBO(75, 75, 75, 0.8)),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Zone()),
                );
              },
              leading: Icon(
                Icons.map,
                color: Color.fromRGBO(71, 71, 70, 0.8),
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: new ListTile(
              title: new Text(
                'Bon à savoir',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    color: Color.fromRGBO(75, 75, 75, 0.8)),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BonASavoir()),
                );
              },
              leading: Icon(
                Icons.video_library,
                color: Color.fromRGBO(71, 71, 70, 0.8),
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: new ListTile(
              title: new Text(
                'Partager',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    color: Color.fromRGBO(75, 75, 75, 0.8)),
              ),
              onTap: () {
                Share.share('check out my website https://example.com');
              },
              leading: Icon(
                Icons.share,
                color: Color.fromRGBO(71, 71, 70, 0.8),
              ),
            ),
          ),
          Visibility(
            visible: true,
            child: new ListTile(
              title: new Text(
                'Notifications',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    color: Color.fromRGBO(75, 75, 75, 0.8)),
              ),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Notifications()),
                );
              },
              leading: Icon(
                Icons.notifications_active,
                color: Color.fromRGBO(71, 71, 70, 0.8),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
