import 'package:acadmy_app/data/device_details.dart';
import 'package:acadmy_app/mock_data/test_ques.dart';
import 'package:acadmy_app/screens/homepage.dart';
import 'package:acadmy_app/widgets/circular_meter.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static String routeName = "/result";

  int correct = 0;
  int skips = 0;

  ResultScreen({Key? key}) : super(key: key);

  List<int> checkAnswers(List<int> chosenAnswers) {
    List<int> res = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      if (chosenAnswers[i] == -1) {
        skips++;
        res.add(2);
      } else {
        if (question.ques[i].options[chosenAnswers[i]].values.first == true) {
          res.add(0);
          correct++;
        } else {
          res.add(1);
        }
      }
    }
    return res;
  }

  Color getColor(int val) {
    switch (val) {
      case 0:
        return Colors.green;
      case 1:
        return Colors.red;
      default:
        return Colors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> chosenAnswers =
        ModalRoute.of(context)!.settings.arguments as List<int>;

    List<int> result = checkAnswers(chosenAnswers);

    return Scaffold(
        body: Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Text("Result",
                style: Theme.of(context).textTheme.displayMedium),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              circularMeter(
                  (correct.toDouble() /
                      (chosenAnswers.length - skips).toDouble()),
                  context,
                  "Accuracy"),
              circularMeter(
                  ((chosenAnswers.length - skips).toDouble() /
                      chosenAnswers.length.toDouble()),
                  context,
                  "Attemp Ratio"),
            ],
          ),
          Text(
            "Question wise Performance",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: DeviceDetails.height * 0.5,
            child: Center(
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 40,
                      childAspectRatio: 1,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: chosenAnswers.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: getColor(result[index])),
                      child: Center(
                          child: Text(
                        index.toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      )),
                    );
                  }),
            ),
          ),
          Container(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, HomePage.routeName);
                },
                child: const Text("GoTo Dashboard")),
          )
        ],
      ),
    ));
  }
}
