import 'package:flutter/material.dart';

const String _AccountName = 'Aravind Vemula';
const String _AccountEmail = 'vemula.aravind336@gmail.com';
const String _AccountAbbr = 'AV';

class KeeperDrawer extends StatelessWidget {
  Drawer drawer = new Drawer(
      child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: const Text(_AccountName),
              accountEmail: const Text(_AccountEmail),
              currentAccountPicture: new CircleAvatar(
                  backgroundColor: Colors.brown,
                  child: new Text(_AccountAbbr)
              ),
            )
          ]
      )
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        drawer: drawer,
        appBar: new AppBar(
          title: new Text('Keeper'),
        ),
        body: new Center(
            child: new Text('Hello World!')
        )
    );
  }
}