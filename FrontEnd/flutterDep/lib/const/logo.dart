import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DrawLogo extends StatelessWidget {
  const DrawLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/logo.svg',
      color: const Color(0xFF000000),
      semanticsLabel: "App Logo: Attendo",
    );
  }
}
