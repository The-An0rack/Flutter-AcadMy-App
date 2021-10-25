import '../models/quiz_model.dart';
import '../screens/mock_quiz.dart';
import 'package:flutter/material.dart';

class QuizList extends StatelessWidget {
  const QuizList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      width: double.infinity,
      child: ListView.builder(
        itemCount: quizData.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100.0,
            child: ElevatedButton(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    quiz[index].title,
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text("Marks: ${quiz[index].maxMarks.toString()}"),
                  Text("Ques. ${quiz[index].noQue.toString()}")
                ],
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MockQuiz()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
