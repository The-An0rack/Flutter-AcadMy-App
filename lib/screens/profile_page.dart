import 'package:acadmy_app/data/device_details.dart';
import 'package:acadmy_app/data/sub_list.dart';
import 'package:acadmy_app/screens/welcome.dart';
import 'package:acadmy_app/services/api_services.dart';
import 'package:acadmy_app/widgets/circular_meter.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:random_avatar/random_avatar.dart';

import '../mock_data/user_profile_data.dart';
import '../model/user_profile.dart';
import '../services/authentication.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  var isLoaded = false;
  late User? userDetails;
  Widget avatar = randomAvatar(UserCoreDetails.email,
      trBackground: true, height: 100, width: 100);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //Fetching data from API
    _getData(UserCoreDetails.email);
  }

  void _getData(String userEmail) async {
    userDetails = (await ApiService().getUserData(userEmail));
    if (userDetails!.accuracy.isNotEmpty) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    int queTotal = 0;
    int correctTotal = 0;
    double overallAcc = 0;
    List<double> subjectAcc = [];
    List<String?> subjectNames = [];

    userDetails!.accuracy.forEach((key, value) {
      subjectNames.add(SubjectList.subList[key]);
      if (value[1] == 0) {
        subjectAcc.add(0);
      } else {
        double temp = value[0].toDouble() / value[1].toDouble();
        subjectAcc.add(temp);
        queTotal += value[1];
        correctTotal += value[0];
      }
    });

    // for (var i in userDetails!.accuracy) {
    //   if (i.total == 0) {
    //     subjectAcc.add(0);
    //   } else {
    //     double temp = i.correct.toDouble() / i.total.toDouble();
    //     subjectAcc.add(temp);
    //     queTotal += i.total;
    //     correctTotal += i.correct;
    //   }
    // }

    overallAcc =
        (queTotal == 0) ? 0 : (correctTotal.toDouble() / queTotal.toDouble());

    return Visibility(
      visible: isLoaded,
      replacement: const Center(
        child: CircularProgressIndicator(),
      ),
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Details Block
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blueGrey),
                    child: avatar),
                Text(
                  userDetails!.name,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  "( ${userDetails!.email} )",
                  style: Theme.of(context).textTheme.displaySmall,
                ),

                // Distinction Block
                Container(
                  height: DeviceDetails.height * 0.10,
                  margin: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.military_tech_outlined,
                          size: 40,
                          color: Colors.yellow,
                        ),
                        Text(
                          "${userDetails!.distinctions}",
                          style: const TextStyle(
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //Accuracy Block
                Text(
                  "Overall Accuracy",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                circularMeter(overallAcc, context, ""),
                Text(
                  "Individual Accuracy",
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(
                  height: DeviceDetails.height * 0.2,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: subjectAcc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return circularMeter(subjectAcc[index], context,
                          SubjectList.subList["Target SDE"]![index]);
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    AuthService.logOut();
                    Navigator.pushReplacementNamed(
                        context, WelcomeScreen.routeName);
                  },
                  child: const Text("Log Out"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
