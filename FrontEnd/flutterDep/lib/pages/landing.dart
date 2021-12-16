import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uc_here/apiCalls/login.dart';
import 'package:uc_here/models/api_response.dart';
import 'package:uc_here/models/user.dart';
import 'package:connectivity/connectivity.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  String _userEmail = "";
  String _userPassword = "";
  String _init = "";
  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  _loadUserInfo() async {
    //check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    _userEmail = (prefs.getString('userMail') ?? "");
    _userPassword = (prefs.getString('userPassword') ?? "");
    _init = (prefs.getString('init') ?? "");
    if (connectivityResult == ConnectivityResult.none) {
      Navigator.pushNamedAndRemoveUntil(
          context, '/login', ModalRoute.withName('/login'));
    } else {
      if (_init == "") {
        Navigator.pushNamedAndRemoveUntil(
            context, '/init', ModalRoute.withName('/init'));
      } else if (_userEmail == "") {
        Navigator.pushNamedAndRemoveUntil(
            context, '/login', ModalRoute.withName('/login'));
      } else {
        ApiResponse _apiResponse =
            await authenticateUser(_userEmail, _userPassword);

        if ((_apiResponse.ApiError) == "") {
          Navigator.pushNamedAndRemoveUntil(
              context, '/home', ModalRoute.withName('/home'),
              arguments: (_apiResponse.Data));
        } else {
          Navigator.pushNamedAndRemoveUntil(
              context, '/login', ModalRoute.withName('/login'));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
