import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(
        "Q." + questionText,
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
