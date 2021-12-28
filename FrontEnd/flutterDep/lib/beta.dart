import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uc_here/const/constants.dart';
import 'package:uc_here/models/lecture.dart';
import 'package:uc_here/models/user.dart';

bool betaTest = false;

void initBeta() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  String? lectures = prefs.getString("lectures");

  if (lectures == null) {
    List<Lecture> betaList = [];

    betaList.add(Lecture(
        "Processos de Gestão e Inovaçã asdasdas sadas as asd sas so",
        "PGI",
        "C5.1",
        "Clara Luxo",
        "Departamento de Engenharia Informática",
        DateTime(2021, 12, 29, 18, 00),
        DateTime(2021, 12, 29, 20, 00),
        "209147244219432763786233825162328932355"));

    betaList.add(Lecture(
        "Processos de Gestão e Inovação 1",
        "IPRP",
        "C5.1",
        "Clara Luxo",
        "Departamento de Engenharia Informática",
        DateTime(2021, 12, 29, 18, 00),
        DateTime(2021, 12, 29, 20, 00),
        "242391413693964710686089183179625759350"));

    betaList.add(Lecture(
        "Processos de Gestão e Inovação 2",
        "PGI2",
        "C5.1",
        "Clara Luxo",
        "Departamento de Engenharia Informática",
        DateTime(2021, 12, 29, 18, 00),
        DateTime(2021, 12, 29, 20, 00),
        "258468764011441421970314435302933955190"));

    betaList.add(Lecture(
        "Processos de Gestão e Inovação 3",
        "PGI3",
        "C5.1",
        "Clara Luxo",
        "Departamento de Engenharia Informática",
        DateTime(2021, 12, 29, 18, 00),
        DateTime(2021, 12, 29, 20, 00),
        "268957502355854452556498765548651315830"));

    betaList.add(Lecture(
        "Processos de Gestão e Inovação 4",
        "PGI4",
        "C5.1",
        "Clara Luxo",
        "Departamento de Engenharia Informática",
        DateTime(2021, 12, 29, 18, 00),
        DateTime(2021, 12, 29, 20, 00),
        "277530754883947741677621374609566761590"));
    betaList.add(Lecture(
        "Processos de Gestão e Inovação 2",
        "PGI2",
        "C5.1",
        "Clara Luxo",
        "Departamento de Engenharia Informática",
        DateTime(2021, 12, 29, 18, 00),
        DateTime(2021, 12, 29, 20, 00),
        "258468764011441421970314435302933955190"));
    betaList.add(Lecture(
        "Processos de Gestão e Inovação 2",
        "PGI2",
        "C5.1",
        "Clara Luxo",
        "Departamento de Engenharia Informática",
        DateTime(2021, 12, 29, 18, 00),
        DateTime(2021, 12, 29, 20, 00),
        "258468764011441421970314435302933955190"));
    betaList.add(Lecture(
        "Processos de Gestão e Inovação 2",
        "PGI2",
        "C5.1",
        "Clara Luxo",
        "Departamento de Engenharia Informática",
        DateTime(2021, 12, 29, 18, 00),
        DateTime(2021, 12, 29, 20, 00),
        "258468764011441421970314435302933955190"));
    betaList.add(Lecture(
        "Processos de Gestão e Inovação 2",
        "PGI2",
        "C5.1",
        "Clara Luxo",
        "Departamento de Engenharia Informática",
        DateTime(2021, 12, 29, 18, 00),
        DateTime(2021, 12, 29, 20, 00),
        "258468764011441421970314435302933955190"));

    myLectures = betaList;
    return;
  }
  myLectures = Lecture.decode(lectures);
  return;
}

void saveDataBeta() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //Save User
  final String userData = json.encode(User.toMap(me!));
  await prefs.setString("betaUser", userData);

  //Save Lectures

  final String lectureData = Lecture.encode(myLectures);
  await prefs.setString("lectures", lectureData);
}

void deleteDataBeta() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove("betaUser");
  await prefs.remove("initP");
  await prefs.remove("lectures");
  await prefs.remove("userMail");
  await prefs.remove("userPassword");
}
