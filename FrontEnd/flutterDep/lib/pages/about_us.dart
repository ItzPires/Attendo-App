import 'package:animated_text_kit/animated_text_kit.dart' as anim;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uc_here/const/constants.dart';

import 'package:uc_here/pages/landing_page.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Sobre nós",
                textAlign: TextAlign.start,
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
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
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
                icon: SvgPicture.asset(
                  'assets/images/insta.svg',
                  clipBehavior: Clip.antiAlias,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () async {
                  const url = 'https://www.instagram.com/attendo.app/';

                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
            IconButton(
                icon: Transform.scale(
                    scale: 1.3,
                    child: SvgPicture.asset(
                      'assets/images/facebook.svg',
                      clipBehavior: Clip.antiAlias,
                      color: Theme.of(context).colorScheme.onSurface,
                    )),
                onPressed: () async {
                  const url = 'https://www.facebook.com/Attendo.App.UC';

                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          const Center(
            child: SizedBox(
              width: 210,
              height: 120,
              child: DrawLogo(),
            ),
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                "Attendo é uma aplicação desenvolvida por um grupo de estudantes do 3ºano de Engenharia Informática da Universidade de Coimbra no âmbito da cadeira de Processos de Gestão e de Inovação.",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
                softWrap: true,
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
              child: SizedBox(width: 210, height: 120, child: AnimatedText())),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.1,
                            0,
                            MediaQuery.of(context).size.width * 0.1,
                            0),
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: anim.AnimatedTextKit(
                          animatedTexts: [
                            anim.TypewriterAnimatedText(
                                "Arrasta e conhece cada um de nós",
                                textStyle:
                                    Theme.of(context).textTheme.headline4,
                                textAlign: TextAlign.center,
                                speed: const Duration(milliseconds: 100))
                          ],
                          isRepeatingAnimation: true,
                          repeatForever: true,
                        )),
                    drawPerson("Adriana Bernardo", "Adriana",
                        "A única rapariga do grupo, não gosta de programar e tem mau feitio.\nGosta de preencher e de completar templates, assim como tratar das redes sociais.\nDeu origem à ideia que depois foi refinada pelo resto da equipa.\nPor ela a aplicação seria full cor-de-rosa."),
                    drawPerson("Pedro Duarte", "Duarte",
                        "O cérebro das operações da equipa, que só pára quando a aplicação estiver perfeita!\nEstá sempre muito aplicado e quer que tudo corra na perfeição.\nTem sempre boas ideias e ultimamente tem se armado em designer (está a sair-se muito bem)."),
                    drawPerson("Fábio Vaqueiro", "fabio",
                        "O elemento do grupo que anda sempre atrasado, contudo a sua presença é sempre bem-vinda, uma vez que é o brincalhão.\nQuando tem tempo gosta de dormir muito, mas os desafios levam-no às imensas diretas produtivas.\nAtualmente é um dos desenvolvedores e para ele a simplicidade marca sempre a presença!"),
                    drawPerson("Pedro Mendes", "mendes",
                        "Sonhava desde pequenino fazer uma aplicação para marcar presenças.\n No seu tempo livre gosta de fingir que sabe programar em C.\nSe não fosse daltónico, a aplicação seria azul.\nNo futuro espera viver com a sua esposa, 2 cães e 2 furões, enquanto investe em imobiliário."),
                    drawPerson("Samuel Pires", "sam",
                        "print(\"O avô do grupo, queria ser TikToker, mas o destino levou-o para outro caminho.\nAgora é um dos desenvolvedores.\")"),
                    drawPerson("Pedro Chaves", "Chaves",
                        "Veio de \"Espanha\" para se tornar informático e está agora a tentar conquistar o mercado de presenças português.\nQuem sabe se no futuro não irá conquistar tambem o mercado do seu país!"),
                    drawPerson("João Fernandes", "joao",
                        "O João é muito simples!\nÉ aluno da cadeira de Processos de Gestão e de Inovação e adora-a!"),
                  ],
                )),
          ),
          Divider(
            color: Theme.of(context).colorScheme.onSurface,
            thickness: 1.1,
            indent: MediaQuery.of(context).size.width * 0.05,
            endIndent: MediaQuery.of(context).size.width * 0.05,
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.09,
                20,
                MediaQuery.of(context).size.width * 0.09,
                5),
            child: Text(
              "Aviso legal: os conteúdos constantes desta aplicação foram realizados por alunos no âmbito de uma disciplina - Processos de Gestão e Inovação - do 3º ano da licenciatura de Engenharia Informática da Faculdade de Ciências e Tecnologia da Universidade de Coimbra (FCTUC), pelo que a FCTUC não se responsabiliza pelo seu conteúdo.",
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget drawPerson(String name, String photo, String description) {
    return Container(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 0,
          MediaQuery.of(context).size.width * 0.05, 0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              MediaQuery.of(context).size.width * 0.02,
              0,
              MediaQuery.of(context).size.width * 0.01,
            ),
            child: Text(
              name,
              style: Theme.of(context).textTheme.headline4,
              textAlign: TextAlign.center,
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 100,
            child: CircleAvatar(
              radius: 95,
              backgroundImage: AssetImage('assets/Membros/$photo.png'),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              0,
              MediaQuery.of(context).size.width * 0.05,
              0,
              MediaQuery.of(context).size.width * 0.01,
            ),
            child: Text(
              description,
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.normal,
                fontSize: 18,
                letterSpacing: 0,
              ),
              textAlign: TextAlign.center,
              semanticsLabel: "Descrição dos membros",
            ),
          )
        ],
      ),
    );
  }
}
