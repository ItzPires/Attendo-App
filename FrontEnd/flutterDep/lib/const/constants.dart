import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uc_here/models/lecture.dart';

import 'package:uc_here/models/user.dart';

//TEST IN ANDROID STUDIO
String apiURLTest = "http://10.3.3.109/";
User? me;
List<Lecture> myLectures = [];

class DrawLogo extends StatelessWidget {
  const DrawLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      color: Theme.of(context).colorScheme.onSurface,
      semanticsLabel: "App Logo: Attendo",
    );
  }
}

class DrawLogoQROnly extends StatelessWidget {
  const DrawLogoQROnly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/QR_white.svg',
      color: Theme.of(context).colorScheme.onSurface,
      fit: BoxFit.scaleDown,
      width: 80,
      height: 80,
      semanticsLabel: "App Logo: Attendo QR code",
    );
  }
}

AppBar topAppBar() {
  return AppBar(
    title: Transform.scale(
      scale: 0.4,
      child: const DrawLogo(),
      alignment: Alignment.centerLeft,
    ),
    centerTitle: false,
  );
}
