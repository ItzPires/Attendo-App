import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:uc_here/const/constants.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPagePageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _LandingPagePageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    if (_size.width > 600) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: _size.height / 9,
        ),
        body: const ResponsiveWebDesktop(),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            child: const StaticText(),
            padding:
                EdgeInsets.fromLTRB(_size.width / 6, 5, _size.width / 6, 5),
            height: _size.height / 7,
          ),
        ),
      );
    } else {
      return Scaffold(
          appBar: AppBar(
            title: Transform.scale(scale: 0.5, child: const DrawLogo()),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                  child: const StaticText(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30)),
              Container(
                  child: const AnimatedText(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 70)),
            ]),
          ));
    }
  }
}

class ResponsiveWebDesktop extends StatelessWidget {
  const ResponsiveWebDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Flexible(
            flex: 3,
            child: DrawLogo(),
          ),
          VerticalDivider(
            color: Colors.black,
            thickness: 2,
          ),
          Flexible(
            flex: 5,
            child: DescriptionText(),
          ),
        ]);
  }
}

class DescriptionText extends StatelessWidget {
  const DescriptionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        width: _size.width / 2,
        child: const AnimatedText(),
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    int time = 10;
    final TextStyle _styleAnimated = GoogleFonts.abel(
      textStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: math.max((_size.longestSide / 60), 16),
      ),
    );

    final TextStyle _styleAnimatedBold = GoogleFonts.abel(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: math.max((_size.longestSide / 40), 20)),
    );
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      AnimatedTextKit(
        isRepeatingAnimation: true,
        repeatForever: true,
        animatedTexts: [
          FadeAnimatedText(
            'Objetivo da aplica????o:',
            duration: Duration(seconds: time),
            textAlign: TextAlign.center,
            textStyle: _styleAnimatedBold,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
          FadeAnimatedText(
            'Modo de funcionamento:',
            duration: Duration(seconds: time),
            textAlign: TextAlign.center,
            textStyle: _styleAnimatedBold,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
          FadeAnimatedText(
            'Porqu?? esta aplica????o:',
            duration: Duration(seconds: time),
            textAlign: TextAlign.center,
            textStyle: _styleAnimatedBold,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
        ],
      ),
      AnimatedTextKit(
        isRepeatingAnimation: true,
        repeatForever: true,
        animatedTexts: [
          FadeAnimatedText(
            'Simplificar a marca????o de presen??as nas aulas atrav??s da utiliza????o de um QR Code para marcar as presen??as. ',
            duration: Duration(seconds: time),
            textAlign: TextAlign.center,
            textStyle: _styleAnimated,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
          FadeAnimatedText(
            'O professor gera um QR Code atrav??s deste site e na aula partilha-o com os alunos.\nOs alunos l??em o Qr Code com a aplica????o, ficando, assim, marcada a sua presen??a.',
            duration: Duration(seconds: time),
            textAlign: TextAlign.center,
            textStyle: _styleAnimated,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
          FadeAnimatedText(
            'Esta ideia de aplica????o surgiu no contexto de uma poss??vel solu????o para um problema comum a algumas faculdades: dificuldade em marcar e controlar as presen??as nas aulas. ',
            duration: Duration(seconds: time),
            textAlign: TextAlign.center,
            textStyle: _styleAnimated,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
        ],
      ),
    ]);
  }
}

class StaticText extends StatelessWidget {
  const StaticText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final TextStyle _styleBold = GoogleFonts.abel(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: math.max((_size.longestSide / 50), 18)),
    );
    final TextStyle _style = GoogleFonts.abel(
      textStyle: const TextStyle(
          fontWeight: FontWeight.normal, color: Colors.black, fontSize: 13),
    );
    return RichText(
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
        text: TextSpan(
          children: [
            TextSpan(
                text:
                    "Aviso legal: os conte??dos constantes website foram realizados por alunos no ??mbito de uma disciplina??? Processos de Gest??o e Inova????o - do 3?? ano da licenciatura de Engenharia Inform??tica da Faculdade de Ci??ncias e Tecnologia da Universidade de Coimbra (FCTUC), pelo que a FCTUC n??o se responsabiliza pelo seu conte??do",
                style: _style)
          ],
        ));
  }
}
