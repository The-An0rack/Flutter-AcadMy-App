class SubjectScore {
  int correct;
  int total;

  SubjectScore({required this.correct, required this.total});
}

class UserProfile {
  String name;
  String email;
  String batch;
  int distinctions;
  List<SubjectScore> subjectAccuracy;

  UserProfile(
      {required this.name,
      required this.email,
      required this.batch,
      required this.distinctions,
      required this.subjectAccuracy});
}
