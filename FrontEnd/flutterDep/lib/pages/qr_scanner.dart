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
  QRViewController? qrController;
  GlobalKey qRKey = GlobalKey(debugLabel: 'Qr');

  @override
  void dispose() {
    qrController?.dispose();
    super.dispose();
  }

  //USED FOR HOT RELOAD ONLY
  @override
  void reassemble() async {
    super.reassemble();
    if (Platform.isAndroid) {
      await qrController!.pauseCamera();
    }
    qrController!.resumeCamera();
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
            onPressed: () => Navigator.pop(context),
            tooltip: 'Scan QR Code',
            child: const Icon(
              Icons.arrow_back,
              color: Color(0xFFFFFFFF),
            ),
            backgroundColor: const Color(0x5C493A3A),
            elevation: 0,
            isExtended: false,
          ),
          bottom: 30,
          left: 20,
        ),
      ],
    ));
  }

  Widget buildQrView(BuildContext context) => QRView(
        key: qRKey,
        onQRViewCreated: viewQRCode,
        overlay: QrScannerOverlayShape(
          borderLength: MediaQuery.of(context).size.shortestSide * 0.13,
          borderRadius: MediaQuery.of(context).size.shortestSide * 0.1,
          borderWidth: MediaQuery.of(context).size.shortestSide * 0.03,
          borderColor: Colors.black,
          cutOutSize: MediaQuery.of(context).size.shortestSide * 0.8,
        ),
      );

  void viewQRCode(QRViewController qrController) {
    setState(() {
      this.qrController = qrController;
    });
    qrController.scannedDataStream.listen((barcode) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ValidatePage(code: barcode.code)));
      dispose();
    });
  }
}
