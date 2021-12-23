import 'package:flutter/material.dart';
import 'package:uc_here/pages/init_page.dart';
import 'package:uc_here/pages/landing.dart';
import 'package:uc_here/pages/lesson.dart';
import 'dart:ui';
import 'package:url_strategy/url_strategy.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/login_page.dart';
import 'pages/qr_creator.dart';
import 'pages/qr_scanner.dart';
import 'pages/central_page.dart';
import 'pages/validate_qr.dart';

import 'pages/about_us.dart';
import 'pages/profile.dart';

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
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<String>? loggedInString;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendo',
      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
          elevation: 2,
          toolbarHeight: 55,
        ),
        textTheme: TextTheme(
          overline: GoogleFonts.roboto(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            letterSpacing: 0,
          ),
          bodyText1: GoogleFonts.roboto(
            fontWeight: FontWeight.normal,
            fontSize: 16,
            letterSpacing: 0,
          ),
          caption: GoogleFonts.roboto(
            fontWeight: FontWeight.normal,
            fontSize: 12,
            letterSpacing: 0,
          ),
          headline4: GoogleFonts.robotoCondensed(
              wordSpacing: 1,
              fontSize: 24,
              letterSpacing: 0,
              color: Theme.of(context).colorScheme.onPrimary),
        ),
        colorScheme: ColorScheme.dark(
            primary: Colors.blue.shade400,
            primaryVariant: Colors.blueAccent,
            secondary: Colors.blue.shade400,
            secondaryVariant: Colors.blue.shade400),
      ),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 2,
            toolbarHeight: 55,
            shadowColor: Theme.of(context).colorScheme.onSurface,
            foregroundColor: Theme.of(context).colorScheme.onSurface,
            backgroundColor: Theme.of(context).colorScheme.onPrimary),
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
        colorScheme: ColorScheme.light(
            primary: Colors.blue.shade600,
            primaryVariant: Colors.blueAccent,
            secondary: Colors.blue.shade600,
            secondaryVariant: Colors.blue.shade600),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          elevation: 10,
        ),
      ),
      themeMode: ThemeMode.light,
      initialRoute: '/',
      routes: {
        '/': (context) => Landing(),
        '/home': (context) => const MainPage(),
        '/init': (context) => const InitPage(),
        '/login': (context) => const LoginPage(),
        '/scan': (context) => const ScanPage(),
        '/generate': (context) => const QRCodeGen(),
        '/validate': (context) => const ValidatePage(),
        '/profile': (context) => const MyProfile(),
        '/about_us': (context) => const AboutUsPage(),
        '/lesson': (context) => const Lesson(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
