import 'package:flutter/material.dart';
import 'package:uc_here/const/constants.dart';
import 'package:uc_here/pages/login_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainPageState extends State<MainPage> {
  Widget? draw_first_time_page(BuildContext context) {
    return null;
  }

  Widget mainPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Transform.scale(
          scale: 0.4,
          child: const DrawLogo(),
          alignment: Alignment.centerLeft,
        ),
        centerTitle: false,
      ),
      body: const Center(child: Text('Attendo app landing page')),
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
                  Navigator.pushNamed(context, '/login');
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

  @override
  Widget build(BuildContext context) {
    if (logged_in == true)
      return mainPage(context);
    else
      return LoginPage();
  }
}
