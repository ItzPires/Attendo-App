import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uc_here/const/constants.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dart:math';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainPageState extends State<MainPage> {
  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    //Main Page
    return ZoomDrawer(
        style: DrawerStyle.Style1,
        controller: zoomDrawerController,
        backgroundColor: Theme.of(context).colorScheme.onSurface,
        angle: -12,
        showShadow: true,
        borderRadius: 24.0,
        menuScreen: const MenuPage(),
        mainScreen: const MainScreen(),
        clipMainScreen: true,
        slideWidth: MediaQuery.of(context).size.width * 0.70);
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> lectures = [];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: Transform.scale(
            scale: 0.4,
            child: const DrawLogo(),
            alignment: Alignment.centerLeft,
          ),
          centerTitle: false,
        ),
        body: ListView.builder(
          itemBuilder: (context, i) {
            if (i == 0) myLectures[i].presenceChecked = true;
            return Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0x00000000),
                      shadowColor: Colors.black26,
                      elevation: 2,
                      alignment: Alignment.centerLeft,
                      fixedSize: Size(MediaQuery.of(context).size.width,
                          MediaQuery.of(context).size.height * 0.15),
                      shape: RoundedRectangleBorder(
                          side:
                              const BorderSide(width: 2, color: Colors.black45),
                          borderRadius: BorderRadius.circular(10))),
                  icon: SizedBox(
                      width: MediaQuery.of(context).size.shortestSide * 0.15,
                      child: FittedBox(
                        child: Text.rich(
                          TextSpan(
                            text: myLectures[i].abbreviation,
                            style: GoogleFonts.robotoCondensed(
                                fontWeight: FontWeight.bold,
                                fontSize: 35,
                                letterSpacing: 0,
                                color: Theme.of(context).colorScheme.onSurface),
                          ),
                        ),
                        fit: BoxFit.scaleDown,
                      )),
                  label: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const VerticalDivider(
                          endIndent: 10,
                          indent: 10,
                          color: Colors.black38,
                          thickness: 1,
                          width: 2,
                        ),
                        Container(
                          width:
                              MediaQuery.of(context).size.shortestSide * 0.615,
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(
                                    MediaQuery.of(context).size.shortestSide *
                                        0.015,
                                    0,
                                    0,
                                    0),
                                child: Text(
                                  myLectures[i].subject,
                                  textAlign: TextAlign.start,
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 14,
                                    letterSpacing: 0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        drawIconClass(myLectures[i].presenceChecked)
                      ]),
                  onPressed: () => {
                    Navigator.pushNamed(context, '/scan'),
                  },
                ));
          },
          itemCount: myLectures.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, '/scan'),
          tooltip: 'Scan Class QR Code',
          child: const Icon(Icons.qr_code_scanner),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: MediaQuery.of(context).size.width * 0.009,
          child: Row(
            children: [
              const Spacer(
                flex: 1,
              ),
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => ZoomDrawer.of(context)!.toggle(),
              ),
              const Spacer(flex: 4),
              IconButton(
                  icon: const Icon(Icons.person_sharp),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  }),
              const Spacer(flex: 1),
            ],
          ),
        ),
      ),
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 5) ZoomDrawer.of(context)!.toggle();
      },
    );
  }

  Widget drawIconClass(bool qrCodeRead) {
    if (qrCodeRead) {
      return Icon(
        Icons.check,
        color: Colors.green.shade400,
        size: 27,
      );
    }
    return Transform.rotate(
        angle: -pi / 4.0,
        child: const Icon(
          Icons.add,
          color: Colors.black38,
          size: 30,
        ));
  }
}

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  //TO USE
  void _handleLogout() async {
    me = null;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userMail');
    prefs.remove('userPassword');
    Navigator.pushNamedAndRemoveUntil(
        context, '/login', ModalRoute.withName('/login'));
  }

  @override
  Widget build(BuildContext context) {
    List<String>? names = me!.name.split(" ");
    String firstName = names.first;
    String lastName = names.last;
    return Scaffold(
        body: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: const Alignment(0, 1),
              end: const Alignment(0, -1),
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.primaryVariant,
                Theme.of(context).colorScheme.primary,
              ],
            )),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.05,
                          MediaQuery.of(context).size.height * 0.05,
                          0,
                          0),
                      child: Text.rich(TextSpan(children: [
                        TextSpan(
                          text: "Olá\n",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              letterSpacing: 0,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: " \n",
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              letterSpacing: 0,
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: firstName + "\n" + lastName,
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.normal,
                              fontSize: 27,
                              letterSpacing: 0,
                              color: Colors.black),
                        ),
                      ]))),
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.width * 0.1, 0, 0),
                      child: drawButton(
                          "Meu Perfil",
                          MediaQuery.of(context).size.width * 0.45,
                          Icons.person_outline,
                          "/profile")),
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, MediaQuery.of(context).size.width * 0.03, 0, 0),
                      child: drawButton(
                          "Sobre Nós",
                          MediaQuery.of(context).size.width * 0.50,
                          Icons.people_outline,
                          "/about_us")),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(context).size.width * 0.70, 0, 0),
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            primary: const Color(0x00000000),
                            shadowColor:
                                Theme.of(context).colorScheme.onSurface,
                            elevation: 0,
                            alignment: Alignment.centerLeft,
                            fixedSize: Size(
                                MediaQuery.of(context).size.width * 0.50,
                                MediaQuery.of(context).size.height * 0.06),
                            shape: const RoundedRectangleBorder(
                                side:
                                    BorderSide(width: 3, color: Colors.black45),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20)))),
                        label: Text(
                          "Sair",
                          style: GoogleFonts.roboto(
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            letterSpacing: 0,
                          ),
                        ),
                        icon: const Icon(
                          Icons.logout_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                        onPressed: () async {
                          ZoomDrawer.of(context)!.close();

                          _handleLogout();
                        }),
                  ),
                ],
              ),
            )));
  }

  Widget drawButton(String text, double width, IconData icon, String outpage) {
    return ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
            primary: const Color(0x00000000),
            shadowColor: Theme.of(context).colorScheme.onSurface,
            elevation: 0,
            alignment: Alignment.centerLeft,
            fixedSize: Size(width, MediaQuery.of(context).size.height * 0.06),
            shape: const RoundedRectangleBorder(
                side: BorderSide(width: 3, color: Colors.black45),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)))),
        label: Text(
          text,
          style: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: 20,
            letterSpacing: 0,
          ),
        ),
        icon: Icon(
          icon,
          color: Colors.black,
          size: 30,
        ),
        onPressed: () async {
          ZoomDrawer.of(context)!.close();
          await Future.delayed(const Duration(milliseconds: 250));
          Navigator.pushNamed(context, outpage);
        });
  }
}

class LectureText extends StatelessWidget {
  final List<String> lectures;
  LectureText(this.lectures);
  Widget lectureItem(BuildContext context, int index) {
    return Card(
        child: Row(
      children: [
        Column(children: [
          //letra inicial
          Text.rich(TextSpan(
            text: " A",
            style: GoogleFonts.rye(
                fontWeight: FontWeight.bold,
                fontSize: 80,
                letterSpacing: 0,
                color: Colors.black),
          )),
        ]),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(
            children: [
              Text.rich(TextSpan(
                //text: "Cadeira: \nHora | Sala\nPresença: (Por marcar/marcada)",
                text: lectures[index],
                style: GoogleFonts.abel(
                    fontWeight: FontWeight.normal,
                    fontSize: 21,
                    letterSpacing: 0,
                    color: Colors.black),
              ))
            ],
          ),
        )
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: lectureItem, itemCount: lectures.length);
  }
}
