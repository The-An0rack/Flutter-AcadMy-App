import 'package:acadmy_app/data/device_details.dart';
import 'package:acadmy_app/data/sub_list.dart';
import 'package:acadmy_app/widgets/subject_test_tile.dart';
import 'package:flutter/material.dart';

import '../mock_data/test_details_data.dart';
import '../mock_data/user_profile_data.dart';
import '../widgets/mock_test_tile.dart';

class Dashboard extends StatelessWidget {
  static String routeName = '/dashboard';
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header Intro
          Text(
            "Hello,",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            UserCoreDetails.name,
            style: Theme.of(context).textTheme.displayMedium,
          ),

          //Mock Test Side Scroller
          Text(
            "Mock Test",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Container(
            // padding: const EdgeInsets.all(5),
            margin: const EdgeInsets.all(5),
            height: DeviceDetails.height * 0.2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mockTestsDetails.tests.length,
              itemBuilder: ((context, index) {
                return mockTestTile(context, mockTestsDetails.tests[index].name,
                    mockTestsDetails.tests[index].totalQue);
              }),
            ),
          ),

          //GridView of SubjectWise Test
          Text(
            "Subject Wise Test",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: DeviceDetails.height * 0.48,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 240,
                    childAspectRatio: 1,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: UserCoreDetails.subjects,
                itemBuilder: (context, index) =>
                    subjectTestTile(context, index),
              ),
            ),
          )
        ],
      ),
    );
  }
}
