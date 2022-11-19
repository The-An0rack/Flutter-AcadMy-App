import 'package:acadmy_app/data/device_details.dart';
import 'package:acadmy_app/mock_data/test_ques.dart';
import 'package:acadmy_app/screens/result_screen.dart';
import 'package:flutter/material.dart';

class SubjectTest extends StatefulWidget {
  static String routeName = "/subject_test";
  int index = 0;
  List<int> chosenAnswers = List.filled(question.ques.length, -1);
  SubjectTest({Key? key}) : super(key: key);

  @override
  State<SubjectTest> createState() => _SubjectTestState();
}

class _SubjectTestState extends State<SubjectTest> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: (super.widget.index > 0)
                            ? (() {
                                setState(() {
                                  super.widget.index = super.widget.index - 1;
                                });
                              })
                            : null,
                        child: const Icon(Icons.keyboard_double_arrow_left),
                      ),

                      //Submit Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          Navigator.pushNamed(context, ResultScreen.routeName,
                              arguments: super.widget.chosenAnswers);
                        },
                        child: const Text("Submit"),
                      ),

                      //Next Button
                      ElevatedButton(
                        onPressed: (super.widget.index <
                                question.ques.length - 1)
                            ? (() {
                                setState(() {
                                  super.widget.index = super.widget.index + 1;
                                });
                              })
                            : null,
                        child: const Icon(Icons.keyboard_double_arrow_right),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: DeviceDetails.height * 0.05,
                  ),
                  Text(
                    "Q. ${super.widget.index + 1} / ${question.ques.length}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  SizedBox(
                    height: DeviceDetails.height * 0.025,
                  ),
                  Text(
                    question.ques[super.widget.index].queText,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Container(
                    height: DeviceDetails.height * 0.6,
                    margin: const EdgeInsets.all(40),
                    child: ListView.builder(
                      itemCount:
                          question.ques[super.widget.index].options.length,
                      itemBuilder: ((context, idx) {
                        return GestureDetector(
                          onTapDown: (details) {
                            setState(() {
                              super.widget.chosenAnswers[super.widget.index] =
                                  idx;
                              if (super.widget.index <
                                  question.ques.length - 1) {
                                super.widget.index = super.widget.index + 1;
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            height: DeviceDetails.height * 0.08,
                            decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(70)),
                            child: Center(
                              child: Text(
                                question.ques[super.widget.index].options[idx]
                                    .keys.first
                                    .toString(),
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
