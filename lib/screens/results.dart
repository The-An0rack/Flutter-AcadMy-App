import 'package:acadmy/models/user_profile.dart';
import 'package:acadmy/screens/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Result extends StatefulWidget {
  int totalScore;
  Result(this.totalScore);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {
  String get resultPhrase {
    var resultText = "You did it!!!";

    if (widget.totalScore <= 0)
      resultText = "You need to study harder";
    else if (widget.totalScore <= 8)
      resultText = "A bit of push would be great!";
    else if (widget.totalScore <= 16)
      resultText = "Keep Going!!!";
    else if (widget.totalScore <= 20) resultText = "Amazing!!!";

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
      showDialog(
        context: context,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );
      UserProfile.subQue[0]['correct'] =
          (UserProfile.subQue[0]['correct']! + widget.totalScore);
      UserProfile.subQue[0]['total'] = (UserProfile.subQue[0]['total']! + 5);
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
