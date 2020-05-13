import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

class Statistiques extends StatefulWidget {
  @override
  StatistiqueState createState() => StatistiqueState();
}

class StatistiqueState extends State<Statistiques> {
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

  Widget Statistique() {
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
          firstStatistiquePage(),
          secondStatistiquePage(),
          thirdStatistiquePage(),
        ],
      ),
    );
  }

  Widget firstStatistiquePage() {
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
          Container(
            padding:
            EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height / 30),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/standorange.jpg',
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 10,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 13,
                      ),
                      Text(
                        '58',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(239, 124, 1, 0.8),
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 16),
                      ),
                      Text(
                        'nouveaux cas\n confirmés',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(239, 124, 1, 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/standgreen.jpg',
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 10,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 13,
                      ),
                      Text(
                        '58',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(76, 174, 6, 0.8),
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 16),
                      ),
                      Text(
                        'nouveaux\n guéris',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(76, 174, 6, 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/standblack.jpg',
                        width: MediaQuery
                            .of(context)
                            .size
                            .width / 10,
                        height: MediaQuery
                            .of(context)
                            .size
                            .height / 13,
                      ),
                      Text(
                        '58',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            color: Color.fromRGBO(40, 40, 40, 0.8),
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 16),
                      ),
                      Text(
                        'nouveaux\n décès',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(40, 40, 40, 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            indent: 10,
            endIndent: 10,
          ),
          Container(
            padding:
            EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height / 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text(
                    'Soit un total\n général de :',
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width / 4,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 7,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(205, 215, 223, 0.8),
                      shape: BoxShape.circle),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '721',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(35, 35, 35, 0.8),
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 13),
                      ),
                      Text(
                        'personne\n en traitement',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(35, 35, 35, 0.8),
                            fontSize: MediaQuery
                                .of(context)
                                .size
                                .width / 35),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            indent: 10,
            endIndent: 10,
          ),
          Container(
            padding:
            EdgeInsets.only(top: MediaQuery
                .of(context)
                .size
                .height / 45, bottom: MediaQuery
                .of(context)
                .size
                .height / 40),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 4,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 7,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(239, 124, 1, 0.8),
                        shape: BoxShape.circle),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '1333',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 13),
                        ),
                        Text(
                          'cas\n confirmés',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 35),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 4,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 7,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(76, 174, 6, 0.8),
                        shape: BoxShape.circle),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '721',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 13),
                        ),
                        Text(
                          'personnes\n guéries',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 35),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width / 4,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height / 7,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(40, 40, 40, 0.8),
                        shape: BoxShape.circle),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '15',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 13),
                        ),
                        Text(
                          'personnes\n décédées',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 35),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Text(
              'Sources : Ministère de la Santé et de l\'Hygiène publique',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(40, 40, 40, 0.8),
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .width / 34),
            ),
          )
        ],
      ),
    );
  }

  Widget secondStatistiquePage() {
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

  Widget thirdStatistiquePage() {
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: new Text('Statistiques',
            style: TextStyle(
                fontFamily: "Poppins-Bold",
                //color: appTheme.primaryColor,
                //fontSize: ScreenUtil.getInstance().setSp(46),
                letterSpacing: .9,
                fontWeight: FontWeight.bold)), backgroundColor: Color.fromRGBO(227, 234, 240, 0.8),
        actions: <Widget>[],
      ),
      drawer: SizedBox(
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
      ),
      body: Statistique(),
    );
  }
}
