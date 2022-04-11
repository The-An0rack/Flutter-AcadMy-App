import '../models/quiz_model.dart';
import '../screens/mock_quiz.dart';
import 'package:flutter/material.dart';

class QuizList extends StatelessWidget {
  const QuizList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      width: double.infinity,
      child: Scrollbar(
        child: ListView.builder(
          itemCount: quizData.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(5),
              height: 120.0,
              child: ElevatedButton(
                child: Container(
                  padding: EdgeInsets.only(top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        quiz[index].title,
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Marks: ${quiz[index].maxMarks.toString()}"),
                      Text("Ques. ${quiz[index].noQue.toString()}"),
                      SizedBox(
                        height: 20.0,
                      ),
                      SizedBox(
                        height: 5,
                      )
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MockQuiz(quiz[index].title, index),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
