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
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Zone extends StatefulWidget {
  @override
  _ZoneStateState createState() => _ZoneStateState();
}

class _ZoneStateState extends State<Zone> {
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey<ScaffoldState>();

  GoogleMapController mapController;

  final LatLng _center = const LatLng(5.37796973150617, -3.96620526419914);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<Circle> circles = [];
  List<Marker> markers = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  Widget Statistique(BuildContext context) {
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    for (var i = 0; i < figures.length; i++) {
      circles.add(Circle(
        circleId: CircleId(figures[i].id.toString()),
        center: LatLng(double.parse(figures[i].y), double.parse(figures[i].x)),
        fillColor: Color.fromARGB(70, 150, 50, 50),
        strokeColor: Colors.red,
        radius: 2000,
        strokeWidth: 1,
        consumeTapEvents: true,
      ));

      markers.add(Marker(
        markerId: MarkerId(figures[i].id.toString()),
        position:
            LatLng(double.parse(figures[i].y), double.parse(figures[i].x)),
        infoWindow: InfoWindow(
            title: figures[i].localite,
            snippet: figures[i].nbre_cas.toString() + ' cas'),
      ));
    }

    Set<Circle> circle = Set.from(circles);
    Set<Marker> marker = Set.from(markers);

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: true,
        body: SizedBox(
            child: Center(
          child: Container(
            child: GoogleMap(
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                rotateGesturesEnabled: true,
                scrollGesturesEnabled: true,
                gestureRecognizers: Set()
                  ..add(Factory<PanGestureRecognizer>(
                      () => PanGestureRecognizer()))
                  ..add(Factory<VerticalDragGestureRecognizer>(
                      () => VerticalDragGestureRecognizer())),
                tiltGesturesEnabled: true,
                trafficEnabled: true,
                onMapCreated: _onMapCreated,
                mapToolbarEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 9,
                ),
                circles: circle,
                markers: marker),
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _globalKey,
      appBar: appbar('Zone touchées'),
      bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 28,
          color: Colors.white,
          child: footer(context)),
      drawer: prefix0.drawer(context),
      body: Scaffold(
          appBar: headerLogo(context),
          body: Statistique(context)),
    );
  }
}
