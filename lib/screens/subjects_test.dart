import 'package:acadmy_app/screens/loading_page.dart';
import 'package:flutter/material.dart';
import '../data/device_details.dart';
import '../model/test_model.dart';
import '../services/api_services.dart';
import 'result_screen.dart';

class SubjectsTest extends StatefulWidget {
  static String routeName = "/subject_test";
  int index = 0;
  int subjectCode;
  SubjectsTest({required this.subjectCode});

  @override
  State<SubjectsTest> createState() => _SubjectsTestState();
}

class _SubjectsTestState extends State<SubjectsTest> {
  late List<Questions>? _questions = [
    new Questions(id: 0, queText: "xxx", options: {"xx": true})
  ];
  late List<int> chosenAnswers;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();

    //Fetching data from API
    _getData(super.widget.subjectCode);
  }

  void _getData(int subjectCode) async {
    _questions = (await ApiService().getSubjectQuestions(subjectCode));
    Future.delayed(const Duration(seconds: 5)).then((value) => setState(() {}));
    if (_questions!.length > 3) {
      setState(() {
        isLoaded = true;
        chosenAnswers = List.filled(_questions!.length, -1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Visibility(
          visible: isLoaded,
          replacement: const LoadingScreen(),
          child: SingleChildScrollView(
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
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () {
                            Navigator.pushNamed(context, ResultScreen.routeName,
                                arguments: chosenAnswers);
                          },
                          child: const Text("Submit"),
                        ),

                        //Next Button
                        ElevatedButton(
                          onPressed: (super.widget.index <
                                  _questions!.length - 1)
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
                      "Q. ${super.widget.index + 1} / ${_questions!.length}",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    SizedBox(
                      height: DeviceDetails.height * 0.025,
                    ),
                    Text(
                      _questions![super.widget.index].queText,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Container(
                      height: DeviceDetails.height * 0.6,
                      margin: const EdgeInsets.all(40),
                      child: ListView.builder(
                        itemCount:
                            _questions![super.widget.index].options.length,
                        itemBuilder: ((context, idx) {
                          return GestureDetector(
                            onTapDown: (details) {
                              setState(() {
                                chosenAnswers[super.widget.index] = idx;
                                if (super.widget.index <
                                    _questions!.length - 1) {
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
                                  _questions![super.widget.index]
                                      .options
                                      .keys
                                      .elementAt(idx)
                                      .toString(),
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
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
      ),
    );
  }
}
