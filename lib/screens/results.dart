import 'package:acadmy/screens/mainpage.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  int totalScore;
  Result(this.totalScore);

  String get resultPhrase {
    var resultText = "You did it!!!";

    if (totalScore <= 0)
      resultText = "You need to study harder";
    else if (totalScore <= 8)
      resultText = "A bit of push would be great!";
    else if (totalScore <= 16)
      resultText = "Keep Going!!!";
    else if (totalScore <= 20) resultText = "Amazing!!!";

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
              "Score: " + totalScore.toString() + "\n" + resultPhrase,
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: Text("Go Back To HomeOPage"))
          ],
        ),
      ),
    );
  }
}
