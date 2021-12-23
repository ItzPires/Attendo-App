import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:uc_here/const/constants.dart';
import 'package:uc_here/models/api_response.dart';
import 'package:uc_here/models/user.dart';

Future<ApiResponseLogin> authenticateUser(String email, String password) async {
  ApiResponseLogin _apiResponse = ApiResponseLogin();
  try {
    if (email == "demo" && password == "demo") {
      var data = {
        "number": 2021123123,
        "mail": "demo@attendo.pt",
        "name": "Conta Demonstração",
        "aboutMe":
            "Esta é uma Conta de Demonstração. O que estás a achar? Gostas?",
        "authToken": "000",
        "id": 0,
        "isTeacher": false
      };

      _apiResponse.Data = User.fromJson(data);
      me = _apiResponse.Data;
      _apiResponse.ApiError = "";

      return _apiResponse;
    } else {
      final response = await http.post(
        Uri.parse(apiURLTest + "login/"),
        body: jsonEncode(<String, String>{
          "email": email,
          "password": password,
        }),
      );

      switch (response.statusCode) {
        case 200:
          dynamic data = json.decode(response.body);
          if (data["error"] == null) {
            _apiResponse.Data = User.fromJson(data);
            me = _apiResponse.Data;
            _apiResponse.ApiError = "";
          } else {
            _apiResponse.ApiError = data['error'];
          }
          break;
        default:
          _apiResponse.ApiError = "Erro de ligação ao servidor";
          break;
      }
    }
  } on SocketException {
    _apiResponse.ApiError = "Erro de ligação ao servidor";
  }
  return _apiResponse;
}
