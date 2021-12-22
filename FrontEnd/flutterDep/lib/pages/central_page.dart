import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uc_here/const/constants.dart';

import 'package:uc_here/pages/profile.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:google_fonts/google_fonts.dart';

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
        slideWidth: MediaQuery.of(context).size.width * 0.70);
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
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
         body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
              height: 100,
              color: Colors.amber[600],
              child: const LectureText()),
          Container(
            height: 500,
            color: Colors.amber[500],
            child: const Center(child: LectureText()),
          ),
        ],
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
              Spacer(
                flex: 1,
              ),
              IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () => ZoomDrawer.of(context)!.toggle(),
              ),
              Spacer(flex: 4),
              IconButton(
                  icon: const Icon(Icons.person_sharp),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  }),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
      onHorizontalDragUpdate: (details) {
        if (details.delta.dx > 5) ZoomDrawer.of(context)!.toggle();
      },
    );
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
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('userMail');
    prefs.remove('userPassword');
    Navigator.pushNamedAndRemoveUntil(
        context, '/login', ModalRoute.withName('/login'));
  }

  @override
  Widget build(BuildContext context) {
    List<String> names = me!.name.split(" ");
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
  const LectureText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextStyle _initLecture = GoogleFonts.rye(
      textStyle: const TextStyle(
          fontWeight: FontWeight.normal, color: Colors.black, fontSize: 80),
    );

    final TextStyle _lectureText = GoogleFonts.abel(
      textStyle: const TextStyle(
          fontWeight: FontWeight.normal, color: Colors.black, fontSize: 21),
    );

    return RichText(
        textAlign: TextAlign.left,
        overflow: TextOverflow.clip,
        text: TextSpan(children: [
          TextSpan(text: " A", style: _initLecture),
          TextSpan(
              text: "Cadeira: \nHora | Sala\nPresença: (Por marcar/marcada)\n",
              style: _lectureText)
        ]));
  }
}
