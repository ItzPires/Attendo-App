import 'package:flutter/material.dart';

class ValidatePage extends StatefulWidget {
  const ValidatePage({Key? key, this.code}) : super(key: key);
  final String? code;

  @override
  State<ValidatePage> createState() => _ValidatePageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ValidatePageState extends State<ValidatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Verify your class')),
      body: Center(
        child: widget.code != null
            ? Text("${widget.code}")
            : const Text("Invalid code"),
      ),
    );
  }
}
