import 'package:flutter/material.dart';
import 'dart:ui';
import 'pages/login_page.dart';
import 'pages/qr_creator.dart';
import 'pages/qr_scanner.dart';
import 'pages/central_page.dart';
import 'pages/validate_qr.dart';

// TODO
// - About Us
// - Menu Esquerda
// - Menu central - AGENDA:
// Container - Calendário
// Container - Lista de a fazer

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            color: Color(0xFFFFFFFF),
            elevation: 0,
            foregroundColor: Color(0xFF000000)),
        //Criar opções para pessoa escolher
        primarySwatch: Colors.pink,
        backgroundColor: //const Color(0xFFFFFFFF),
        const Color(0xFFEE93E3),
        bottomAppBarColor: const Color(0xFFFFFFFF),
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MainPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/scan': (context) => const ScanPage(),

        '/generate': (context) => const TestPage(),

        '/validate': (context) => const ValidatePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
