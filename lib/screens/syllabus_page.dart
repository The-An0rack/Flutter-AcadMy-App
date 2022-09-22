import 'package:flutter/material.dart';

class SyllabusPage extends StatefulWidget {
  SyllabusPage({Key? key}) : super(key: key);

  @override
  State<SyllabusPage> createState() => _SyllabusPageState();
}

class _SyllabusPageState extends State<SyllabusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("Syllabus")),
      ),
    );
  }
}
