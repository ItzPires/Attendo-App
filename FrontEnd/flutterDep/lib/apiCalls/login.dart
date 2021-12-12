import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:uc_here/const/constants.dart';
import 'package:uc_here/models/api_response.dart';
import 'package:uc_here/models/user.dart';

Future<ApiResponse> authenticateUser(String email, String password) async {
  ApiResponse _apiResponse = ApiResponse();
  try {
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
        _apiResponse.ApiError = json.decode(response.body)['error'];
        break;
    }
  } on SocketException {
    _apiResponse.ApiError = "Server error. Please retry";
  }
  return _apiResponse;
}
