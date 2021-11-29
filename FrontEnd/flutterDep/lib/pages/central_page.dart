import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Attendo"),
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
            IconButton(icon: Icon(Icons.qr_code), onPressed: () {Navigator.pushNamed(context, '/generate');}),
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
