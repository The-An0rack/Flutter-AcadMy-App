class QuizTile {
  String title;
  int maxMarks;
  int noQue;

  QuizTile(this.title, this.maxMarks, this.noQue);
}

var quizData = [
  {
    "title": "Aptitude",
    "maxMarks": 5,
    "noQue": 5,
  },
  {
    "title": "Current Affairs",
    "maxMarks": 5,
    "noQue": 5,
  },
  {
    "title": "Programming Logic",
    "maxMarks": 5,
    "noQue": 5,
  },
  {
    "title": "Operating Systems",
    "maxMarks": 5,
    "noQue": 5,
  },
  {
    "title": "DBMS",
    "maxMarks": 5,
    "noQue": 5,
  },
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
