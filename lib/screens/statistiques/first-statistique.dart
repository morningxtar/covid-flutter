import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Statistiques extends StatefulWidget {
  @override
  StatistiqueState createState() => StatistiqueState();
}

class StatistiqueState extends State<Statistiques> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  Widget Statistique() {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);
    return new Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: Text('fddfdf'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _globalKey,
      drawer: SizedBox(
        width: 350.0,
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: new Text('rrt', style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w700,),),
                accountEmail: new Text('etrt'),
                currentAccountPicture: new CircleAvatar(
                  backgroundImage: new NetworkImage('http://i.pravatar.cc/300'),
                  //backgroundImage: new AssetImage(UIData.pkImage),
                ),
              ),
              Visibility(
                visible: true,
                child: new ListTile(
                  title: Text(
                    "Tableau de Bord",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  leading: Icon(
                    Icons.dashboard,
                    color: Colors.red,
                  ),
                ),
              ),
              Visibility(
                visible: true,
                child: new ListTile(
                  title: new Text('Nouvelle Admission',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),),
                  onTap: () {
                    Navigator.of(context).pop();

                  },
                  leading: Icon(
                    Icons.accessible,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Statistique(),
    );
  }
}
