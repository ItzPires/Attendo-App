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
  CameraFacing cameraOrient = CameraFacing.back;
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
            onPressed: () => {Navigator.pop(context)},
            tooltip: 'Scan QR Code',
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
          child: IconButton(
              iconSize: 50,
              onPressed: () {
                setState(() {
                  if (cameraOrient == CameraFacing.back) {
                    cameraOrient = CameraFacing.front;
                  } else {
                    cameraOrient = CameraFacing.back;
                  }
                });
              },
              icon: const Icon(Icons.cameraswitch_outlined)),
          bottom: 30,
        )
      ],
    ));
  }

  Widget buildQrView(BuildContext context) {
    return QRView(
      key: qRKey,
      onQRViewCreated: viewQRCode,
      cameraFacing: cameraOrient,
      formatsAllowed: const [BarcodeFormat.qrcode],
      overlay: QrScannerOverlayShape(
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
      Navigator.pushReplacementNamed(context, "/validate",
          arguments: barcode.code);
      dispose();
    });
  }
}
