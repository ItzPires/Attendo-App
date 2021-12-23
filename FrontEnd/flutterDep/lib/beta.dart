import 'package:uc_here/const/constants.dart';
import 'package:uc_here/models/lecture.dart';
import 'package:uc_here/models/user.dart';

bool betaTest = false;

List<Lecture> initBeta() {
  me = User("Testador Beta", "uc0123456789@student.uc.pt", 1, "",
      "asddasdsadasdgfdgxc3242df", false, 1);
  List<Lecture> betaList = [];

  betaList.add(Lecture(
      "Processos de Gestão e Inovação",
      "PGI",
      "C5.1",
      "Clara Luxo",
      DateTime(2021, 12, 29, 18, 00),
      DateTime(2021, 12, 29, 20, 00),
      "213131453425234452346523654645363546"));

  betaList.add(Lecture(
      "Processos de Gestão e Inovação 1",
      "IPRP",
      "C5.1",
      "Clara Luxo",
      DateTime(2021, 12, 29, 18, 00),
      DateTime(2021, 12, 29, 20, 00),
      "14312132121332143214"));

  betaList.add(Lecture(
      "Processos de Gestão e Inovação 2",
      "PGI2",
      "C5.1",
      "Clara Luxo",
      DateTime(2021, 12, 29, 18, 00),
      DateTime(2021, 12, 29, 20, 00),
      "14567123123341234123432"));

  betaList.add(Lecture(
      "Processos de Gestão e Inovação 3",
      "PGI3",
      "C5.1",
      "Clara Luxo",
      DateTime(2021, 12, 29, 18, 00),
      DateTime(2021, 12, 29, 20, 00),
      "1521342233412343124532154315342"));

  betaList.add(Lecture(
      "Processos de Gestão e Inovação 4",
      "PGI4",
      "C5.1",
      "Clara Luxo",
      DateTime(2021, 12, 29, 18, 00),
      DateTime(2021, 12, 29, 20, 00),
      "543653461231242341325435"));

  return betaList;
}
