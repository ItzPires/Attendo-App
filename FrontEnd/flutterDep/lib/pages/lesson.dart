import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uc_here/const/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' show utf8;
import 'package:uc_here/models/lecture.dart';
import 'package:uc_here/pages/profile.dart';

class Lesson extends StatefulWidget {
  const Lesson({Key? key}) : super(key: key);

  @override
  _LessonState createState() => _LessonState();
}

class _LessonState extends State<Lesson> {
  @override
  Widget build(BuildContext context) {
    Lecture lecture = ModalRoute.of(context)!.settings.arguments as Lecture;

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
                    "Aula",
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
                  child: Center(child: templateImage(lecture.abbreviation)),
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Center(
                    child: Text(
                      lecture.subject,
                      textAlign: TextAlign.center,
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
                  child: drawInformationStudent(context, lecture),
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

  Widget drawInformationStudent(context, Lecture lecture) {
    return Column(
      children: [
        Padding(
          child: InputDecorator(
            decoration: InputDecoration(
                labelText: 'Nome do Professor',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                icon: const Icon(Icons.looks_one_outlined),
                labelStyle: Theme.of(context).textTheme.bodyText1),
            child: Text(lecture.teacherName),
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
              child: Text(lecture.begin.toString().substring(0, 16) +
                  " - " +
                  lecture.end.toString().substring(11, 16))),
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        ),
        Padding(
          child: InputDecorator(
            decoration: InputDecoration(
                label: const Text("Local"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                icon: const Icon(Icons.email_outlined),
                labelStyle: Theme.of(context).textTheme.bodyText1),
            child: Text(lecture.department),
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
            child: Text(lecture.classroom),
          ),
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        ),
      ],
    );
  }
}
