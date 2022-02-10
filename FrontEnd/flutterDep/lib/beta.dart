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
    //1
    betaList.add(Lecture(
        "Processos de Gestão e de Inovação",
        "PGI",
        "C5.1",
        "Clara Luxo",
        "Departamento de Engenharia Informática",
        DateTime(2022, 3, 03, 18, 00),
        DateTime(2022, 3, 03, 20, 00),
        "14619989419635733995098346312717019105"));
    //2
    betaList.add(Lecture(
        "Introdução à Programação e Resolução de Problemas",
        "IPRP",
        "E5.3",
        "Rui Pedro Pinto de Carvalho e Paiva",
        "Departamento de Engenharia Informática",
        DateTime(2022, 2, 28, 12, 00),
        DateTime(2022, 2, 28, 14, 00),
        "6748414140771725723790751458973165537"));
    //3
    betaList.add(Lecture(
        "Base de Dados",
        "BD",
        "G6.2",
        "Marco Paulo Amorim Vieira",
        "Departamento de Engenharia Informática",
        DateTime(2022, 3, 29, 11, 00),
        DateTime(2022, 3, 29, 12, 30),
        "1784802955853158450108886782199441377"));
    //4
    betaList.add(Lecture(
        "Engenharia de Software",
        "ES",
        "C6.3",
        "Mário Alberto da Costa Zenha Rela",
        "Departamento de Engenharia Informática",
        DateTime(2022, 5, 31, 10, 00),
        DateTime(2022, 5, 31, 12, 00),
        "335672429334936983391344674026975111137"));
    //5
    betaList.add(Lecture(
        "Anatomia III",
        "A III",
        "0.09",
        "António Carlos Eva Miguéis",
        "Faculdade de Medicina da Universidade de Coimbra",
        DateTime(2022, 1, 25, 14, 00),
        DateTime(2022, 1, 25, 16, 00),
        "8830070411390150797467064176459622369"));

    //6
    betaList.add(Lecture(
        "Introdução à Prática Médica IV",
        "IPM IV",
        "Auditório",
        "Henrique Miguel Marques Bom Borges Alexandrino",
        "Faculdade de Medicina da Universidade de Coimbra",
        DateTime(2022, 1, 20, 16, 00),
        DateTime(2022, 1, 20, 18, 00),
        "242152713423381008773892331729997506529"));

    //7
    betaList.add(Lecture(
        "Anatomia Patológica I",
        "AP I",
        "Anf SU3",
        "Lina Maria Rodrigues Carvalho",
        "Faculdade de Medicina da Universidade de Coimbra",
        DateTime(2022, 1, 14, 8, 30),
        DateTime(2022, 1, 14, 10, 30),
        "60979016889442019576633264919749568481"));

    //8
    betaList.add(Lecture(
        "Garantias",
        "G",
        "Sala Marnoco e Sousa",
        "Irene Seiça Girão",
        "Faculdade de Direito da Universidade de Coimbra",
        DateTime(2022, 1, 10, 10, 00),
        DateTime(2022, 1, 10, 12, 00),
        "266528714864486348172523490089172707297"));

    //9
    betaList.add(Lecture(
        "Direito da Medicina",
        "DM",
        "Rangel Sampaio",
        "André Gonçalo Dias Pereira",
        "Faculdade de Direito da Universidade de Coimbra",
        DateTime(2022, 2, 7, 9, 00),
        DateTime(2022, 2, 7, 11, 00),
        "187091585298604950390206049962204309473"));

    //10
    betaList.add(Lecture(
        "Direito Administrativo III",
        "DA III",
        "Manuel de Andrade",
        "José Eduardo Oliveira Figueiredo Dias",
        "Faculdade de Direito da Universidade de Coimbra",
        DateTime(2022, 2, 4, 8, 00),
        DateTime(2022, 2, 4, 10, 00),
        "302894801154390284964415498848194242529"));

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
