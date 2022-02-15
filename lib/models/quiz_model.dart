class QuizTile {
  String title;
  int maxMarks;
  int noQue;

  QuizTile(this.title, this.maxMarks, this.noQue);
}

var quizData = [
  {
    "title": "Probability",
    "maxMarks": 20,
    "noQue": 5,
  },
  /* {
    "title": "Theory of Computation",
    "maxMarks": 20,
    "noQue": 5,
  },*/
];

List<QuizTile> quiz = quizData
    .map(
      (e) => QuizTile(
        e["title"].toString(),
        e['maxMarks'] as int,
        e['noQue'] as int,
      ),
    )
    .toList();
