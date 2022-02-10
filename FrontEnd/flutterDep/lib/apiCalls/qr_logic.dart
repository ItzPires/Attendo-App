import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:uc_here/const/constants.dart';

Future<String> getQrCode(String classId) async {
  String code = "";

  try {
    final response = await http.get(
      Uri.parse(apiURLTest + "QrCode/" + classId),
    );

    switch (response.statusCode) {
      case 200:
        dynamic data = json.decode(response.body);
        if (data["error"] == null) {
          code = data["qrCode"];
        } else {
          code = "error";
        }
        break;
      default:
        code = "error";
        break;
    }
  } on SocketException {
    code = "error";
  }
  return code;
}
