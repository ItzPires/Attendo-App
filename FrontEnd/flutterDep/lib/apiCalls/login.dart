import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uc_here/beta.dart';
import 'package:uc_here/const/constants.dart';
import 'package:uc_here/models/api_response.dart';
import 'package:uc_here/models/user.dart';

Future<ApiResponseLogin> authenticateUser(String email, String password) async {
  ApiResponseLogin _apiResponse = ApiResponseLogin();
  try {
    //Beta Testing
    if (email == "uc2024123456@student.uc.pt" && password == "demo") {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? userData = prefs.getString("betaUser");

      if (userData == null) {
        _apiResponse.Data = User(
            "Conta Demonstração",
            "uc2024123456@student.uc.pt",
            2024456789,
            "Sou uma conta de demonstração Feliz :)",
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE2NDAyNzY1Nzh9.ojpNV9Pl-DJUx7N9o0ITYFAkdylifybdDLmvVrVu1u4",
            false,
            -1);
      } else {
        _apiResponse.Data = User.fromJson(json.decode(userData));
      }
      _apiResponse.ApiError = "";
      initBeta();
      me = _apiResponse.Data;
      return _apiResponse;
    }
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
  } on SocketException {
    _apiResponse.ApiError = "Erro de ligação ao servidor";
  }
  return _apiResponse;
}
