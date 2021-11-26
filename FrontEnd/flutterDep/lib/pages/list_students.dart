// THIS IS A TEST FILE
import 'package:flutter/material.dart';

class ListStudents extends StatefulWidget {
  const ListStudents({Key? key}) : super(key: key);

  @override
  State<ListStudents> createState() => _ListStudentsPageState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _ListStudentsPageState extends State<ListStudents> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('')),
      extendBody: false,
    );
  }
}
