// ignore: file_names
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  State<TestPage> createState() => _TestPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, title: const Text('ListTile with red background')),
      body: const Center(child: QRCodeWriter()),
    );
  }
}

class QRCodeWriter extends StatelessWidget {
  const QRCodeWriter({Key? key}) : super(key: key);

  String generateQRCODE() {
    int _code = Random().nextInt(100000) + 900000;
    return "$_code";
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size.square(300),
      painter: QrPainter(
        data: generateQRCODE(),
        version: QrVersions.auto,
        eyeStyle: const QrEyeStyle(
          eyeShape: QrEyeShape.square,
          color: Color(0xff000000),
        ),
        dataModuleStyle: const QrDataModuleStyle(
          dataModuleShape: QrDataModuleShape.circle,
          color: Color(0xff000000),
        ),
        // size: 320.0,

        embeddedImageStyle: QrEmbeddedImageStyle(
          size: const Size.square(20),
          color: Colors.green,
        ),
      ),
    );
  }
}
