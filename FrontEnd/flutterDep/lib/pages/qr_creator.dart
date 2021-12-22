// ignore: file_names
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:math';

import 'package:uc_here/apiCalls/qr_logic.dart';

class QRCodeGen extends StatefulWidget {
  const QRCodeGen({Key? key}) : super(key: key);

  @override
  _QRCodeGenState createState() => _QRCodeGenState();
}

class _QRCodeGenState extends State<QRCodeGen> {
  Future<String> qrCodeFetch = getQrCode(1.toString());
  GlobalKey genKey = GlobalKey();

  Future<void> takePicture() async {
    RenderRepaintBoundary boundary =
        genKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 10);
    if (Platform.isAndroid) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.manageExternalStorage
      ].request(); //Permission.manageExternalStorage
    }
    final directory = (await getApplicationDocumentsDirectory()).path;
    print(directory);
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List pngBytes = byteData!.buffer.asUint8List();
    File imgFile = await File('$directory/photo.png').create(recursive: true);
    imgFile.writeAsBytes(pngBytes);
    print(pngBytes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: qrCodeFetch,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                        child: RepaintBoundary(
                            key: genKey,
                            child: Container(
                                width: 250.0,
                                height: 250.0,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  color: Colors.white,
                                ),
                                child: QrImage(
                                  data: snapshot.data!,
                                  version: QrVersions.auto,
                                  eyeStyle: const QrEyeStyle(
                                    eyeShape: QrEyeShape.square,
                                  ),
                                  dataModuleStyle: const QrDataModuleStyle(
                                    dataModuleShape: QrDataModuleShape.circle,
                                  ),
                                  padding: const EdgeInsets.all(20),
                                  foregroundColor: Colors.black,
                                )))),
                    ElevatedButton(
                        onPressed: () async {
                          await takePicture();
                        },
                        child: Text("Exportar"))
                  ]);
            }
            return const Center(child: CircularProgressIndicator());
          },
        ));
  }
}
