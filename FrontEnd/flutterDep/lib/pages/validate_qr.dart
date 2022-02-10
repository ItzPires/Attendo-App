import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:uc_here/beta.dart';
import 'package:uc_here/const/constants.dart';
import 'package:uc_here/models/lecture.dart';
import 'package:uc_here/pages/profile.dart';

class ValidatePage extends StatefulWidget {
  const ValidatePage({Key? key}) : super(key: key);

  @override
  State<ValidatePage> createState() => _ValidatePageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ValidatePageState extends State<ValidatePage> {
  late String qrCode;

  @override
  Widget build(BuildContext context) {
    qrCode = ModalRoute.of(context)!.settings.arguments as String;
    Lecture? lecture;
    for (Lecture flecture in myLectures) {
      if (flecture.qrcode == qrCode) {
        flecture.presenceChecked = true;
        lecture = flecture;
        saveDataBeta();
        break;
      }
    }
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
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
                  "Validar",
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
        body: buildBody(lecture!));
  }

  Widget buildBody(Lecture lecture) {
    if (qrCode == null) {
      return const Text("Erro a ler QR Code");
    }
    return SingleChildScrollView(
        child: Stack(
      alignment: Alignment.topCenter,
      children: [
        //COLOCAR NA LISTA DE AULAS
        SizedBox(
          height: MediaQuery.of(context).size.shortestSide * 9 / 16,
          width: MediaQuery.of(context).size.shortestSide,
          child: Material(
            clipBehavior: Clip.hardEdge,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/images/${lecture.department}.jpg",
              fit: BoxFit.cover,
            ),
            borderOnForeground: true,
            type: MaterialType.card,
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.shortestSide * 8 / 16, 0, 0),
            child: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: FittedBox(
                child: Text(
                  lecture.subject,
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
            )),
        Padding(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.center, children: const [
            Text(
              "Presença Marcada com sucesso",
              textScaleFactor: 1.4,
            ),
            Icon(
              Icons.check,
              color: Colors.green,
              size: 40,
            )
          ]),
          padding: EdgeInsets.fromLTRB(
              30, MediaQuery.of(context).size.longestSide * 10 / 16, 30, 0),
        ),
        Padding(
          child: InputDecorator(
            decoration: InputDecoration(
                label: const Text("Data"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                icon: const Icon(Icons.calendar_today_outlined),
                labelStyle: Theme.of(context).textTheme.bodyText1),
            child: Text(lecture.begin.toString().substring(0, 11)),
          ),
          padding: EdgeInsets.fromLTRB(
              30, MediaQuery.of(context).size.longestSide * 6 / 16, 30, 0),
        ),
        Padding(
          child: InputDecorator(
            decoration: InputDecoration(
                label: const Text("Horario"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                icon: const Icon(Icons.timer),
                labelStyle: Theme.of(context).textTheme.bodyText1),
            child: Text(lecture.begin.toString().substring(11, 16) +
                " - " +
                lecture.end.toString().substring(11, 16)),
          ),
          padding: EdgeInsets.fromLTRB(
              30, MediaQuery.of(context).size.longestSide * 8 / 16, 30, 0),
        ),
        Padding(
          child: Center(
              child: OutlinedButton.icon(
                  onPressed: () => {
                        Navigator.pushNamed(context, "/lesson",
                            arguments: lecture)
                      },
                  icon: const Icon(Icons.more_horiz_outlined),
                  label: const Text("Detalhes da Aula"))),
          padding: EdgeInsets.fromLTRB(
              30, MediaQuery.of(context).size.longestSide * 11 / 16, 30, 0),
        ),
      ],
    ));
  }
}
