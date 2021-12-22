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
        notchMargin: 2,
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
              padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: Text(
                "Attendo é uma aplicação desenvolvida por um grupo de estudantes do 3ºano de Engenharia Informática da Universidade de Coimbra no âmbito da cadeira de Processos de Gestão e de Inovação.",
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
                softWrap: true,
              )),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 40, 0, 10),
              child: SizedBox(width: 210, height: 120, child: AnimatedText())),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                "Arrasta para conheceres cada um de nós:",
                style: Theme.of(context).textTheme.headline4,
                textAlign: TextAlign.center,
              )),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DrawPerson("Adriana Bernardo", "Adriana",
                        "O Professor gera um QR Code através do site e na aula partilha-o com os alunos."),
                    DrawPerson("Pedro Duarte", "Duarte",
                        "O Professor gera um QR Code através do site e na aula partilha-o com os alunos."),
                    DrawPerson("Fábio Vaqueiro", "fabio",
                        "O Professor gera um QR Code através do site e na aula partilha-o com os alunos."),
                    DrawPerson("Pedro Mendes", "mendes",
                        "O Professor gera um QR Code através do site e na aula partilha-o com os alunos."),
                    DrawPerson("Samuel Pires", "sam",
                        "O Professor gera um QR Code através do site e na aula partilha-o com os alunos."),
                    DrawPerson("Pedro Chaves", "Chaves",
                        "O Professor gera um QR Code através do site e na aula partilha-o com os alunos."),
                    DrawPerson("João Fernandes", "joao",
                        "O Professor gera um QR Code através do site e na aula partilha-o com os alunos."),
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
              "Aviso legal: os conteúdos constantes desta aplicação foram realizados por alunos no âmbito de uma disciplina– Processos de Gestão e Inovação - do 3º ano da licenciatura de Engenharia Informática da Faculdade de Ciências e Tecnologia da Universidade de Coimbra (FCTUC), pelo que a FCTUC não se responsabiliza pelo seu conteúdo.",
              style: Theme.of(context).textTheme.caption,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }

  Widget DrawPerson(String name, String photo, String description) {
    return Container(
      padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.05, 0,
          MediaQuery.of(context).size.width * 0.05, 0),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Title(
            color: Colors.black,
            child: Text(
              name,
              style: TextStyle(fontSize: 20),
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
          Text(
            description,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
