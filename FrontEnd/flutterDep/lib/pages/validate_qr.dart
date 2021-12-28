import 'package:flutter/material.dart';
import 'package:uc_here/beta.dart';
import 'package:uc_here/const/constants.dart';
import 'package:uc_here/models/lecture.dart';

class ValidatePage extends StatefulWidget {
  const ValidatePage({Key? key}) : super(key: key);

  @override
  State<ValidatePage> createState() => _ValidatePageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ValidatePageState extends State<ValidatePage> {
  var qrCode;
  @override
  Widget build(BuildContext context) {
    var qrCode = ModalRoute.of(context)!.settings.arguments;
    saveDataBeta();
    for (Lecture lecture in myLectures) {
      if (lecture.qrcode == qrCode) {
        lecture.presenceChecked = true;
      }
    }
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              flex: 3,
              child: Transform.scale(
                alignment: Alignment.center,
                scale: 0.35,
                child: const DrawLogoQROnly(),
                origin: const Offset(25, 0),
              ),
            ),
            const Expanded(
              flex: 10,
              child: Text(
                "Validar",
                textAlign: TextAlign.start,
              ),
            )
          ],
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
        ),
        titleSpacing: 0,
        centerTitle: false,
        leadingWidth: 25,
        leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: qrCode != null ? Text("$qrCode") : const Text("Invalid code"),
      ),
    );
  }
}
