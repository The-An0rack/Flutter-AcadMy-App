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

  //

  static void calculateAccuracy() {
    for (var i in subQue) {
      double temp = (i['correct'])! / i['total']!.toInt();
      print(temp);
      subAcc.add(temp);
    }

    double temp = 0;
    for (var i in subAcc) {
      temp += i;
    }
    accuracy = temp / subList.length;
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

    name = userData!['name'].toString();
    email = userData['email'].toString();
    batch = userData['batch'].toString();
    picUrl = userData['pic_url'].toString();

    subAcc[0] = userData['sub_acc'][0];
    subAcc[1] = userData['sub_acc'][1];
    subAcc[2] = userData['sub_acc'][2];
    subAcc[3] = userData['sub_acc'][3];
    subAcc[4] = userData['sub_acc'][4];
    print(
        "-----------------------------------------------------Initialising---");
    calculateAccuracy();
  }
}
