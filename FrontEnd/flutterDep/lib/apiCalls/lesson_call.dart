import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:uc_here/const/constants.dart';
import 'package:uc_here/models/lecture.dart';

Future<Lecture> getLessonUser(int id) async {
  try {
    final response = await http.get(
      Uri.parse(apiURLTest + "Subject/1"),
    );

    switch (response.statusCode) {
      case 200:
        dynamic data = json.decode(response.body);
        if (data != []) {
          Lecture _apiResponse = Lecture(
              data[0]["aula"],
              data[0]["aula"],
              data[0]["sala"],
              data[0]["aula"],
              DateTime.utc(1989, 11, 9),
              DateTime.utc(1989, 11, 9),
              data[0]["aula"]);
          print("aqui1");
          return _apiResponse;
        } else {
          Lecture _apiResponse = Lecture("erro", "erro", "erro", "erro",
              data[0]["hora_de_inicio"], data[0]["hora_de_fim"], "erro");
          print("aqui2");
          return _apiResponse;
        }
      default:
        Lecture _apiResponse = Lecture("erro", "erro", "erro", "erro",
            DateTime.utc(1989, 11, 9), DateTime.utc(1989, 11, 9), "erro");
        print("aqui3");
        print(response.statusCode);
        return _apiResponse;
    }
  } on SocketException {
    Lecture _apiResponse = Lecture("erro", "erro", "erro", "erro",
        DateTime.utc(1989, 11, 9), DateTime.utc(1989, 11, 9), "erro");
    print("aqui4");
    return _apiResponse;
  }
}
