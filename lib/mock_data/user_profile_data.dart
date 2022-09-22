import 'package:acadmy_app/model/user_profile.dart';

UserProfile user = UserProfile(
    name: "Dewashish Mehta",
    email: "dewashish@gmail.com",
    batch: "Target SDE",
    distinctions: 10,
    subjectAccuracy: [
      SubjectScore(correct: 10, total: 18),
      SubjectScore(correct: 20, total: 38),
      SubjectScore(correct: 22, total: 48),
      SubjectScore(correct: 30, total: 38),
      SubjectScore(correct: 11, total: 28),
    ]);
