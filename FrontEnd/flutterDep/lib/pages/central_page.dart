import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uc_here/const/constants.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainPageState extends State<MainPage> {
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
    //Main Page
    return Scaffold(
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
        notchMargin: 4,
        child: Row(
          children: [
            const Spacer(flex: 1),
            IconButton(
                icon: const Icon(Icons.qr_code),
                onPressed: () {
                  Navigator.pushNamed(context, "/about_us");
                }),
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
      extendBody: false,
    );
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
