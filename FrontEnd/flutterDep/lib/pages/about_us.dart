import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: SizedBox(
                  width: 200,
                  height: 150,
                  child: SvgPicture.asset(
                    'assets/images/logo.svg',
                    clipBehavior: Clip.antiAlias,
                    color: const Color(0xFF000000),
                  )),
            ),
            Title(
                color: Colors.black,
                child: const Text(
                  "Sobre Nós",
                  style: TextStyle(fontSize: 20),
                )),
            const Text(
                "Attendo é uma aplicação desenvolvida por um grupo de estudantes do 3ºano de Engenharia Informática da Universidade de Coimbra no âmbito da cadeira de Processos de Gestão e de Inovação."),
            const SizedBox(
              height: 300,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      'assets/images/insta.svg',
                      clipBehavior: Clip.antiAlias,
                      color: const Color(0xFF000000),
                    )),
                SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      'assets/images/facebook.svg',
                      clipBehavior: Clip.antiAlias,
                      color: const Color(0xFF000000),
                    )),
                SizedBox(
                    width: 30,
                    height: 30,
                    child: SvgPicture.asset(
                      'assets/images/tiktok.svg',
                      clipBehavior: Clip.antiAlias,
                      color: const Color(0xFF000000),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
