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
      backgroundColor: Color.fromRGBO(59, 170, 53, 0.8),
      elevation: 0.0,
    ),
  );
}

Widget headerLogo(BuildContext context){
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: AppBar(
      title: Row(
        children: <Widget>[
          Expanded(
            child: Image.asset(
              'assets/images/minis.jpg',
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/proeg.jpg',
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
          Expanded(
            child: Image.asset(
              'assets/images/logo.png',
              width: MediaQuery.of(context).size.width / 3,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
    ),
  );
}
