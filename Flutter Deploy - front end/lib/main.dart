import 'package:flutter/material.dart';
import 'dart:ui';
import 'pages/login_page.dart';
import 'pages/qr_creator.dart';
import 'pages/qr_scanner.dart';
import 'pages/central_page.dart';
import 'pages/validate_qr.dart';

// TODO
// Login
// Ecrã central de stor
// - About Us
// - Menu Esquerda
// - Menu central - AGENDA de aulas
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
            elevation: 2,
            toolbarHeight: 55,
            shadowColor: Color(0xFF000000),
            foregroundColor: Color(0xFF000000)),
        //TODO Criar opções para pessoa escolher
        primarySwatch: Colors.green,
        bottomAppBarColor: const Color(0xFFFFFFFF),
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MainPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => const LoginPage(),

        '/scan': (context) => const ScanPage(),

        '/generate': (context) => const TestPage(),

        '/validate': (context) => const ValidatePage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
