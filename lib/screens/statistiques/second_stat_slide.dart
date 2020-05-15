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

Widget secondStatistiquePage(BuildContext context) {
  List<TabStat> tabStat;
  tabStat = TabStat.getStat();
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
        Container(
          padding:
              EdgeInsets.only(left: MediaQuery.of(context).size.width / 25, right: MediaQuery.of(context).size.width / 25),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
                columnSpacing: 5,
                headingRowHeight: MediaQuery.of(context).size.height / 20,
                dataRowHeight: MediaQuery.of(context).size.height / 30,
                horizontalMargin: MediaQuery.of(context).size.height / 30,
                columns: [
                  DataColumn(
                    label: Text(
                      "Pays / Région",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30),
                    ),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text(
                      "Cas confirmés",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30),
                    ),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text(
                      "Guérisons",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30),
                    ),
                    numeric: false,
                  ),
                  DataColumn(
                    label: Text(
                      "Décès",
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30),
                    ),
                    numeric: false,
                  ),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text(
                      'Monde',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35),
                    )),
                    DataCell(Text(
                      '3 303 296',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30),
                    )),
                    DataCell(Text(
                      '1 038 588',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30),
                    )),
                    DataCell(Text(
                      '285 290',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30),
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(
                      'Afrique',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35),
                    )),
                    DataCell(Text(
                      '39 018',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35),
                    )),
                    DataCell(Text(
                      '12 750',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35),
                    )),
                    DataCell(Text(
                      '1 640',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35),
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(
                      'Afrique de l\'Ouest',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35),
                    )),
                    DataCell(Text(
                      '10 395',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30),
                    )),
                    DataCell(Text(
                      '3 140',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30),
                    )),
                    DataCell(Text(
                      '244',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 30),
                    )),
                  ]),
                  DataRow(cells: [
                    DataCell(Text(
                      'Côte d\'Ivoire',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35),
                    )),
                    DataCell(Text(
                      '1 353',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35),
                    )),
                    DataCell(Text(
                      '597',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35),
                    )),
                    DataCell(Text(
                      '15',
                      style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 35),
                    )),
                  ]),
                ]),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                'Monde',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 40,
                                    color: Color.fromRGBO(78, 172, 54, 1)),
                              ),
                            ),
                            StepProgressIndicator(
                              totalSteps: 45,
                              currentStep: 32,
                              size: 5,
                              padding: 0,
                              unselectedSize: 0,
                              selectedColor: Color.fromRGBO(78, 172, 54, 1),
                              progressDirection: TextDirection.ltr,
                            ),
                            Text(
                              '31%',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 40,
                                  color: Color.fromRGBO(78, 172, 54, 1)),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                'Afrique',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 40,
                                    color: Color.fromRGBO(78, 172, 54, 1)),
                              ),
                            ),
                            StepProgressIndicator(
                              totalSteps: 45,
                              currentStep: 33,
                              size: 5,
                              padding: 0,
                              unselectedSize: 0,
                              selectedColor: Color.fromRGBO(78, 172, 54, 1),
                              progressDirection: TextDirection.ltr,
                            ),
                            Text(
                              '33%',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 40,
                                  color: Color.fromRGBO(78, 172, 54, 1)),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                'Afrique de l\'Ouest',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 40,
                                    color: Color.fromRGBO(78, 172, 54, 1)),
                              ),
                            ),
                            StepProgressIndicator(
                              totalSteps: 45,
                              currentStep: 30,
                              size: 5,
                              padding: 0,
                              unselectedSize: 0,
                              selectedColor: Color.fromRGBO(78, 172, 54, 1),
                              progressDirection: TextDirection.ltr,
                            ),
                            Text(
                              '30%',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 40,
                                  color: Color.fromRGBO(78, 172, 54, 1)),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                'Côte d\'Ivoire',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 40,
                                    color: Color.fromRGBO(78, 172, 54, 1)),
                              ),
                            ),
                            StepProgressIndicator(
                              totalSteps: 45,
                              currentStep: 45,
                              size: 5,
                              padding: 0,
                              unselectedSize: 0,
                              selectedColor: Color.fromRGBO(78, 172, 54, 1),
                              progressDirection: TextDirection.ltr,
                            ),
                            Text(
                              '45%',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 40,
                                  color: Color.fromRGBO(78, 172, 54, 1)),
                            ),
                          ],
                        ),
                      ],
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                'Monde',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 40,
                                    color: Color.fromRGBO(44, 44, 44, 1)),
                              ),
                            ),
                            StepProgressIndicator(
                              totalSteps: 7,
                              currentStep: 7,
                              size: 5,
                              padding: 0,
                              unselectedSize: 0,
                              selectedColor: Color.fromRGBO(44, 44, 44, 1),
                              progressDirection: TextDirection.ltr,
                            ),
                            Text(
                              '7%',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 40,
                                  color: Color.fromRGBO(44, 44, 44, 1)),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                'Afrique',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 40,
                                    color: Color.fromRGBO(44, 44, 44, 1)),
                              ),
                            ),
                            StepProgressIndicator(
                              totalSteps: 7,
                              currentStep: 4,
                              size: 5,
                              padding: 0,
                              unselectedSize: 0,
                              selectedColor: Color.fromRGBO(44, 44, 44, 1),
                              progressDirection: TextDirection.ltr,
                            ),
                            Text(
                              '4%',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 40,
                                  color: Color.fromRGBO(44, 44, 44, 1)),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                'Afrique de l\'Ouest',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 40,
                                    color: Color.fromRGBO(44, 44, 44, 1)),
                              ),
                            ),
                            StepProgressIndicator(
                              totalSteps: 7,
                              currentStep: 2,
                              size: 5,
                              padding: 0,
                              unselectedSize: 0,
                              selectedColor: Color.fromRGBO(44, 44, 44, 1),
                              progressDirection: TextDirection.ltr,
                            ),
                            Text(
                              '2%',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 40,
                                  color: Color.fromRGBO(44, 44, 44, 1)),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 5, right: 10),
                              child: Text(
                                'Côte d\'Ivoire',
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.width / 40,
                                    color: Color.fromRGBO(44, 44, 44, 1)),
                              ),
                            ),
                            StepProgressIndicator(
                              totalSteps: 7,
                              currentStep: 1,
                              size: 5,
                              padding: 0,
                              unselectedSize: 0,
                              selectedColor: Color.fromRGBO(44, 44, 44, 1),
                              progressDirection: TextDirection.ltr,
                            ),
                            Text(
                              '1%',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width / 40,
                                  color: Color.fromRGBO(44, 44, 44, 1)),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Données détaillées'),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.height / 7,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(59, 170, 53, 1),
                        shape: BoxShape.circle),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/echantil.jpg',
                          width: MediaQuery.of(context).size.width / 10,
                          height: MediaQuery.of(context).size.height / 13,
                        ),
                        Text(
                          '10 073',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: MediaQuery.of(context).size.width / 35),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'Nombre`\n d\'échantillons\n prélévés',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Répartition des cas\n confirmés par genre',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/standorange.jpg',
                            width: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 13,
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '61%',
                            style:
                                TextStyle(color: Color.fromRGBO(239, 125, 5, 1)),
                          ),
                          Text(
                            'Hommes',
                            style:
                                TextStyle(color: Color.fromRGBO(239, 125, 5, 1)),
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Image.asset(
                            'assets/images/standorangefemale.jpg',
                            width: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.height / 13,
                          )
                        ],
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            '39%',
                            style:
                                TextStyle(color: Color.fromRGBO(239, 125, 5, 1)),
                          ),
                          Text(
                            'Femmes',
                            style:
                                TextStyle(color: Color.fromRGBO(239, 125, 5, 1)),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    ),
  );
}
