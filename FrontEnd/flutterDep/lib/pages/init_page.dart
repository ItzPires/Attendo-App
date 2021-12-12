import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uc_here/const/constants.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 0,
            title: Transform.scale(
              scale: 0.4,
              child: const DrawLogo(),
              alignment: Alignment.centerLeft,
            ),
            centerTitle: false,
          ),
          //TODO DRAW FIRST TIME SCREEN
          body: ElevatedButton(
            child: const Text("FIRST TIME"),
            onPressed: () => setState(() {
              saveInitState();
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', ModalRoute.withName('/login'));
            }),
          ),
        ));
  }
}

void saveInitState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('init', "true").then((value) => null);
}
