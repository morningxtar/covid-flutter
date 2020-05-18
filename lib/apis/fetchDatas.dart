import 'dart:convert';

import 'package:covid19stat/models/FigureAge.dart';
import 'package:covid19stat/models/FigureCI.dart';
import 'package:covid19stat/models/FigureGlobals.dart';
import 'package:covid19stat/models/FigureSex.dart';
import 'package:covid19stat/models/Figures.dart';

import 'package:covid19stat/screens/statistiques/first_stat_slide.dart';
import 'package:http/http.dart' as http;

import '../constante.dart';

Future<FigureCI> fetchFigure() async {
  final response =
  await http.get(apiFigureCI);

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
  final response =
  await http.get(apiFigureGlobal);

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
  final response =
  await http.get(apiFigureSex);

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
  final response =
  await http.get(apiFigureAge);

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

Future<List<Figures>> fetchFigures() async {
  final response =
  await http.get(apiFigureGlobal);

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

getMaxTauxGueri(List<FigureGlobals> tabTaux) {
  int maxTaux = 0;
  tabTaux.map((e) {
    if(maxTaux < int.parse(e.taux_gueri)){
      maxTaux = int.parse(e.taux_gueri);
    }
  }).toList();
  return maxTaux;
}

getMaxTauxDeces(List<FigureGlobals> tabTaux) {
  int maxTaux = 0;
  tabTaux.map((e) {
    if(maxTaux < int.parse(e.taux_deces)){
      maxTaux = int.parse(e.taux_deces);
    }
  }).toList();
  return maxTaux;
}

getNombrePrelevement(List<FigureGlobals> tabTaux) {
  return int.parse(tabTaux[3].nombre_prelevement);
}