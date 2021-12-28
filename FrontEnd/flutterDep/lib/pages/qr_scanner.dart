import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'validate_qr.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ScanPage> createState() => _ScanPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ScanPageState extends State<ScanPage> {
  late QRViewController qrController;
  GlobalKey qRKey = GlobalKey(debugLabel: 'Qr');
  bool cameraOrientBack = true;
  bool flashOn = false;
  int count = 0;
  @override
  void dispose() {
    super.dispose();
    qrController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        buildQrView(context),
        Positioned(
          child: FloatingActionButton(
            onPressed: () => {Navigator.pop(context)},
            tooltip: 'Voltar',
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFFFFFFFF),
            ),
            backgroundColor: const Color(0x1affffff),
            elevation: 0,
            isExtended: false,
          ),
          bottom: 30,
          left: 20,
        ),
        Positioned(
          right: 20,
          bottom: 30,
          child: buildFlash(),
        )
      ],
    ));
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qRKey,
      onQRViewCreated: viewQRCode,
      formatsAllowed: const [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
        cutOutBottomOffset: 10,
        borderLength: MediaQuery.of(context).size.shortestSide * 0.13,
        borderRadius: MediaQuery.of(context).size.shortestSide * 0.1,
        borderWidth: MediaQuery.of(context).size.shortestSide * 0.03,
        borderColor: Colors.black,
        cutOutSize: MediaQuery.of(context).size.shortestSide * 0.8,
      ),
    );
  }

  void viewQRCode(QRViewController qrController) {
    setState(() {
      this.qrController = qrController;
    });
    qrController.scannedDataStream.listen((barcode) {
      if (count == 0) {
        Navigator.pushReplacementNamed(context, "/validate",
            arguments: barcode.code);
        count++;
      }
    });
  }

  Widget buildFlash() {
    if (!cameraOrientBack) {
      return const Spacer();
    }

    if (flashOn) {
      return IconButton(
          iconSize: 50,
          onPressed: () {
            setState(() {
              qrController.toggleFlash();

              flashOn = !flashOn;
            });
          },
          icon: const Icon(Icons.flash_off_outlined));
    }
    return IconButton(
        iconSize: 50,
        onPressed: () {
          setState(() {
            qrController.toggleFlash();
            flashOn = !flashOn;
          });
        },
        icon: const Icon(Icons.flash_on_outlined));
  }
}
