import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uc_here/const/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' show utf8;

// ignore: todo
//TODO REGISTO DE PRESENÇAS DO UTILIZADOR POR CADEIRA
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late TextEditingController _editingController;
  bool _isEditingText = false;
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
                    "Meu Perfil",
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
                      me != null ? me!.name.toString() : "Error loading name",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25,
                          letterSpacing: 0.4,
                          wordSpacing: 1,
                          shadows: [
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
                  child: drawInformation(context, _editingController),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
            ),
          )),
      onTap: () {
        _isEditingText = false;
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
    );
  }

  Widget drawInformation(context, _editingController) {
    return Column(
      children: [
        Padding(
          child: InputDecorator(
            decoration: InputDecoration(
                labelText: 'Número de Estudante',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                icon: const Icon(Icons.looks_one_outlined),
                labelStyle: Theme.of(context).textTheme.bodyText1),
            child: Text(
                me != null ? me!.number.toString() : "Error loading number"),
          ),
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        ),
        Padding(
          child: InputDecorator(
            decoration: InputDecoration(
                label: const Text("Mail de Estudante:"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                icon: const Icon(Icons.email_outlined),
                labelStyle: Theme.of(context).textTheme.bodyText1),
            child:
                Text(me != null ? me!.mail.toString() : "Error loading mail"),
          ),
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        ),
        Padding(
          child: aboutMe(),
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        )
      ],
    );
  }

  Widget aboutMe() {
    if (_isEditingText) {
      return Center(
          child: InkWell(
        child: TextField(
          keyboardType: TextInputType.multiline,
          maxLines: null,
          decoration: InputDecoration(
              labelText: 'Sobre mim:',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              icon: const Icon(Icons.person_search_outlined),
              labelStyle: Theme.of(context).textTheme.bodyText1),
          onChanged: (newValue) {
            setState(() {
              aboutMeStr = newValue;
            });
          },
          onSubmitted: (newValue) {
            setState(() {
              aboutMeStr = newValue;
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: _editingController,
        ),
      ));
    }
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: 'Sobre mim:',
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
            icon: const Icon(Icons.person_search_outlined),
            labelStyle: Theme.of(context).textTheme.bodyText1),
        child: Text(
          aboutMeStr,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }
}

Widget templateImage() {
  return ClipOval(
      child: Material(
    borderOnForeground: true,
    color: Colors.transparent,
    child: Ink.image(
      image: const AssetImage('assets/images/profile.png'),
      height: 100,
      width: 100,
      fit: BoxFit.scaleDown,
    ),
  ));
}
