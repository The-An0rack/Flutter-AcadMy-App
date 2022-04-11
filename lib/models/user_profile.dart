import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  static late String email;
  static late String name;
  static late String batch;
  static late String picUrl =
      "https://cdn.pixabay.com/photo/2016/08/31/11/54/user-1633249_1280.png";
  static late double accuracy = 0;
  static late List<double> subAcc = [0, 0, 0, 0, 0];
  static List<String> subList = [
    "Aptitude",
    "Current Affairs",
    "Programming Logic",
    "Operating System",
    "DBMS"
  ];
  static List<Map<String, int>> subQue = [
    {'correct': 0, 'total': 0},
    {'correct': 0, 'total': 0},
    {'correct': 0, 'total': 0},
    {'correct': 0, 'total': 0},
    {'correct': 0, 'total': 0}
  ];

  static List<Map<String, int>> initSubQue() {
    return [
      {'correct': 0, 'total': 0},
      {'correct': 0, 'total': 0},
      {'correct': 0, 'total': 0},
      {'correct': 0, 'total': 0},
      {'correct': 0, 'total': 0}
    ];
  }

  //

  static void calculateAccuracy() {
    int total = 0, correct = 0;
    for (var i in subQue) {
      total += i['total']!.toInt();
      correct += i['correct']!.toInt();
    }
    if (total == 0)
      accuracy = 0;
    else
      accuracy = correct / total;

    int j = 0;
    for (var i in subQue) {
      double temp = (i['correct'])! /
          ((i['total']!.toInt() == 0) ? 1 : i['total']!.toInt());
      subAcc[j] = temp;
      j++;
    }
/*
    double temp = 0;

    for (var i in subAcc) {
      temp += i;
    }
    accuracy = temp / subList.length;*/
  }

  static Map<String, dynamic> toJson() {
    var json = {
      'email': email,
      'name': name,
      'batch': batch,
      'pic_url': picUrl,
      'sub_acc': subQue,
    };
    return json;
  }

  static Future<void> fetchUserData(String email) async {
    var response =
        await FirebaseFirestore.instance.collection('users').doc(email).get();

    var userData = response.data();

    print("-----------------------------------------------------Fetching---");

    UserProfile.name = userData!['name'].toString();
    print(UserProfile.name);
    UserProfile.email = userData['email'].toString();
    print(UserProfile.email);
    UserProfile.batch = userData['batch'].toString();
    print(UserProfile.batch);
    UserProfile.picUrl = userData['pic_url'].toString();
    print(userData['sub_acc'][0]);

    for (int i = 0; i < 5; i++) {
      subQue[i]['total'] = userData['sub_acc'][i]['total'];
      subQue[i]['correct'] = userData['sub_acc'][i]['correct'];
    }
    print(
        "-----------------------------------------------------Initialising---");
    calculateAccuracy();
  }
}
