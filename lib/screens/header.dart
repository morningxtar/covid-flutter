import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget header(String title) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontWeight: FontWeight.w900, color: Colors.white, fontSize: 18),
      ),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(59, 170, 53, 1),
      elevation: 0.0,
    ),
  );
}

Widget headerLogo(BuildContext context){
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/images/minis.jpg',
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.width / 7,alignment: Alignment.center,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/proeg.jpg',
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.width / 7,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.width / 7,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
    ),
  );
}
