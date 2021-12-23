import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uc_here/const/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' show utf8;
import 'package:uc_here/models/lecture.dart';
import 'package:uc_here/apiCalls/lesson_call.dart';

class Lesson extends StatefulWidget {
  const Lesson({Key? key}) : super(key: key);

  @override
  _LessonState createState() => _LessonState();
}

late Lecture _apiResponse;

class _LessonState extends State<Lesson> {
  late TextEditingController _editingController;
  String aboutMeStr = me != null ? me!.aboutMe : "Error Loading About Me";

  @override
  void initState() {
    _editingController = TextEditingController(text: aboutMeStr);
    super.initState();
  }

  @override
  void dispose() {
    _editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var id = 1;
    _handleSubmitted();
    return GestureDetector(
      child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Transform.scale(
                    alignment: Alignment.center,
                    scale: 0.35,
                    child: const DrawLogoQROnly(),
                    origin: const Offset(25, 0),
                  ),
                ),
                const Expanded(
                  flex: 10,
                  child: Text(
                    "Aula:",
                    textAlign: TextAlign.start,
                  ),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
            ),
            titleSpacing: 0,
            centerTitle: false,
            leadingWidth: 25,
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  child: Center(
                    child: templateImage(),
                  ),
                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Center(
                    child: Text(
                      _apiResponse.subject,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 25,
                          letterSpacing: 0.4,
                          wordSpacing: 1,
                          shadows: const [
                            Shadow(
                                offset: Offset(1, 1),
                                blurRadius: 2,
                                color: Color(0x55000000)),
                          ]),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: drawInformationStudent(context, _editingController),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
            ),
          )),
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
    );
  }
}

Widget drawInformationStudent(context, _editingController) {
  return Column(
    children: [
      Padding(
        child: InputDecorator(
          decoration: InputDecoration(
              labelText: 'Aula',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              icon: const Icon(Icons.looks_one_outlined),
              labelStyle: Theme.of(context).textTheme.bodyText1),
          child: Text(_apiResponse.subject),
        ),
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      ),
      Padding(
        child: InputDecorator(
          decoration: InputDecoration(
              label: const Text("Horario"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              icon: const Icon(Icons.email_outlined),
              labelStyle: Theme.of(context).textTheme.bodyText1),
          child: Text(_apiResponse.begin.toString()),
        ),
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
      ),
      Padding(
        child: InputDecorator(
          decoration: InputDecoration(
              label: const Text("Sala"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              icon: const Icon(Icons.email_outlined),
              labelStyle: Theme.of(context).textTheme.bodyText1),
          child: Text(_apiResponse.classroom),
        ),
        padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
      ),
    ],
  );
}

Widget templateImage() {
  return CircleAvatar(
    backgroundColor: Colors.blue,
    child: FittedBox(
      fit: BoxFit.fill,
      child: Text(
        getInitials(me!.name),
        softWrap: true,
        style: const TextStyle(color: Colors.black),
        textScaleFactor: 2,
      ),
    ),
    radius: 50,
  );
}

String getInitials(String str) {
  List<String> listStr = str.split(" ");
  String out = "";
  for (int i = 0; i < listStr.length; i++) {
    if (listStr[i].isNotEmpty) out = out + listStr[i][0];
  }

  return out;
}

void _handleSubmitted() async {
  int id = 1;
  _apiResponse = await getLessonUser(id);
  print(_apiResponse.classroom);
}
