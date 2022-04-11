import 'package:acadmy/models/user_profile.dart';
import 'package:acadmy/screens/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  int totalScore;
  int _quizIndex;
  Result(this.totalScore, this._quizIndex);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String get resultPhrase {
    var resultText = "You did it!!!";

    if (widget.totalScore == 0)
      resultText = "You need to study harder";
    else if (widget.totalScore <= 3)
      resultText = "A bit of push would be great!";
    else if (widget.totalScore <= 4)
      resultText = "Keep Going!!!";
    else if (widget.totalScore == 5) resultText = "Amazing!!!";

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Score: " + widget.totalScore.toString() + "\n" + resultPhrase,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(onPressed: res, child: Text("Go Back To HomeOPage"))
          ],
        ),
      ),
    );
  }

  Future res() async {
    {
      print("-----------------------------------------------------Data---");
      print(widget._quizIndex);
      UserProfile.subQue[widget._quizIndex]['correct'] =
          (UserProfile.subQue[widget._quizIndex]['correct']! +
              widget.totalScore);
      UserProfile.subQue[widget._quizIndex]['total'] =
          (UserProfile.subQue[widget._quizIndex]['total']! + 5);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(UserProfile.email)
          .update({'sub_acc': UserProfile.subQue});
      setState(() {
        UserProfile.calculateAccuracy();
      });
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MainPage()),
      );
    }
  }
}
