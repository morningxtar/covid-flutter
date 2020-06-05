import 'package:covid19stat/apis/fetchDatas.dart';
import 'package:covid19stat/models/FigureAge.dart';
import 'package:covid19stat/models/FigureCI.dart';
import 'package:covid19stat/models/FigureGlobals.dart';
import 'package:covid19stat/models/FigureSex.dart';
import 'package:covid19stat/models/Figures.dart';
import 'package:covid19stat/screens/appbar.dart';
import 'package:covid19stat/screens/drawer.dart' as prefix0;
import 'package:covid19stat/screens/footer.dart';
import 'package:covid19stat/screens/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class BonASavoir extends StatefulWidget {
  @override
  BonASavoirState createState() => BonASavoirState();
}

class BonASavoirState extends State<BonASavoir> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();
  SwiperController controller;
  List<SwiperController> controllers;
  List<Widget> widgetList = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
    });
  }

  Widget savoir(String title, String bon){
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: header(title)),
        body: Center(child: Image.asset(bon)));
  }

  Widget savoirs(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      body: SizedBox(
        child: Swiper(
          loop: false,
          itemCount: widgetList.length,
          controller: controller,
          pagination: new SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                  activeColor: Color.fromRGBO(84, 84, 84, 1),
                  activeSize: 10,
                  space: 2,
                  color: Colors.grey.shade200)),
          itemBuilder: (BuildContext context, int index) {
            return widgetList[index];
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    widgetList.add(savoir('Symptômes du coronavirus','assets/images/bon1.jpg'));
    widgetList.add(savoir('Mesure de prévention\n contre le coronavirus', 'assets/images/bon2.jpg'));
    widgetList.add(savoir('Protégeons-nous contre\n le coronavirus','assets/images/bon3.jpg'));
    widgetList.add(savoir('Le lavage des mains en 10 étapes','assets/images/bon4.jpg'));
    widgetList.add(savoir('Comment porter un masque médical\n en toute sécurité','assets/images/bon5.jpg'));

    return new Scaffold(
      key: _globalKey,
      appBar: appbar('Bon à Savoir'),
      bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 28,
          color: Colors.white,
          child: footer(context)),
      drawer: prefix0.drawer(context),
      body: Scaffold(
          appBar: headerLogo(context),
          body: savoirs(context)),
    );
  }
}
