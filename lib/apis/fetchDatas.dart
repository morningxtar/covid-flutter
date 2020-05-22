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

FigureCI figureTest;
Future<FigureCI> fetchFigure() async {
  final response = await http.get(apiFigureCI);
  var dio = new Dio();
  final response1 = await dio.get(apiFigureCI);
  date = response1.data['date_update'];

  figureTest = new FigureCI(
    pays: response1.data['pays'],
    date_update: response1.data['date_update'],
    cas_confirme: response1.data['cas_confirme'],
    cas_deces: response1.data['cas_deces'],
    cas_gueri: response1.data['cas_gueri'],
    cas_actif: response1.data['cas_actif'],
    nombre_prelevement: response1.data['nombre_prelevement'],
    nouveau_cas_confirme: response1.data['nouveau_cas_confirme'],
    nouveau_cas_deces: response1.data['nouveau_cas_deces'],
    nouveau_cas_gueri: response1.data['nouveau_cas_gueri'],
    nouveau_nombre_prelevement: response1.data['nouveau_nombre_prelevement'],
  );
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

List<int> tabGue = new List<int>();
List<int> tabDec = new List<int>();
String nombre;
List<FigureGlobals> futGlob = new List<FigureGlobals>();
Future<List<FigureGlobals>> fetchFigureGlobal() async {
  final response = await http.get(apiFigureGlobal);
  var dio = new Dio();
  final response1 = await dio.get(apiFigureGlobal);
  nombre = response1.data[3]['nombre_prelevement'];

  if(futGlob.isEmpty){
    for( var i = 0 ; i <response1.data.length; i++ ) {
      FigureGlobals futGlo = new FigureGlobals(
        entite: response1.data[i]['entite'],
        date_update: response1.data[i]['date_update'],
        cas_confirme: response1.data[i]['cas_confirme'],
        cas_deces: response1.data[i]['cas_deces'],
        cas_gueri: response1.data[i]['cas_gueri'],
        taux_deces: response1.data[i]['taux_deces'],
        taux_gueri: response1.data[i]['taux_gueri'],
        nombre_prelevement: response1.data[i]['nombre_prelevement'].toString(),
      );
      futGlob.add(futGlo);
      tabGue.add(int.parse(response1.data[i]['taux_gueri']));
      tabDec.add(int.parse(response1.data[i]['taux_deces']));
    }
  }
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

FigureSex figureSex;
Future<FigureSex> fetchFigureSex() async {
  final response = await http.get(apiFigureSex);
  var dio = new Dio();
  final response1 = await dio.get(apiFigureSex);
  figureSex = new FigureSex(
    pays: response1.data['pays'],
    pourc_nbre_masc: response1.data['pourc_nbre_masc'],
    pourc_nbre_fem: response1.data['pourc_nbre_fem']
  );
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

FigureAge figAge;
Future<FigureAge> fetchFigureAge() async {
  final response = await http.get(apiFigureAge);
  var dio = new Dio();
  final response1 = await dio.get(apiFigureAge);
  figAge = new FigureAge(
    pays: response1.data['pays'],
    nbre_0_30: response1.data['nbre_0_30'],
    pourc_nbre_0_30: response1.data['pourc_nbre_0_30'],
    nbre_31_50: response1.data['nbre_31_50'],
    pourc_nbre_31_50: response1.data['pourc_nbre_31_50'],
    nbre_51_plus: response1.data['nbre_51_plus'],
    pourc_nbre_51_plus: response1.data['pourc_nbre_51_plus'],
  );
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
