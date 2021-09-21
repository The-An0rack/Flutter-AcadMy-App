import 'package:flutter/material.dart';

import '../widgets/questions.dart';
import '../widgets/answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> ques;
  final Function answerQue;
  final int queIndex;

  Quiz({
    required this.answerQue,
    required this.ques,
    required this.queIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Question(ques[queIndex]["questionText"] as String),
          SizedBox(
            height: 100.0,
          ),
          ...(ques[queIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answers(
              () => answerQue(answer['score']),
              answer['text'].toString(),
            );
          }).toList(),
        ],
      ),
    );
  }
}
