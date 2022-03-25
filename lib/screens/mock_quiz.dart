import 'package:flutter/material.dart';

import '../../screens/quiz.dart';
import '../../screens/results.dart';

class MockQuiz extends StatefulWidget {
  MockQuiz({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MockQuiz> {
  final _ques = [
    {
      'questionText':
          'What are the chances that no two boys are sitting together for a photograph if there are 5 girls and 2 boys?',
      'answers': [
        {'text': '1 / 27', 'score': 0},
        {'text': '1 / 7', 'score': 0},
        {'text': '2 / 7', 'score': 0},
        {'text': '5 / 7', 'score': 1}
      ],
    },
    {
      'questionText':
          "What is probability of drawing two clubs from a well shuffled pack of 52 cards?",
      'answers': [
        {'text': '13 / 51', 'score': 0},
        {'text': '1 / 17', 'score': 1},
        {'text': '1 / 26', 'score': 0},
        {'text': '13 / 17', 'score': 0}
      ],
    },
    {
      'questionText':
          "When two coins are tossed simultaneously, what are the chances of getting at least one tail?",
      'answers': [
        {'text': '3 / 1', 'score': 1},
        {'text': '1 / 5', 'score': 0},
        {'text': '1 / 5', 'score': 0},
        {'text': '1 / 1', 'score': 0}
      ],
    },
    {
      'questionText':
          "What is the possibility of having 53 Thursdays in a non-leap year?",
      'answers': [
        {'text': '6 / 7', 'score': 0},
        {'text': '1 / 7', 'score': 1},
        {'text': '1 / 365', 'score': 0},
        {'text': '53 / 365', 'score': 0}
      ],
    },
    {
      'questionText':
          "A box has 6 black, 1 red, 2 white and 3 blue shirts. What is the probability that 2 red shirts and 1 blue shirt get chosen during a random selection of 3 shirts from the box?",
      'answers': [
        {'text': '18 / 455', 'score': 1},
        {'text': '7 / 15', 'score': 0},
        {'text': '7 / 435', 'score': 0},
        {'text': '7 / 2730', 'score': 0}
      ],
    },
  ];

  var _queIndex = 0;
  var _totalScore = 0;

  void _answerQue(int score) {
    _totalScore += score;
    setState(() {
      _queIndex = (_queIndex + 1);
    });
    print(_queIndex);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "AcadMy App",
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.quiz_outlined),
          title: Text("Probability Quiz 1"),
        ),
        body: Container(
          child: (_queIndex < _ques.length)
              ? Quiz(answerQue: _answerQue, ques: _ques, queIndex: _queIndex)
              : Result(_totalScore),
        ),
      ),
    );
  }
}
