import 'package:acadmy_app/data/device_details.dart';
import 'package:acadmy_app/data/sub_list.dart';
import 'package:acadmy_app/widgets/circular_meter.dart';
import 'package:flutter/material.dart';
import 'package:random_avatar/random_avatar.dart';

import '../mock_data/user_profile_data.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Widget avatar =
      randomAvatar(user.email, trBackground: true, height: 100, width: 100);

  @override
  Widget build(BuildContext context) {
    int queTotal = 0;
    int correctTotal = 0;
    double overallAcc = 0;
    List<double> subjectAcc = [];

    for (var i in user.subjectAccuracy) {
      if (i.total == 0) {
        subjectAcc.add(0);
      } else {
        double temp = i.correct.toDouble() / i.total.toDouble();
        subjectAcc.add(temp);
        queTotal += i.total;
        correctTotal += i.correct;
      }
    }

    overallAcc =
        (queTotal == 0) ? 0 : (correctTotal.toDouble() / queTotal.toDouble());

    return SingleChildScrollView(
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
                user.name,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              Text(
                "( ${user.email} )",
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                "Batch: ${user.batch}",
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
                        "${user.distinctions}",
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
            ],
          ),
        ),
      ),
    );
  }
}
