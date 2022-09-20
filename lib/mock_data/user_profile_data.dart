import 'package:acadmy_app/model/user_profile.dart';

UserProfile user = UserProfile(
    name: "Dewashish Mehta",
    email: "dewashish@gmail.com",
    batch: "Target SDE",
    subjectAccuracy: [
      new SubjectScore(correct: 10, total: 18),
      new SubjectScore(correct: 20, total: 38),
      new SubjectScore(correct: 22, total: 48),
      new SubjectScore(correct: 30, total: 38),
      new SubjectScore(correct: 11, total: 28),
    ]);
