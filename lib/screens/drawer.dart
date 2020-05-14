import 'package:flutter/material.dart';

import 'notications/notifications.dart';

Widget drawer(BuildContext context) {
  return SizedBox(
    width: 300,
    child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Drawer Header'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
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
                Navigator.of(context).pop();
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
                'Notifications',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                    color: Color.fromRGBO(75, 75, 75, 0.8)),
              ),
              onTap: () {
                Navigator.of(context).pop();
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
