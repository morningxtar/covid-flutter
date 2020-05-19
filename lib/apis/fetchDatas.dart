import 'dart:convert';
import 'dart:ui';

import 'package:covid19stat/models/FigureAge.dart';
import 'package:covid19stat/models/FigureCI.dart';
import 'package:covid19stat/models/FigureGlobals.dart';
import 'package:covid19stat/models/FigureSex.dart';
import 'package:covid19stat/models/Figures.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:http/http.dart' as http;

import '../constante.dart';

String date;

Future<FigureCI> fetchFigure() async {
  final response = await http.get(apiFigureCI);
  var dio = new Dio();
  final response1 = await dio.get(apiFigureCI);
  date = response1.data['date_update'];
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return FigureCI.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

Future<List<FigureGlobals>> fetchFigureGlobal() async {
  final response = await http.get(apiFigureGlobal);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List responseJson = json.decode(response.body);

    return responseJson.map((m) => new FigureGlobals.fromJson(m)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

Future<FigureSex> fetchFigureSex() async {
  final response = await http.get(apiFigureSex);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return FigureSex.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

Future<FigureAge> fetchFigureAge() async {
  final response = await http.get(apiFigureAge);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    return FigureAge.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

List<Figures> figures = new List<Figures>();

Future<List<Figures>> fetchFigures() async {
  final response = await http.get(apiFigures);
  var dio = new Dio();
  final response1 = await dio.get(apiFigures);

  print(response1.data.length);
  
  for( var i = 0 ; i <response1.data.length; i++ ) {
    Figures figure = new Figures(
        id: response1.data[i]['id'],
        localite: response1.data[i]['localite'],
        commune: response1.data[i]['commune'],
        x: response1.data[i]['x'],
        y: response1.data[i]['y'],
        nbre_cas: response1.data[i]['nbre_cas']
    );
    figures.add(figure);
  }

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List responseJson = json.decode(response.body);
    return responseJson.map((m) => new Figures.fromJson(m)).toList();
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load');
  }
}

void test() {
  print(figures);
}

getMaxTauxGueri(List<FigureGlobals> tabTaux) {
  int maxTaux = 0;
  tabTaux.map((e) {
    if (maxTaux < int.parse(e.taux_gueri)) {
      maxTaux = int.parse(e.taux_gueri);
    }
  }).toList();
  return maxTaux;
}

getMaxTauxDeces(List<FigureGlobals> tabTaux) {
  int maxTaux = 0;
  tabTaux.map((e) {
    if (maxTaux < int.parse(e.taux_deces)) {
      maxTaux = int.parse(e.taux_deces);
    }
  }).toList();
  return maxTaux;
}

getNombrePrelevement(List<FigureGlobals> tabTaux) {
  return int.parse(tabTaux[3].nombre_prelevement);
}
