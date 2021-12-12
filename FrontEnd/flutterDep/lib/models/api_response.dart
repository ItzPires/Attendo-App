import 'package:uc_here/models/user.dart';

class ApiResponse {
  late User _data;
  String? _apiError;

  User get Data => _data;
  set Data(User data) => _data = data;

  String get ApiError => _apiError ?? "";
  set ApiError(String error) => _apiError = error;
}
