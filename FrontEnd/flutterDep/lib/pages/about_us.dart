import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uc_here/const/constants.dart';

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
        title: Transform.scale(
          scale: 0.4,
          child: const DrawLogo(),
          alignment: Alignment.centerLeft,
        ),
        centerTitle: false,
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 2,
        child: Row(
          children: [
            const Spacer(flex: 1),
            IconButton(
                icon: SvgPicture.asset(
                  'assets/images/insta.svg',
                  clipBehavior: Clip.antiAlias,
                  color: const Color(0xFF000000),
                ),
                onPressed: () async {
                  const url = 'https://www.instagram.com/attendo.app/';

                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
            const Spacer(flex: 1),
            IconButton(
                icon: SvgPicture.asset(
                  'assets/images/facebook.svg',
                  clipBehavior: Clip.antiAlias,
                  color: const Color(0xFF000000),
                ),
                onPressed: () async {
                  const url = 'https://www.facebook.com/Attendo.App.UC';

                  if (await canLaunch(url)) {
                    await launch(url, forceSafariVC: false);
                  } else {
                    throw 'Could not launch $url';
                  }
                }),
            const Spacer(flex: 1),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          Center(
            child: SizedBox(
              width: 200,
              height: 200,
              child: SvgPicture.asset(
                'assets/images/logo.svg',
                clipBehavior: Clip.antiAlias,
                color: const Color(0xFF000000),
              ),
            ),
          ),
          Title(
            color: Colors.black,
            child: const Text(
              "Sobre Nós",
              style: TextStyle(fontSize: 48),
              textAlign: TextAlign.center,
            ),
          ),
          const Text(
            "Attendo é uma aplicação desenvolvida por um grupo de estudantes do 3ºano de Engenharia Informática da Universidade de Coimbra no âmbito da cadeira de Processos de Gestão e de Inovação.",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 20,
          ),
          Title(
            color: Colors.black,
            child: const Text(
              "Qual o Objectivo?",
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
          const Text(
            "Simplificar a marcação de presenças nas aulas através da utilização de um QR CODE",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 20,
          ),
          Title(
            color: Colors.black,
            child: const Text(
              "Qual o Modo de Funcionamento?",
              style: TextStyle(fontSize: 28),
              textAlign: TextAlign.center,
            ),
          ),
          const Text(
            "O Professor gera um QR COde através do site e na aula partilha-o com os alunos.",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 20,
          ),
          const Text(
            "Os Alunos lêem o QR CODE com a aplicação, ficando, assim, marcada a sua presença.",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 35,
          ),
          Title(
            color: Colors.black,
            child: const Text(
              "Quem Somos Nós?",
              style: TextStyle(fontSize: 48),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 35,
          ),
          Title(
            color: Colors.black,
            child: const Text(
              "Pedro Chaves",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 100,
            child: CircleAvatar(
              radius: 95,
              backgroundImage: AssetImage('assets/images/chaves.jpeg'),
            ),
          ),
          const Text(
            "O Professor gera um QR COde através do site e na aula partilha-o com os alunos.",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 35,
          ),
          Title(
            color: Colors.black,
            child: const Text(
              "Pedro Duarte",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 100,
            child: CircleAvatar(
              radius: 95,
              backgroundImage: AssetImage('assets/images/chaves.jpeg'),
            ),
          ),
          const Text(
            "O Professor gera um QR COde através do site e na aula partilha-o com os alunos.",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 35,
          ),
          Title(
            color: Colors.black,
            child: const Text(
              "Adriana Bernardo",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 100,
            child: CircleAvatar(
              radius: 95,
              backgroundImage: AssetImage('assets/images/chaves.jpeg'),
            ),
          ),
          const Text(
            "O Professor gera um QR COde através do site e na aula partilha-o com os alunos.",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 35,
          ),
          Title(
            color: Colors.black,
            child: const Text(
              "João Fernandes",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 100,
            child: CircleAvatar(
              radius: 95,
              backgroundImage: AssetImage('assets/images/chaves.jpeg'),
            ),
          ),
          const Text(
            "O Professor gera um QR COde através do site e na aula partilha-o com os alunos.",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 35,
          ),
          Title(
            color: Colors.black,
            child: const Text(
              "Fabio Baqueiro",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 100,
            child: CircleAvatar(
              radius: 95,
              backgroundImage: AssetImage('assets/images/chaves.jpeg'),
            ),
          ),
          const Text(
            "O Professor gera um QR COde através do site e na aula partilha-o com os alunos.",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 35,
          ),
          Title(
            color: Colors.black,
            child: const Text(
              "Pedro Mendes",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 100,
            child: CircleAvatar(
              radius: 95,
              backgroundImage: AssetImage('assets/images/chaves.jpeg'),
            ),
          ),
          const Text(
            "O Professor gera um QR COde através do site e na aula partilha-o com os alunos.",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 35,
          ),
          Title(
            color: Colors.black,
            child: const Text(
              "Samuel Pires",
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const CircleAvatar(
            backgroundColor: Colors.black,
            radius: 100,
            child: CircleAvatar(
              radius: 95,
              backgroundImage: AssetImage('assets/images/chaves.jpeg'),
            ),
          ),
          const Text(
            "O Professor gera um QR COde através do site e na aula partilha-o com os alunos.",
            style: TextStyle(fontSize: 16),
          ),
          Container(
            height: 35,
          ),
        ],
      ),
    );
  }
}
