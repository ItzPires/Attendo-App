import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:url_strategy/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/login_page.dart';
import 'pages/qr_creator.dart';
import 'pages/qr_scanner.dart';
import 'pages/central_page.dart';
import 'pages/validate_qr.dart';
import 'pages/landing_page.dart';
import 'pages/about_us.dart';
import 'pages/profile.dart';
// TODO

// Login

// Ecrã central de stor (APENAS MUDAR BOTAO PARA GENERATE)
// VERSAO WEB!

// - About Us

// - Menu Esquerda
// - Menu central - AGENDA de aulas

// Container - Calendário
// Container - Lista de a fazer

void main() async {
  setPathUrlStrategy();
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
        textTheme: TextTheme(
          overline: GoogleFonts.roboto(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 12,
            letterSpacing: 0,
          ),
          bodyText1: GoogleFonts.roboto(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 16,
            letterSpacing: 0,
          ),
          caption: GoogleFonts.roboto(
            fontWeight: FontWeight.normal,
            color: Colors.black,
            fontSize: 12,
            letterSpacing: 0,
          ),
          headline4: GoogleFonts.robotoCondensed(
            color: Colors.black,
            wordSpacing: 1,
            fontSize: 24,
            letterSpacing: 0,
          ),
        ),
        primaryColor: Colors.black,
        bottomAppBarColor: const Color(0xFFFFFFFF),
      ),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const MainPage(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/login': (context) => const LoginPage(),

        '/aboutus': (context) => const AboutUsPage(),

        '/scan': (context) => const ScanPage(),

        '/generate': (context) => const TestPage(),

        '/validate': (context) => const ValidatePage(),

        '/profile': (context) => MyProfile(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
