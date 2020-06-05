import 'package:covid19stat/apis/fetchDatas.dart';
import 'package:covid19stat/models/FigureGlobals.dart';
import 'package:covid19stat/models/FigureSex.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TabStat {
  String region;
  String confirmedCas;
  String guerison;
  String deces;

  TabStat({
    this.region,
    this.confirmedCas,
    this.guerison,
    this.deces,
  });

  static List<TabStat> getStat() {
    return <TabStat>[
      TabStat(
          region: 'Monde',
          confirmedCas: '3 303 296',
          guerison: '1 038 588',
          deces: '285 290'),
      TabStat(
          region: 'Afrique',
          confirmedCas: '39 018',
          guerison: '12 750',
          deces: '1 640'),
      TabStat(
          region: 'Afrique de l\Ouest',
          confirmedCas: '10 395',
          guerison: '3 140',
          deces: '244'),
      TabStat(
          region: 'Côte d\'Ivoire',
          confirmedCas: '1 353',
          guerison: '597',
          deces: '15'),
    ];
  }
}

Widget secondStatistiquePage(
    BuildContext context,
    Future<List<FigureGlobals>> futureFigureGlobal,
    Future<FigureSex> futureFigureSex) {
  List<TabStat> tabStat;
  tabStat = TabStat.getStat();

  int maxTauxGueri;
  int maxTauxDeces;
  print('aaa' + futGlob.length.toString());
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height / 40,
              bottom: MediaQuery.of(context).size.height / 100,
              left: MediaQuery.of(context).size.width / 50),
          child: Text(
            'Statistiques globales',
            textAlign: TextAlign.start,
            textScaleFactor: 1,
          ),
        ),
        (futGlob.isEmpty) ? FutureBuilder<List<FigureGlobals>>(
            future: futureFigureGlobal,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 25,
                      right: MediaQuery.of(context).size.width / 25),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                        columnSpacing: 5,
                        headingRowHeight:
                            MediaQuery.of(context).size.height / 20,
                        dataRowHeight: MediaQuery.of(context).size.height / 30,
                        horizontalMargin:
                            MediaQuery.of(context).size.height / 30,
                        columns: [
                          DataColumn(
                            label: Text(
                              "Pays / Région",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                            ),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text(
                              "Cas confirmés",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                            ),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text(
                              "Guérisons",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                            ),
                            numeric: false,
                          ),
                          DataColumn(
                            label: Text(
                              "Décès",
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 30),
                            ),
                            numeric: false,
                          ),
                        ],
                        rows: snapshot.data
                            .map((figureGlobal) => DataRow(cells: [
                                  DataCell(Text(
                                    figureGlobal.entite,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                35),
                                  )),
                                  DataCell(Text(
                                    figureGlobal.cas_confirme,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                35,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text(
                                    figureGlobal.cas_gueri,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                35,
                                        fontWeight: FontWeight.bold),
                                  )),
                                  DataCell(Text(
                                    figureGlobal.cas_deces,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                35,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ]))
                            .toList()),
                  ),
                );
              } else if (snapshot.hasError) {
                print("${snapshot.error}");
                return CircularProgressIndicator();
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }) : Container(
          padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 25,
              right: MediaQuery.of(context).size.width / 25),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columnSpacing: 5,
                headingRowHeight:
                MediaQuery.of(context).size.height / 20,
                dataRowHeight: MediaQuery.of(context).size.height / 30,
                horizontalMargin:
                MediaQuery.of(context).size.height / 30,
                columns: [
                  DataColumn(
                    label: Text(
                      "Pays / Région",
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.width / 30),
                    ),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text(
                      "Cas confirmés",
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.width / 30),
                    ),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text(
                      "Guérisons",
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.width / 30),
                    ),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text(
                      "Décès",
                      style: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.width / 30),
                    ),
                    numeric: false,
                  ),
                ],
                rows: futGlob
                    .map((figureGlobal) => DataRow(cells: [
                  DataCell(Text(
                    figureGlobal.entite,
                    style: TextStyle(
                        fontSize:
                        MediaQuery.of(context).size.width /
                            35),
                  )),
                  DataCell(Text(
                    figureGlobal.cas_confirme,
                    style: TextStyle(
                        fontSize:
                        MediaQuery.of(context).size.width /
                            35,
                        fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(
                    figureGlobal.cas_gueri,
                    style: TextStyle(
                        fontSize:
                        MediaQuery.of(context).size.width /
                            35,
                        fontWeight: FontWeight.bold),
                  )),
                  DataCell(Text(
                    figureGlobal.cas_deces,
                    style: TextStyle(
                        fontSize:
                        MediaQuery.of(context).size.width /
                            35,
                        fontWeight: FontWeight.bold),
                  )),
                ]))
                    .toList()),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Divider(
            height: 2,
            thickness: 2,
            indent: MediaQuery.of(context).size.width / 25,
            endIndent: MediaQuery.of(context).size.width / 25,
            color: Colors.black,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(right: 5, bottom: 10, top: 10),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Taux de guérison',
                      style: TextStyle(color: Color.fromRGBO(78, 172, 54, 1)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2),
                      child: Divider(
                        height: 2,
                        thickness: 2,
                        color: Colors.black,
                      ),
                    ),
                    FutureBuilder<List<FigureGlobals>>(
                      future: futureFigureGlobal,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          maxTauxGueri = getMaxTauxGueri(snapshot.data);
                          print('ultime ' + tabGue[0].toString());
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: snapshot.data.map((figureGlobal) {
                              return Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 5, right: 10),
                                    child: Text(
                                      figureGlobal.entite,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40,
                                          color:
                                              Color.fromRGBO(78, 172, 54, 1)),
                                    ),
                                  ),
                                  StepProgressIndicator(
                                    totalSteps: maxTauxGueri,
                                    currentStep:
                                        int.parse(figureGlobal.taux_gueri),
                                    size: 5,
                                    padding: 0,
                                    unselectedSize: 0,
                                    selectedColor:
                                        Color.fromRGBO(78, 172, 54, 1),
                                    progressDirection: TextDirection.ltr,
                                  ),
                                  Text(
                                    figureGlobal.taux_gueri + '%',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                40,
                                        color: Color.fromRGBO(78, 172, 54, 1)),
                                  ),
                                ],
                              );
                            }).toList(),
                          );
                        } else if (snapshot.hasError) {
                          print("${snapshot.error}");
                          return CircularProgressIndicator();
                          return Text("${snapshot.error}");
                        }
                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      },
                    )
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      'Taux de décès',
                      style: TextStyle(color: Color.fromRGBO(44, 44, 44, 1)),
                    ),
                    Divider(
                      height: 2,
                    ),
                    FutureBuilder<List<FigureGlobals>>(
                      future: futureFigureGlobal,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          maxTauxDeces = getMaxTauxDeces(snapshot.data);
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: snapshot.data.map((figureGlobal) {
                              return Row(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.only(left: 5, right: 10),
                                    child: Text(
                                      figureGlobal.entite,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              40,
                                          color: Color.fromRGBO(44, 44, 44, 1)),
                                    ),
                                  ),
                                  StepProgressIndicator(
                                    totalSteps: maxTauxDeces,
                                    currentStep:
                                        int.parse(figureGlobal.taux_deces),
                                    size: 5,
                                    padding: 0,
                                    unselectedSize: 0,
                                    selectedColor:
                                        Color.fromRGBO(44, 44, 44, 1),
                                    progressDirection: TextDirection.ltr,
                                  ),
                                  Text(
                                    figureGlobal.taux_deces + '%',
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                40,
                                        color: Color.fromRGBO(44, 44, 44, 1)),
                                  ),
                                ],
                              );
                            }).toList(),
                          );
                        } else if (snapshot.hasError) {
                          print("${snapshot.error}");
                          return CircularProgressIndicator();
                          return Text("${snapshot.error}");
                        }
                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Text(
                    'Répartition des cas confirmés par genre',
                  ),
                  SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      (figureSex == null)
                          ? FutureBuilder<FigureSex>(
                              future: futureFigureSex,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Row(

                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/standorange.jpg',
                                            width:
                                                MediaQuery.of(context).size.width /
                                                    6,
                                            height:
                                                MediaQuery.of(context).size.height /
                                                    9,
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            snapshot.data.pourc_nbre_masc + '%',
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(239, 125, 5, 1)),
                                          ),
                                          Text(
                                            'Hommes',
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(239, 125, 5, 1)),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  print("${snapshot.error}");
                                  return CircularProgressIndicator();
                                  return Text("${snapshot.error}");
                                }
                                // By default, show a loading spinner.
                                return CircularProgressIndicator();
                              },
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/standorange.jpg',
                                      width: MediaQuery.of(context).size.width / 6,
                                      height:
                                          MediaQuery.of(context).size.height / 9,
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      figureSex.pourc_nbre_masc + '%',
                                      style: TextStyle(
                                          color: Color.fromRGBO(239, 125, 5, 1)),
                                    ),
                                    Text(
                                      'Hommes',
                                      style: TextStyle(
                                          color: Color.fromRGBO(239, 125, 5, 1)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                      (figureSex == null)
                          ? FutureBuilder<FigureSex>(
                              future: futureFigureSex,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            'assets/images/standorangefemale.jpg',
                                            width:
                                                MediaQuery.of(context).size.width /
                                                    6,
                                            height:
                                                MediaQuery.of(context).size.height /
                                                    9,
                                          )
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                            snapshot.data.pourc_nbre_fem + '%',
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(239, 125, 5, 1)),
                                          ),
                                          Text(
                                            'Femmes',
                                            style: TextStyle(
                                                color:
                                                    Color.fromRGBO(239, 125, 5, 1)),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  print("${snapshot.error}");
                                  return CircularProgressIndicator();
                                  return Text("${snapshot.error}");
                                }
                                // By default, show a loading spinner.
                                return CircularProgressIndicator();
                              },
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image.asset(
                                      'assets/images/standorangefemale.jpg',
                                      width: MediaQuery.of(context).size.width / 6,
                                      height:
                                          MediaQuery.of(context).size.height / 9,
                                    )
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      figureSex.pourc_nbre_fem + '%',
                                      style: TextStyle(
                                          color: Color.fromRGBO(239, 125, 5, 1)),
                                    ),
                                    Text(
                                      'Femmes',
                                      style: TextStyle(
                                          color: Color.fromRGBO(239, 125, 5, 1)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}
