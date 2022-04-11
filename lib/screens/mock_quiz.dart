import 'dart:math';

import 'package:flutter/material.dart';

import '../../screens/quiz.dart';
import '../../screens/results.dart';

class MockQuiz extends StatefulWidget {
  String _quizTitle;
  int _quizIndex;

  MockQuiz(this._quizTitle, this._quizIndex);
  @override
  _MockQuizState createState() => _MockQuizState();
}

class _MockQuizState extends State<MockQuiz> {
  var _queIndex = 0;
  var _totalScore = 0;
  var _totalQues = 5;
  var _initVal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _queIndex = Random().nextInt(4);
    _initVal = _queIndex;
  }

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
          title: Text(widget._quizTitle),
        ),
        body: Container(
          child: (_queIndex < _totalQues + _initVal)
              ? Quiz(
                  answerQue: _answerQue,
                  ques: _ques[widget._quizIndex % 5],
                  queIndex: _queIndex % 5)
              : Result(_totalScore, widget._quizIndex),
        ),
      ),
    );
  }

  final _ques = [
    [
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
    ],
    //Current Affairs
    [
      {
        'questionText': "Who is author of book - Seven Heroes of 1971?",
        'answers': [
          {'text': 'Man Aman Singh Chhina', 'score': 1},
          {'text': 'Chetan Bhagat', 'score': 0},
          {'text': 'Atul Chandra', 'score': 0},
          {'text': 'Kulpreet Yadav', 'score': 0}
        ],
      },
      {
        'questionText': "Who is Prime Minister of India?",
        'answers': [
          {'text': 'Shri L. K. Adwani', 'score': 0},
          {'text': 'Shri Narendra Modi', 'score': 1},
          {'text': 'Shri Rajnath Singh', 'score': 0},
          {'text': 'Shri Nitin Gatkart', 'score': 0}
        ],
      },
      {
        'questionText': "Who is President of India?",
        'answers': [
          {'text': 'Shri L. K. Adwani', 'score': 0},
          {'text': 'Shri Ramnath Kovind', 'score': 1},
          {'text': 'Shri Rajnath Singh', 'score': 0},
          {'text': 'Shri Nitin Gatkart', 'score': 0}
        ],
      },
      {
        'questionText': "Where is capital of India?",
        'answers': [
          {'text': 'Mumbai', 'score': 0},
          {'text': 'Pune', 'score': 0},
          {'text': 'New Delhi', 'score': 1},
          {'text': 'Banglore', 'score': 0}
        ],
      },
      {
        'questionText': "Where is financial capital of India?",
        'answers': [
          {'text': 'Mumbai', 'score': 1},
          {'text': 'Pune', 'score': 0},
          {'text': 'Mew Delhi', 'score': 0},
          {'text': 'Banglore', 'score': 0}
        ],
      },
    ],

    //Programming Logic
    [
      {
        'questionText':
            "The value obtained in the function is given back to the main by using which keyword?",
        'answers': [
          {'text': 'return', 'score': 1},
          {'text': 'static', 'score': 0},
          {'text': 'new', 'score': 0},
          {'text': 'volatile', 'score': 0}
        ],
      },
      {
        'questionText': "How are string represented in memory in C?",
        'answers': [
          {'text': 'Object of some class', 'score': 0},
          {'text': 'An array of characters', 'score': 1},
          {'text': 'LinkedList of characters', 'score': 0},
          {'text': 'As a data type on its own', 'score': 0}
        ],
      },
      {
        'questionText':
            "A data-type is stored as 6 bit signed integer. Which of following cannot be represented by this type?",
        'answers': [
          {'text': '-12', 'score': 0},
          {'text': '32', 'score': 1},
          {'text': '6', 'score': 0},
          {'text': '18', 'score': 0}
        ],
      },
      {
        'questionText':
            "Which of following options is an exception to being a part of composite data type?",
        'answers': [
          {'text': 'Union', 'score': 0},
          {'text': 'Structure', 'score': 0},
          {'text': 'Stacks', 'score': 1},
          {'text': 'Array', 'score': 0}
        ],
      },
      {
        'questionText':
            "Which is used to convert source code to target language?",
        'answers': [
          {'text': 'Compiler', 'score': 1},
          {'text': 'Linker', 'score': 0},
          {'text': 'Loader', 'score': 0},
          {'text': 'Executer', 'score': 0}
        ],
      },
    ],
    //Operating System
    [
      {
        'questionText':
            "In operating systems, which of the following is/are CPU scheduling algorithms?",
        'answers': [
          {'text': 'Priority', 'score': 0},
          {'text': 'Round Robin', 'score': 0},
          {'text': 'Shortest job first', 'score': 0},
          {'text': 'All of the above', 'score': 1}
        ],
      },
      {
        'questionText': "CPU Scheduling is the basis of?",
        'answers': [
          {'text': 'Multiprogramming Operating Systems', 'score': 1},
          {'text': 'Larger memoory sized items', 'score': 0},
          {'text': 'Multiprocessor Systems', 'score': 0},
          {'text': 'None of these', 'score': 0}
        ],
      },
      {
        'questionText':
            "If a process fails, most OS write error information to a?",
        'answers': [
          {'text': 'Another Running Process', 'score': 0},
          {'text': 'Log File', 'score': 1},
          {'text': 'New File', 'score': 0},
          {'text': 'None of these', 'score': 0}
        ],
      },
      {
        'questionText': "Which of the following is not a real time OS?",
        'answers': [
          {'text': 'QNX', 'score': 0},
          {'text': 'RT Linux', 'score': 0},
          {'text': 'Palm OS', 'score': 1},
          {'text': 'VXWorks', 'score': 0}
        ],
      },
      {
        'questionText':
            "In a timeshare OS, when the timeslot assigned to a process is completed, the process switches from current state to?",
        'answers': [
          {'text': 'Ready State', 'score': 1},
          {'text': 'Suspended State', 'score': 0},
          {'text': 'Terminated State', 'score': 0},
          {'text': 'Blocked State', 'score': 0}
        ],
      },
    ],
    //DBMS
    [
      {
        'questionText': "What is full form of DBMS?",
        'answers': [
          {'text': 'Database Management System', 'score': 1},
          {'text': 'Database Management Service', 'score': 0},
          {'text': 'Data of Binary Management System', 'score': 0},
          {'text': 'Data Backup Management System', 'score': 0}
        ],
      },
      {
        'questionText': "Which of following is not a function of the database?",
        'answers': [
          {'text': 'Managing stored data', 'score': 0},
          {'text': 'Analysing Code', 'score': 1},
          {'text': 'Security for stored data', 'score': 0},
          {'text': 'Manipulating Data', 'score': 0}
        ],
      },
      {
        'questionText': "Which of the following is a component of DBMS?",
        'answers': [
          {'text': 'Data', 'score': 0},
          {'text': 'Data Languages', 'score': 0},
          {'text': 'Data Manager', 'score': 0},
          {'text': 'All of the above', 'score': 1}
        ],
      },
      {
        'questionText': "The information about data is called?",
        'answers': [
          {'text': 'Hyper Data', 'score': 0},
          {'text': 'Tera Data', 'score': 0},
          {'text': 'Meta Data', 'score': 1},
          {'text': 'Relations', 'score': 0}
        ],
      },
      {
        'questionText': "Where is financial capital of India?",
        'answers': [
          {'text': 'Collection of Tables', 'score': 1},
          {'text': 'Collection of Keys', 'score': 0},
          {'text': 'Collection of Records', 'score': 0},
          {'text': 'Collection of Fields', 'score': 0}
        ],
      },
    ],
  ];
}
