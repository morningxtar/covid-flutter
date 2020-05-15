import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget secondStatistiquePage(BuildContext context) {
  ScreenUtil.instance = ScreenUtil.getInstance()
    ..init(context);
  ScreenUtil.instance =
      ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

  return Container(
    child: Column(
      children: <Widget>[
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