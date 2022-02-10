import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uc_here/const/constants.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: IntroductionScreen(
          pages: [
            PageViewModel(
              titleWidget: Text(
                "Bem Vindo!",
                style: GoogleFonts.robotoCondensed(
                    wordSpacing: 1,
                    fontSize: 36,
                    letterSpacing: 0,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
              bodyWidget: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                    child: Text(
                      "Attendo é uma aplicação que simplifica a marcação de presenças nas aulas",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoCondensed(
                          wordSpacing: 1,
                          fontSize: 18,
                          letterSpacing: 0,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.8)),
                    ),
                  ),
                ],
              ),
              image: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height / 6, 0, 0),
                  child: SvgPicture.asset(
                    'assets/images/Accept.svg',
                    clipBehavior: Clip.antiAlias,
                  )),
            ),
            PageViewModel(
              titleWidget: Text(
                "O Professor",
                style: GoogleFonts.robotoCondensed(
                    wordSpacing: 1,
                    fontSize: 36,
                    letterSpacing: 0,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
              bodyWidget: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Text(
                    "Gera um QR Code ➡️ Partilha-o com os alunos",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoCondensed(
                        wordSpacing: 1,
                        fontSize: 20,
                        letterSpacing: 0,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.8)),
                  ),
                ),
              ]),
              image: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height / 8, 0, 0),
                  child: SvgPicture.asset(
                    'assets/images/Teacher.svg',
                    clipBehavior: Clip.antiAlias,
                  )),
            ),
            PageViewModel(
              titleWidget: Text(
                "O Aluno",
                style: GoogleFonts.robotoCondensed(
                    wordSpacing: 1,
                    fontSize: 36,
                    letterSpacing: 0,
                    color: Theme.of(context).colorScheme.onSurface),
              ),
              bodyWidget: Column(children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
                  child: Text(
                    "Lê o QR Code ➡️ Presença marcada",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.robotoCondensed(
                        wordSpacing: 1,
                        fontSize: 20,
                        letterSpacing: 0,
                        color: Theme.of(context)
                            .colorScheme
                            .onSurface
                            .withOpacity(0.8)),
                  ),
                ),
              ]),
              image: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height / 8, 0, 0),
                  child: SvgPicture.asset(
                    'assets/images/Student.svg',
                    clipBehavior: Clip.antiAlias,
                  )),
            ),
            PageViewModel(
                bodyWidget: Column(children: [
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        elevation: 4,
                        animationDuration: const Duration(seconds: 1),
                        fixedSize: const Size(240, 50),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      onPressed: () async {
                        saveInitState();
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', ModalRoute.withName('/login'));
                      },
                      icon: const Icon(
                        Icons.arrow_forward,
                      ),
                      label: const Text(' Começar ')),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 110, 30, 0),
                    child: Text(
                      "A tua presença não será esquecida!",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.robotoCondensed(
                          wordSpacing: 1,
                          fontSize: 20,
                          letterSpacing: 0,
                          color: Theme.of(context)
                              .colorScheme
                              .onSurface
                              .withOpacity(0.8)),
                    ),
                  ),
                ]),
                title: "",
                image: Padding(
                  padding: EdgeInsets.fromLTRB(
                      0, 0, 0, MediaQuery.of(context).size.height / 20),
                  child: DrawLogo(),
                ))
          ],
          onDone: () {
            saveInitState();
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', ModalRoute.withName('/login'));
          },
          next: Text(
            "Próximo",
            style: GoogleFonts.robotoCondensed(
              wordSpacing: 1,
              fontSize: 16,
              letterSpacing: 0,
            ),
          ),
          showSkipButton: true,
          skip: Text(
            "Saltar",
            style: GoogleFonts.robotoCondensed(
              wordSpacing: 1,
              fontSize: 16,
              letterSpacing: 0,
            ),
          ),
          showDoneButton: true,
          done: Text(
            "Comecar a Utilizar",
            style: GoogleFonts.robotoCondensed(
              wordSpacing: 1,
              fontSize: 16,
              letterSpacing: 0,
            ),
          ),
        ),
      );
}

void saveInitState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('init', "true").then((value) => null);
}
