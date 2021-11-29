import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;

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

class DrawLogo extends StatelessWidget {
  const DrawLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      clipBehavior: Clip.antiAlias,
      color: const Color(0xFF000000),
    );
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
            'Objetivo da aplicação:',
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
            'Porquê esta aplicação:',
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
            'Simplificar a marcação de presenças nas aulas através da utilização de um QR Code para marcar as presenças. ',
            duration: Duration(seconds: time),
            textAlign: TextAlign.center,
            textStyle: _styleAnimated,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
          FadeAnimatedText(
            'O professor gera um QR Code através deste site e na aula partilha-o com os alunos.\nOs alunos lêem o Qr Code com a aplicação, ficando, assim, marcada a sua presença.',
            duration: Duration(seconds: time),
            textAlign: TextAlign.center,
            textStyle: _styleAnimated,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
          FadeAnimatedText(
            'Esta ideia de aplicação surgiu no contexto de uma possível solução para um problema comum a algumas faculdades: dificuldade em marcar e controlar as presenças nas aulas. ',
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
                    "Aviso legal: os conteúdos constantes website foram realizados por alunos no âmbito de uma disciplina– Processos de Gestão e Inovação - do 3º ano da licenciatura de Engenharia Informática da Faculdade de Ciências e Tecnologia da Universidade de Coimbra (FCTUC), pelo que a FCTUC não se responsabiliza pelo seu conteúdo",
                style: _style)
          ],
        ));
  }
}
