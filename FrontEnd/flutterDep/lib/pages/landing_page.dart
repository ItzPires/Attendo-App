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

    final TextStyle _style = GoogleFonts.abel(
        textStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: math.max((_size.shortestSide / 50), 14)),
        color: Colors.black);
    if (_size.width > 600) {
      return Scaffold(
          body: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 400, minWidth: 600),
              child: Column(
                children: const [
                  Spacer(flex: 2),
                  Expanded(
                      flex: 10, child: Center(child: ResponsiveWebDesktop())),
                  Spacer(flex: 2),
                ],
              )));
    } else {
      return Scaffold(
        body: Column(children: [
          Container(
              // A fixed-height child.
              child: DrawLogo(),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30)),
          Divider(
            color: Colors.black,
            thickness: 2,
            height: 0,
          ),
          Container(
              child: StaticText(),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30)),
          Container(
              child: AnimatedText(),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 70)),
        ]),
      );
    }
  }
}

class ResponsiveWebDesktop extends StatefulWidget {
  const ResponsiveWebDesktop({Key? key}) : super(key: key);
  @override
  State<ResponsiveWebDesktop> createState() => _ResponsiveWebDesktopPageState();
}

class _ResponsiveWebDesktopPageState extends State<ResponsiveWebDesktop> {
  @override
  Widget build(BuildContext context) {
    return Row(children: const [
      Expanded(flex: 60, child: DrawLogo()),
      VerticalDivider(
        color: Colors.black,
        thickness: 2,
        width: 20,
      ),
      Spacer(
        flex: 5,
      ),
      Expanded(flex: 100, child: DescriptionText()),
      Spacer(
        flex: 8,
      ),
    ]);
  }
}

class DrawLogo extends StatefulWidget {
  const DrawLogo({Key? key}) : super(key: key);

  @override
  State<DrawLogo> createState() => _DrawLogoPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DrawLogoPageState extends State<DrawLogo> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      clipBehavior: Clip.none,
      color: const Color(0xFF000000),
    );
  }
}

class DescriptionText extends StatefulWidget {
  const DescriptionText({Key? key}) : super(key: key);

  @override
  State<DescriptionText> createState() => _DescriptionTextPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _DescriptionTextPageState extends State<DescriptionText> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(child: StaticText(), height: 100),
          Container(child: AnimatedText(), height: 110)
        ]);
  }
}

class AnimatedText extends StatefulWidget {
  const AnimatedText({Key? key}) : super(key: key);

  @override
  State<AnimatedText> createState() => _AnimatedTextPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _AnimatedTextPageState extends State<AnimatedText> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final TextStyle _styleAnimated = GoogleFonts.abel(
      textStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: math.max((_size.longestSide / 60), 14),
      ),
    );

    final TextStyle _styleAnimatedBold = GoogleFonts.abel(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: math.max((_size.longestSide / 40), 14)),
    );
    return Column(children: [
      AnimatedTextKit(
        isRepeatingAnimation: true,
        repeatForever: true,
        animatedTexts: [
          FadeAnimatedText(
            'Objetivo da aplicação:',
            duration: const Duration(seconds: 10),
            textAlign: TextAlign.center,
            textStyle: _styleAnimatedBold,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
          FadeAnimatedText(
            'Modo de funcionamento:',
            duration: const Duration(seconds: 10),
            textAlign: TextAlign.center,
            textStyle: _styleAnimatedBold,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
          FadeAnimatedText(
            'Porquê esta aplicação:',
            duration: const Duration(seconds: 10),
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
            duration: const Duration(seconds: 10),
            textAlign: TextAlign.justify,
            textStyle: _styleAnimated,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
          FadeAnimatedText(
            'Este QR Code vai ser gerado através deste site pelo Professor, que na respetiva aula o partilha com os alunos. Estes, utilizando o telemóvel, lêem o Qr Code com a aplicação, ficando, assim, marcada a sua presença.',
            duration: const Duration(seconds: 10),
            textAlign: TextAlign.justify,
            textStyle: _styleAnimated,
            fadeOutBegin: 0.9,
            fadeInEnd: 0.1,
          ),
          FadeAnimatedText(
            'Esta ideia de aplicação surgiu no contexto de uma possível solução para um problema comum a algumas faculdades: dificuldade em marcar e controlar as presenças nas aulas. ',
            duration: const Duration(seconds: 10),
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

class StaticText extends StatefulWidget {
  const StaticText({Key? key}) : super(key: key);

  @override
  State<StaticText> createState() => _StaticTextPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _StaticTextPageState extends State<StaticText> {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    final TextStyle _styleBold = GoogleFonts.abel(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: math.max((_size.longestSide / 40), 14)),
    );
    final TextStyle _style = GoogleFonts.abel(
      textStyle: TextStyle(
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontSize: math.max((_size.longestSide / 60), 14)),
    );
    return RichText(
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
        text: TextSpan(
          children: [
            TextSpan(text: "Attendo", style: _styleBold),
            TextSpan(
                text:
                    " é uma aplicação desenvolvida por um grupo de estudantes do 3º Ano de Engenharia Informática da Universidade de Coimbra no âmbito da cadeia de Processos de Gestão e Inovação.",
                style: _style)
          ],
        ));
  }
}
