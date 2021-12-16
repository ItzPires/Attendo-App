import 'package:flutter/material.dart';
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
              title: "Titulo Teste 1",
              body: "Rumo ao 20",
              image: Center(
                  child: SvgPicture.asset(
                'assets/images/education.svg',
                clipBehavior: Clip.antiAlias,
                color: const Color(0xFF000000),
              )),
            ),
            PageViewModel(
              title: "Titulo Teste 2",
              body: "Attendo Lets Go",
              image: Center(
                  child: SvgPicture.asset(
                'assets/images/schoolBell.svg',
                clipBehavior: Clip.antiAlias,
                color: const Color(0xFF000000),
              )),
            ),
            PageViewModel(
              bodyWidget: Column(children: [
                const Text("Atendo Lets go"),
                ElevatedButton(
                  child: const Text("Entrar"),
                  onPressed: () {
                    saveInitState();
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/login', ModalRoute.withName('/login'));
                  },
                ),
              ]),
              title: "Titulo Teste 3",
              image: Center(child: DrawLogo()),
            )
          ],
          onDone: () {
            saveInitState();
            Navigator.pushNamedAndRemoveUntil(
                context, '/login', ModalRoute.withName('/login'));
          },
          next: const Text('Proximo'),
          showSkipButton: true,
          skip: const Text("Skip"),
          done: const Text("Comecar a Utilizar",
              style: TextStyle(fontWeight: FontWeight.w600)),
        ),
      );
}

void saveInitState() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('init', "true").then((value) => null);
}
