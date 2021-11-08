import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: const [Center(child: Text('You have pressed the button times.'))]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/second'),
        tooltip: 'Scan Class QR Code',
        child: const Icon(Icons.qr_code_2_rounded),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 4,
        child: Row(
          children: [
            const Spacer(flex: 1),
            IconButton(icon: Icon(Icons.menu), onPressed: () {}),
            const Spacer(flex: 4),
            IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
            const Spacer(flex: 1),
          ],
        ),
      ),
      extendBody: false,
    );
  }
}


