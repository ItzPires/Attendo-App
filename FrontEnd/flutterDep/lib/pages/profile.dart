import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uc_here/const/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert' show utf8;

//TODO REGISTO DE PRESENÇAS DO UTILIZADOR POR CADEIRA
class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  late Future<Student> _student;
  late TextEditingController _editingController;
  bool _isEditingText = false;
  late String initialText;

  @override
  void initState() {
    _student = fetchStudent(2019222451);
    getAboutMe(_student);
    _editingController = TextEditingController(text: initialText);
    super.initState();
  }

  @override
  void dispose() {
    _editingController = TextEditingController(text: initialText);
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
                print(initialText);
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
                  child: Center(child: getName(_student)),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: drawInformation(context, _student, _editingController),
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
        print(initialText);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
    );
  }

  Widget drawInformation(context, _student, _editingController) {
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
            child: getNumber(_student),
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
            child: getMail(_student),
          ),
          padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
        ),
        Padding(
          child: getAboutMe(_student),
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
              initialText = newValue;
            });
          },
          onSubmitted: (newValue) {
            setState(() {
              initialText = newValue;
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
          initialText,
          softWrap: true,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
    );
  }

  FutureBuilder<Student> getAboutMe(student) {
    initialText = "Error Loading Student Number";
    return FutureBuilder<Student>(
        future: student,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.about_me);
            initialText =
                (String.fromCharCodes(utf8.encode(snapshot.data!.about_me)));
            return aboutMe();
          } else if (snapshot.hasError) {
            initialText = 'Error Loading Student Number';
            return aboutMe();
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator(
            color: Color(0xFF000000),
          );
        });
  }
}

FutureBuilder<Student> getMail(student) {
  return FutureBuilder<Student>(
      future: student,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!.mail,
            style: Theme.of(context).textTheme.bodyText1,
          );
        } else if (snapshot.hasError) {
          return const Text('Error Loading Student Mail');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator(
          color: Color(0xFF000000),
        );
      });
}

FutureBuilder<Student> getName(student) {
  final TextStyle nameStyle = GoogleFonts.robotoCondensed(
    textStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontSize: 25,
        letterSpacing: 0.4,
        wordSpacing: 1,
        shadows: [
          Shadow(offset: Offset(1, 1), blurRadius: 2, color: Color(0x55000000)),
        ]),
  );

  return FutureBuilder<Student>(
      future: student,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!.name,
            style: nameStyle,
          );
        } else if (snapshot.hasError) {
          return Text('Error Loading Student Name');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator(
          color: Color(0xFF000000),
        );
      });
}

FutureBuilder<Student> getNumber(student) {
  return FutureBuilder<Student>(
      future: student,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data!.number.toString(),
            style: Theme.of(context).textTheme.bodyText1,
          );
        } else if (snapshot.hasError) {
          return Text('Error Loading Student Number');
        }
        // By default, show a loading spinner.
        return const CircularProgressIndicator(
          color: Color(0xFF000000),
        );
      });
}

class Student {
  String name;
  String mail;
  String about_me;
  int number;
  Student(this.name, this.mail, this.number, this.about_me);

  @override
  String toString() {
    return name + " " + mail;
  }

  Student.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        mail = json["mail"],
        number = json["number"],
        about_me = json["sobre_mim"];
}

Future<Student> fetchStudent(int number) async {
  final response =
      await http.get(Uri.parse(apiURLTest + "Student/" + number.toString()));

  if (response.statusCode == 200) {
    return Student.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load profile');
  }
}

Widget templateImage() {
  return ClipOval(
      child: Material(
    color: Colors.transparent,
    child: Ink.image(
      image: AssetImage('assets/images/profile.png'),
      height: 100,
      width: 100,
      fit: BoxFit.scaleDown,
    ),
  ));
}

Widget _notInUseSubjectList() {
  return Container(
    height: 200,
    child: SingleChildScrollView(
      child: Column(
        children: const [
          ExpansionTile(
            tilePadding: EdgeInsets.fromLTRB(40, 0, 20, 0),
            title: Text("PGI"),
          ),
          ExpansionTile(
            tilePadding: EdgeInsets.fromLTRB(40, 0, 20, 0),
            title: Text("ES"),
            children: [
              Text("SPSADAD"),
              Text("SPSADAD"),
              Text("SPSADAD"),
              Text("SPSADAD"),
              Text("SPSADAD"),
              Text("SPSADAD"),
              Text("SPSADAD")
            ],
          ),
        ],
      ),
    ),
  );
}
