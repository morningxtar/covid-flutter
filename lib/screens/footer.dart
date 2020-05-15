import 'package:flutter/material.dart';

Widget footer(BuildContext context) {
  return Container(
    child: Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 5, right: MediaQuery.of(context).size.width / 35),
          child: Text(
            '#STOP CORONAVIRUS',
            style: TextStyle(
              color: Color.fromRGBO(239, 124, 53, 1),
              fontSize: MediaQuery.of(context).size.width / 34
            ),
          ),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.smartphone,
                color: Color.fromRGBO(58, 170, 53, 1),
                size:  MediaQuery.of(context).size.width / 34,
              ),
              Text(
                '113/119/109/143 - APPEL GRATUIT',
                style: TextStyle(
                  color: Color.fromRGBO(58, 170, 53, 1),
                    fontSize: MediaQuery.of(context).size.width / 34
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
