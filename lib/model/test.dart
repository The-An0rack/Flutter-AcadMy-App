class Question {
  String queText;
  List<Map<String, bool>> options;

  Question({required this.queText, required this.options});
}

class Test {
  List<Question> ques;
  Test({required this.ques});
}
